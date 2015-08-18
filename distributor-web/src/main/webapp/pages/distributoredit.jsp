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
			<b><em></em>分销商详情——编辑</b>
		</h4>
	</div>
	<form class="form-horizontal" role="form" action="/distributor/distributorEdit" method="post">
         <div class="form-group">
		    <label class="col-sm-3 control-label" for="distributorName">分销商姓名</label>
		    <div class="col-sm-6">
		    	<input type="hidden" name="id" value="${distributor.id}">
		    	<input type="text" name="name" class="form-control" id="distributorName" placeholder="输入姓名" value="${distributor.name}">
		    </div>
		 </div>
         <div class="form-group">
		    <label class="col-sm-3 control-label" for="distributorName">会员等级</label>
		    <div class="col-sm-6">
		    	<select id="level" name="level" class="selectpicker col-sm-12 form-control" >
				    <option value="1">钻石会员</option>
				    <option value="2">金牌会员</option>
				    <option value="3">VIP会员</option>
				  </select>
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-3 control-label" for="commission">提成比例</label>
		    <div class="col-sm-6">
		    	<div class="input-group">
		    		<input type="text" name="commission" class="form-control" id="commission" placeholder="输入提成比例" value="${distributor.commission}">
		    		<div class="input-group-addon">%</div>
		    	</div>
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-3 control-label" for="mobile">手机号</label>
		    <div class="col-sm-6">
		    	<input type="text" name="mobile" class="form-control" id="mobile" placeholder="输入手机号" value="${distributor.mobile}">
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
$(function (){
	$('#level').val('${distributor.level}');
});
</script>
</body>
</html>