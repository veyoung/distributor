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
			<b><em></em>商品详情——编辑</b>
		</h4>
	</div>
	<form class="form-horizontal" role="form" action="/distributor/commodity/edit" method="post">
         <div class="form-group">
		    <label class="col-sm-3 control-label" for="distributorName">商品名称</label>
		    <div class="col-sm-6">
		    	<input type="hidden" name="id" value="${commodity.id}">
		    	<input type="text" name="name" class="form-control" id="distributorName" value="${commodity.name}">
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-3 control-label" for="distributorBrand">商品品牌</label>
		    <div class="col-sm-6">
		    	<input type="text" name="brand" class="form-control" id="distributorBrand" value="${commodity.brand}">
		    </div>
		 </div>
         <div class="form-group">
			<label class="col-sm-3 control-label" for="distributorName">商品分类</label>
			<div class="col-sm-6">
				<select id="category" name="categoryId" class="selectpicker col-sm-12 form-control">
				</select>
			</div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-3 control-label" for="commission">商品价格</label>
		    <div class="col-sm-6">
		    	<div class="input-group">
		    		<input type="text" name="price" class="form-control" id="commission" value="${commodity.priceDisplay}">
		    		<div class="input-group-addon">元</div>
		    	</div>
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-3 control-label" for="mobile">商品说明</label>
		    <div class="col-sm-6">
		    	<textarea name="description" class="form-control" rows="6">${commodity.description}</textarea>
		    </div>
		 </div>			
		 <div class="form-group">
		    <label class="col-sm-3"></label>
		    <div class="col-sm-6">
		    	<input type="submit" class="btn btn-primary" value="保存">
		    </div>
		 </div>			 					 
    </form>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script type="text/javascript">
var strs= new Array(); //定义一数组 
strs = '${categoriesStr}'.split(";"); ///字符分割 
for(i = 0; i < strs.length-1; i++){ 
	var ss = new Array();
	ss = strs[i].split(',');
	var item = new Option(ss[1], ss[0]);  
    $("#category").append(item);  
} 
</script>
</body>
</html>