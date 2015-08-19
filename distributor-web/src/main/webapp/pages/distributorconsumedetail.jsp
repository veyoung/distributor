<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="/distributor/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/distributor/css/datepicker.css"/>
<link rel="stylesheet" href="/distributor/css/font-awesome.css"/>
<link rel="stylesheet" href="/distributor/css/distributorlist.css"/>
<link rel="stylesheet" href="/distributor/css/common.css"/>
<link rel="stylesheet" href="/distributor/css/pagination.css"/>
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>分销商消费查询</b>
		</h4>
	</div>
	<form id="distributorConsumeForm" class="form-horizontal" role="form">
         <div class="form-group">
		    <label class="col-sm-2 control-label" for="distributorId">分销商ID</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" id="distributorId" placeholder="输入分销商ID">
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">起始日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" data-date-format="yyyy-mm-dd" id="startTime" placeholder="请选择起始日期" >
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">截止日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" data-date-format="yyyy-mm-dd" id="endTime" placeholder="请选择截止日期">
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission"></label>
		    <div class="col-sm-4">
		    	<button type="submit" class="btn btn-primary btn-primary">查询&nbsp;&nbsp;<i class="glyphicon glyphicon-search"></i></button>
		    </div>
		 </div>		 					 
    </form>
	<div>
		<table class="table table-striped table-hover table-bordered">
			<tr class="table-title-gray">
				<td width="25%" class="distributor-font">消费时间</td>
				<td width="20%">消费金额(元)</td>
				<td width="20%">所获积分(元)</td>
				<td width="20%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan='4'>暂无消费记录</td></tr></tbody>
		</table>
		<div style="background-color:#eff3f8;height:60px;margin-top:-20px">
			<div class="col-sm-3"><span id ="statics" style="line-height:60px"></span></div>
			<div class="col-sm-9"><div id="pagination" style="float:right"></div></div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   		aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">
              		提示
            	</h4>
         		</div>
         		<div class="modal-body"></div>
         		<div class="modal-footer">
            		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary btn-ok">确定</button>
         		</div>
      		</div>
		</div>
	</div>
	
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/bootstrap-datepicker.js"></script>
<script src="/distributor/js/jquery.pagination.js"></script>
<script type="text/javascript">
var pageIndex = 0; //页面索引初始值
var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
$(function(){
	$('#startTime').datepicker();         
	$('#endTime').datepicker();   
	$('#distributorConsumeForm').on('submit',function(){
		if($('#distributorId').val() == ''){
			$('#myModal').modal('show');
			$('.modal-body').html('请输入分销商ID');
			$('.btn-ok').attr("style","display:none;");
			//alert('请输入分销商ID');
			return false;
		}
		if($('#startTime').val() == ''){
			$('#myModal').modal('show');
			$('.modal-body').html('请选择起始日期');
			$('.btn-ok').attr("style","display:none;");
			//alert('请选择起始日期');
			return false;
		}s
		if($('#endTime').val() == ''){
			$('#myModal').modal('show');
			$('.modal-body').html('请选择起始日期');
			$('.btn-ok').attr("style","display:none;");
			//alert('请选择截止日期');
			return false;
		}
		$.ajax({
			url:'/distributor/distributorOrder/list/' + $('#distributorId').val() +'/' + $('#startTime').val() +'/'+$('#endTime').val() +'/0',
			type:'GET',
			success: function(data) {
				if(data.success){
					var para = '';
					$(data.content).each(function (key,value) { //遍历返回的json   
						para += '<tr><td>'+ value.displayCreateTime + 
		                        '</td><td>￥'+ value.displayMoney +'</td><td>￥'+ value.displayCommission + 
		                        '</td><td>查看</td></tr>';
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
		                    url: '/distributor/distributorOrder/list/' + $('#distributorId').val() +'/' + $('#startTime').val() +'/'+$('#endTime').val() +'/'+index,
		                    success: function(data) {
		                    	if(data.success){
		                    		var para = '';
			        				$(data.content).each(function (key,value) { //遍历返回的json   
			        					para += '<tr><td>'+ value.displayCreateTime + 
			        	                        '</td><td>￥'+ value.displayMoney +'</td><td>￥'+ value.displayCommission + 
			        	                        '</td><td>查看</td></tr>';
			        	            });
			        				$("#content-table").empty();
			        	            $("#content-table").append(para);
			        	            $("#statics").html('总记录数： '+data.total);
			                    }
		                    }
		                });
		            };
				}
			}
		});
		return false;
	});
});       
</script>
</body>
</html>