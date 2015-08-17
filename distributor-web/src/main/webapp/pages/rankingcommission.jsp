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
	    <ul class="nav nav-tabs">
	        <li class="active"><a href="#tab1" data-toggle="tab">周提成排行</a></li>
	        <li><a href="#tab2" data-toggle="tab">月提成排行</a></li>
	        <li><a href="#tab3" data-toggle="tab">年度提成排行</a></li>
	    </ul>
	    <div class="tab-content">
	        <div class="tab-pane active" id="tab1">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-grey"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tr><td>1</td><td class="distributor-font">&nbsp;余扬</td><td>56235123</td><td>7998.5</td></tr>									
					<tr><td>2</td><td class="distributor-font">&nbsp;王志华</td><td>262354223</td><td>6998.5</td></tr>
					<tr><td>3</td><td class="distributor-font">&nbsp;李东升</td><td>33232323</td><td>5998.5</td></tr>
					<tr><td>4</td><td class="distributor-font">&nbsp;刘春生</td><td>906235123</td><td>4998.5</td></tr>
					<tr><td>5</td><td class="distributor-font">&nbsp;宗明</td><td>86235123</td><td>3998.5</td></tr>
					<tr><td>6</td><td class="distributor-font">&nbsp;高山峰</td><td>99235123</td><td>2998.5</td></tr>
					<tr><td>7</td><td class="distributor-font">&nbsp;风飞沙</td><td>45235123</td><td>998.5</td></tr>
					<tr><td>8</td><td class="distributor-font">&nbsp;唐四藏</td><td>236235123</td><td>298.5</td></tr>
				</table>
			</div>
	        <div class="tab-pane fade" id="tab2">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-grey"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tr><td>1</td><td class="distributor-font">&nbsp;余扬</td><td>56235123</td><td>7998.5</td></tr>									
					<tr><td>2</td><td class="distributor-font">&nbsp;王志华</td><td>262354223</td><td>6998.5</td></tr>
					<tr><td>3</td><td class="distributor-font">&nbsp;李东升</td><td>33232323</td><td>5998.5</td></tr>
					<tr><td>4</td><td class="distributor-font">&nbsp;刘春生</td><td>906235123</td><td>4998.5</td></tr>
					<tr><td>5</td><td class="distributor-font">&nbsp;宗明</td><td>86235123</td><td>3998.5</td></tr>
					<tr><td>6</td><td class="distributor-font">&nbsp;高山峰</td><td>99235123</td><td>2998.5</td></tr>
					<tr><td>7</td><td class="distributor-font">&nbsp;风飞沙</td><td>45235123</td><td>998.5</td></tr>
					<tr><td>8</td><td class="distributor-font">&nbsp;唐四藏</td><td>236235123</td><td>298.5</td></tr>
				</table>
			</div>
			<div class="tab-pane fade" id="tab3">
	        	<br/>
				<table class="table table-striped table-hover">
					<tr class="table-title-grey"><td width="10%">名次</td><td width="15%">分销商姓名</td><td width="15%">分销商ID</td><td width="15%">提成金额(元)</td></tr>
					<tr><td>1</td><td class="distributor-font">&nbsp;余扬</td><td>56235123</td><td>7998.5</td></tr>									
					<tr><td>2</td><td class="distributor-font">&nbsp;王志华</td><td>262354223</td><td>6998.5</td></tr>
					<tr><td>3</td><td class="distributor-font">&nbsp;李东升</td><td>33232323</td><td>5998.5</td></tr>
					<tr><td>4</td><td class="distributor-font">&nbsp;刘春生</td><td>906235123</td><td>4998.5</td></tr>
					<tr><td>5</td><td class="distributor-font">&nbsp;宗明</td><td>86235123</td><td>3998.5</td></tr>
					<tr><td>6</td><td class="distributor-font">&nbsp;高山峰</td><td>99235123</td><td>2998.5</td></tr>
					<tr><td>7</td><td class="distributor-font">&nbsp;风飞沙</td><td>45235123</td><td>998.5</td></tr>
					<tr><td>8</td><td class="distributor-font">&nbsp;唐四藏</td><td>236235123</td><td>298.5</td></tr>
				</table>
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
	//初始化页面
	$.ajax({
		type:"GET",
		url:"/distributor/users/list/0",
	 	success: function(data) {
	 		coreFunction(data);
		}
	})
	
	//核心方法
	function coreFunction(data){
		if(data.success){
			var para = '';
			$(data.content).each(function (key,value) { //遍历返回的json   
				var status = value.status == 1 ? '新建':value.status == 2 ? '审核通过':'审核拒绝';
				para += '<tr><td>'+ value.name + 
                        '</td><td>'+ value.mobile +'</td><td>'+ status + 
                        '</td><td>'+ value.displayCreateTime +'</td><td>' +
                        '<a class="green"><i class="ace-icon fa fa-check"></i>&nbsp;通过&nbsp;&nbsp;</a>'+
                        '<a class="orange"><i class="ace-icon fa fa-times"></i>&nbsp;拒绝&nbsp;&nbsp;</a>'+
                        '<a class="red"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'+
                        '</td></tr>';        
            });
			$("#content-table").empty();
            $("#content-table").append(para);
            $("#statics").html('总记录数： '+data.total);
            
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
                    url: "/distributor/list/" + index,
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                    	alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    },
                    success: function(data) {
                        if (data.success) {
                        	var para = '';
            				$(data.content).each(function (key,value) { //遍历返回的json   
            					var name;
            					var level;
            					if (value.owner != null){
            						name = value.owner.name;
            					} else {
            						name= '暂无';
            					}
            					para += '<tr><td>'+ value.name + 
                                        '</td><td>'+ value.id +'</td><td>'+ value.level + 
                                        '</td><td>'+ name +'</td><td><a href="/distributor/distributorSubmember/'+ value.id +'">查看</a></td><td>' +
                                        '<a class="blue" href="/distributor/distributorEdit/${item.id}">' +
                                        '<i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
            							'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
                                        '</td></tr>';        
                            });
            				$("#content-table").empty();
                            $("#content-table").append(para);
                            $("#statics").html('总记录数： '+data.total);
                            $('.deleteBtn').click(function(){
                        		var id = $(this).attr('id');
                        		var url= "/distributor/distributorDelete/"+id;
                        		$("#deleteUrl").attr("href",url); 
                        		return true;
                        	});
                        }
                    }
                });
            };
		}
	}
})

</script>
</body>
</html>