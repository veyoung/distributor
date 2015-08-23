<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>会员分销管理系统-登陆页面</title>
<link href="/distributor/css/loging.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="page">
	<div id="header"></div>
	<div id="main">
		<form id="loginForm" action="/distributor/userLogin" method="post">
			<div class="rows">
				<span class="input-title-user"></span>
				<input class="inp" tabindex="1" type="text" value="" name="userName" placeholder="手机、用户名"/>
			</div>
			<div class="rows">
				<span class="input-title-password"></span>
				<input id="password" class="inp" tabindex="2" type="password" value="" name="password" placeholder="请输入您的密码"/>
			</div>
			<c:if test="${status != null}">
			<div style="margin:10px 0 -10px 0">
				<span id="tips" style='color:red' >您输入的密码不正确</span>
			</div>
			</c:if>
			<div class="remember">
	            <a class="forget-link" href="/forgetInit">忘记密码?</a>
			</div>
			<div>
				<button type="submit" class="submit-btn">立即登录</button>
			</div>
			<div>
				<a href="/distributor/pages/register.jsp" class="reg-btn">注册账号</a>
			</div>
	    </form>
	</div>
	<div id="bottom">
		<ul class="describe">
			<li><a class="about">关于我们</a></li>
			<li><a class="about">联系我们</a></li>
			<li><a class="about">用户协议</a></li>
			<li><a class="about">隐私条款</a></li>
		</ul>
		<span style="color:#666">Copyright ©2015会员分销管理系统<br><br><br><br><br></span>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(function (){
	$('#loginForm').on('submit',function(){
		if($('#password').val() === ''){
			return false;
		}
		return true;
	});
});
</script>
</body>
</html>