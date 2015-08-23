<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>登陆页面</title>
<link href="/distributor/css/loging.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="page">
	<div id="header"></div>
	<div id="main">
		<form id="registerForm" method="post" action="/distributor/register">
			<div class="rows">
				<span class="input-title-long">用户名:</span>
				<input class="inp" id="username" tabindex="1" type="text" value="" name="username" onchange="existUser()"/>
			</div>
			<span id="tips" style="display:none;margin-top:10px;color:red;">*用户名已存在</span>
			<div class="rows">
				<span class="input-title-long">手机号码:</span>
				<input class="inp" id="mobile" tabindex="1" type="text" value="" name="mobile"/>
			</div>
			<div class="rows">
				<span class="input-title-long">设置密码:</span>
				<input class="inp" id="password" tabindex="1" type="password" value="" name="password"/>
			</div>
			<div class="rows">
				<span class="input-title-long">确认密码:</span>
				<input class="inp" id="passwordconfirm" tabindex="1" type="password" value="" name="passwordconfirm"/>
			</div>
			<div class="rows">
				<span class="input-title-long">用户权限:</span>
				<select class="inp" name='role' style="width:200px;height:35px;">
					<option value='1'>超级管理员</option>
					<option value='2' selected >普通管理员</option>
				</select>	
			</div>
			<div class="remember">
				<label class="checkbox">
					<input type="checkbox" name="rememberMe"/>
					<span class="week-login">我已阅读并同意用户协议条款</span>
	            </label>
			</div>
			<div>
				<button type="submit" class="submit-btn">立即注册</button>
			</div>
	    </form>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function (){
	$('#registerForm').on('submit',function(){
		var name = $('#username').val();
		var mobile = $('#mobile').val();
		var password = $('#password').val();
		var passwordconfirm = $('#passwordconfirm').val();
		if(name === ''){
			return false;
		}
		if(mobile === '' ||  !(/^1[3|4|5|8]\d{9}$/.test(mobile))){
			return false;
		}
		if(password === ''){
			return false;
		}
		if(passwordconfirm === ''){
			return false;
		}
		if(password != passwordconfirm){
			return false;
		}
		return true;
	})
});
</script>
</body>
</html>