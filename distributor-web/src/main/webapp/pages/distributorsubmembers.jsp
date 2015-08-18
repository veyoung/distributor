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
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>下属分销商列表————${distributor.name}</b>
			<div class="pull-right action-group">               
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
  					<i class="ace-icon fa fa-plus-circle"></i>添加下属会员
				</button>                     
			</div>
		</h4>
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">添加下属分销商</h4>
		      </div>
		      <form id="addBranchForm" class="form-horizontal" role="form" action="/distributor/distributorSubmemberAdd" method="post">
			      <div class="modal-body">
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="distributorName">下属分销商ID</label>
					    <div class="col-sm-8">
					    	<input type="hidden" class="form-control" name="ownerId" id="ownerId" value="${distributor.id}">
					    	<input type="text" class="form-control" name="childId" id="childId" placeholder="输入下属会员ID">
					    </div>
					 </div>					 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">添加</button>
			      </div>
		      </form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue"><td width="15%" class="distributor-font">下属分销商姓名</td><td width="20%">ID</td><td width="15%">等级</td><td width="25%">操作</td></tr>
			<c:if test="${subMembers.size() == 0}">
				<tr><td colspan="6">暂无下属分销商</td></tr>
			</c:if>
			<c:forEach items="${subMembers}" var="item"> 
				<tr><td class="distributor-font">&nbsp;${item.name}</td>
					<td>${item.id}</td>
					<c:if test="${item.level==1}"><td>钻石会员</td></c:if>
					<c:if test="${item.level==2}"><td>金牌会员</td></c:if>
					<c:if test="${item.level==3}"><td>VIP会员</td></c:if>
					<td>
						<a class="orange" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-pencil"></i>删除</a>
						<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title" id="myModalLabel">提示</h4>
						      </div>
						      <div class="modal-body">			
						      	是否移除下属分销商？ 					 
							  </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							        <a type="button" class="btn btn-primary" href="/distributor/distributorSubmemberDelete/${item.id}/${distributor.id}">确定</a>
							      </div>
						    </div><!-- /.modal-content -->
						  </div><!-- /.modal-dialog -->
						</div><!-- /.modal -->  
					</td></tr>	
			</c:forEach>									
		</table>
		<div style="background-color:#eff3f8;height:40px;margin-top:-20px">
			<div class="col-sm-3"><span id ="statics" style="line-height:40px">总记录数：${subMembers.size()}</span></div>
		</div>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function (){
	$('#addBranchForm').on('submit',function(){
		var ownerId = '${distributor.id}';
		$.ajax({
			type:"GET",
			url:"/distributor/distributorSubmemberAdd/" + ownerId + "/" + $('#childId').val() ,
		 	success: function(data) {
		 		if(data.success){
		 			location.href= '/distributor/distributorSubmember/'+ ownerId;
		 		}
		 		else{
		 			alert('不符合下级分销商添加规则');
		 		}
			}
		});
		return false;
	});
});
</script>
</body>
</html>