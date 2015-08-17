<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>商品搜索</b>
		</h4>
	</div>
	<form id="commoditySearchForm" class="form-horizontal" role="form">
		<div class="form-group">
		    <label class="col-sm-2 control-label" for="distributorName">商品名称</label>
		    <div class="col-sm-4">
		    	<input type="text" name="commodityName" class="form-control" id="commodityName" placeholder="输入商品名称">
		    </div>
		 </div>
         <div class="form-group">
		    <label class="col-sm-2 control-label" for="distributorName">商品ID</label>
		    <div class="col-sm-4">
		    	<input type="text" name="commodityId" class="form-control" id="commodityId" placeholder="输入商品ID">
		    </div>
		    <div class="col-sm-2">
		    	<button type="submit" class="btn btn-primary btn-primary">查询&nbsp;&nbsp;<i class="glyphicon glyphicon-search"></i></button>
		    </div>
		 </div> 
    </form>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
				<td width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称</td>
				<td width="15%">商品ID</td>
				<td width="15%">商品价格(元)</td>
				<td width="15%">商品说明</td>
				<td width="20%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan="5">暂无查询结果</td></tr></tbody>
		</table>
		<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">提示</h4>
		      </div>
		      <div class="modal-body">			
		      	是否下线商品？ 					 
			  </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <a type="button" id="deleteUrl" class="btn btn-danger">立即下线</a>
			      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$(function(){
	$('#date1').datepicker();         
	$('#date2').datepicker();   
	$('#commoditySearchForm').on('submit',function(){
		$.ajax({
			type:"GET",
			url:"/distributor/getCommodity/" + $('#commodityId').val(),
		 	success: function(data) {
		 		if(data.success){
		 			if(data.content != null){
		 				var para ='<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ data.content.name + 
	                    '</td><td>'+ data.content.id +'</td><td>'+ data.content.priceDisplay + 
	                    '</td><td>'+ data.content.description +'</td><td>'+
	                    '<a class="blue" href="/distributor/commodity/'+data.content.id+
	                    '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+data.content.id+
						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
	                    '</td></tr>';  
			 			$("#content-table").empty();
			            $("#content-table").append(para);
		 			}
		 			else{
			 			$("#content-table").empty();
			            $("#content-table").append('<tr><td colspan="5">您查询的商品不存在</td></tr>');
			 		}
		 		}
			}
		})
		return false;
	})
});    

</script>
</body>
</html>