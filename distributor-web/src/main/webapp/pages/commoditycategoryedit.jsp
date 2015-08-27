<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<b><em></em>商品分类——编辑</b>
		</h4>
	</div>
	<form class="form-horizontal" role="form" action="/distributor/category" method="post">
         <div class="form-group" style="margin-top:20px">
		    <label class="col-sm-3 control-label" for="distributorName">商品分类名</label>
		    <div class="col-sm-4">
		    	<input type="hidden" name="id" value="${category.id}">
		    	<input type="text" name="name" class="form-control" id="categoryName" value="${category.name}">
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-3"></label>
		    <div class="col-sm-4">
		    	<input type="submit" class="btn btn-primary" value="保存更改">
		    </div>
		 </div>	
    </form>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
</body>
</html>