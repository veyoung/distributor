<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="/distributor/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/distributor/css/font-awesome.css"/>
<link rel="stylesheet" href="/distributor/css/distributorlist.css"/>
<link rel="stylesheet" href="/distributor/css/common.css"/>
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>商品分类列表</b>
			<div class="pull-right action-group">               
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
  					<i class="ace-icon fa fa-plus-circle"></i>添加商品分类
				</button>                     
			</div>
		</h4>
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">添加商品分类</h4>
		      </div>
		      <form action="/distributor/commodityCategory" method="post" class="form-horizontal" role="form">
			      <div class="modal-body">
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="categoryName">分类名</label>
					    <div class="col-sm-8">
					    	<input type="text" name="name" class="form-control" id="categoryName" placeholder="输入分类名">
					    </div>
					 </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">保存</button>
			      </div>
		       </form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
			<td width="30%">序号</td>
			<td width="35%">分类名</td>
			<td width="35%">操作</td>
			<c:forEach items="${categories}" var="item" varStatus="status">
				<tr><td class="distributor-font">&nbsp;${status.index + 1}</td>
					<td>${item.name}</td>
					<td><a class="orange" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>
						<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title" id="myModalLabel">提示</h4>
						      </div>
						      <div class="modal-body">			
						      	是否删除指定的分类？ 					 
							  </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							        <a type="button" class="btn btn-danger" href="commodityCategory/delete/${item.id}">确定</a>
							      </div>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->  
					</td>
				</tr>		
			</c:forEach>
		</table>
		<div style="background-color:#eff3f8;height:40px;margin-top:-20px">
			<div class="col-sm-3"><span id ="statics" style="line-height:40px">总记录数：${categories.size()}</span></div>
		</div>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/bootstrap-paginator.min.js"></script>
</body>
</html>