<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="/distributor/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/distributor/css/font-awesome.css"/>
<link rel="stylesheet" href="/distributor/css/distributorlist.css"/>
<link rel="stylesheet" href="/distributor/css/common.css"/>
<link rel="stylesheet" href="/distributor/css/pagination.css"/>
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>提成排行</b>
		</h4>
	</div>
	<div class="tabbable">
	    <ul class="nav nav-tabs trigger-tabs">
	        <li class="active"><a href="#tab1" data-toggle="tab" data-id='1' class="init-tab">周提成排行</a></li>
	        <li><a href="#tab2" data-toggle="tab" data-id='2'>月提成排行</a></li>
	        <li><a href="#tab3" data-toggle="tab" data-id='3'>年度提成排行</a></li>
	    </ul>
	    <div class="tab-content">
	        <div class="tab-pane active" id="tab1">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-blue"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tbody id="content-table1"></tbody>
				</table>
				 <div id="bottom-tip1" style="background-color:#eff3f8;height:60px;margin-top:-20px;display:none">
					<div class="col-sm-3"><span id ="statics1" style="line-height:60px"></span></div>
					<div class="col-sm-9"><div id="pagination1" style="float:right"></div></div>
				</div>
			</div>
		
	        <div class="tab-pane fade" id="tab2">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-blue"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tbody id="content-table2"></tbody>
				</table>
				<div id="bottom-tip2" style="background-color:#eff3f8;height:60px;margin-top:-20px;display:none">
					<div class="col-sm-3"><span id ="statics2" style="line-height:60px"></span></div>
					<div class="col-sm-9"><div id="pagination2" style="float:right"></div></div>
				</div>
			</div>
			<div class="tab-pane fade" id="tab3">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-blue"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tbody id="content-table3"></tbody>
				</table>
				<div id="bottom-tip3" style="background-color:#eff3f8;height:60px;margin-top:-20px;display:none">
					<div class="col-sm-3"><span id ="statics3" style="line-height:60px"></span></div>
					<div class="col-sm-9"><div id="pagination3" style="float:right"></div></div>
				</div>
	    	</div>
	    </div>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/jquery.pagination.js"></script>
<script type="text/javascript">

$(function (){
	var pageIndex = 0; //页面索引初始值
	var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
	/* var type = 1;   //排行类型 1：按周  2：按月 3：按年
	var rank=1;     //初始化排名 
	coreFunction(type, rank);*/
	coreFunction(1, 1);
	
	$(".trigger-tabs a").click(function (e) {
		var rank = 1;
		var type = $(this).data('id');
		$(this).tab('show');
        coreFunction(type, rank);
    });
	
	//核心方法
	function coreFunction(type, rank){
		$.ajax({
			type:"GET",
			url:'/distributor/commission/ranking/'+ type+ '/' + pageIndex,
		 	success: function(data) {
		 		/* coreFunction(data.content); */
		 		if(data.success){
					var para = '';
					for(var index in data.content.content){
						var value = data.content.content[index];
						para +='<tr class="row-color"><td class="column">' + (rank++) +
								'</td><td>'+ value.distributor.name + 
		                        '</td><td>'+ value.distributorId +'</td><td>'+ 
		                        value.commission/100 +'</td></tr>';        
					}
					var selector = '#content-table'+ type
					$(selector).empty();
		            $(selector).append(para);
		            $("#statics").html('总记录数： '+data.content.total);
		            $('#bottom-tip').css('display','block'); 
				}
		 		//分页，PageCount是总条目数，这是必选参数，其它参数都是可选
	            $('#pagination').pagination(data.total, {
	                callback: PageCallback, 
	                prev_text: '<<',
	                next_text: '>>',
	                items_per_page:pageSize,
	                num_edge_entries: 2, //两侧首尾分页条目数
	                num_display_entries: 5, //连续分页主体部分分页条目数
	                current_page: pageIndex, //当前页索引
	            });
		 		
	          //翻页调用
	            function PageCallback(index, jq) {
	                $.ajax({
	                    type: 'GET',
	                    url: '/distributor/commission/ranking/'+ type+ '/'  + index,
	                    error:function(XMLHttpRequest, textStatus, errorThrown){
	                    	alert(XMLHttpRequest.status);
	                        alert(XMLHttpRequest.readyState);
	                        alert(textStatus);
	                    },
	                    success: function(data) {
	                        if (data.success) {
	                        	var para = '';
	            				$(data.content).each(function (key,value) { //遍历返回的json   
	            					para +='<tr class="row"><td class="column">' + (rank++)
	            							'<td><td>'+ value.distributor.name + 
	            	                        '</td><td>'+ value.distributorId +'</td><td>'+ status + 
	            	                        '</td><td>'+ value.commission +'</td></tr>';        
	                            });
	            				$("#content-table").empty();
	                            $("#content-table").append(para);
	                            $("#statics").html('总记录数： '+data.total);
	                            $('#bottom-tip').css('display','block');

	                        }
	                    }
	                });
	            };
			}
		})
	}
})

</script>
</body>
</html>