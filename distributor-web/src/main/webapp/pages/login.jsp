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
<div id="header"></div>
<div id="main">
	<form method="post" action="/distributor/dashboard">
		<div class="rows">
			<span class="input-title-user"></span>
			<input class="inp" tabindex="1" type="text" value="" name="userName" placeholder="手机、用户名"/>
		</div>
		<div class="rows">
			<span class="input-title-password"></span>
			<input class="inp" tabindex="2" type="password" value="" name="password" placeholder="请输入您的密码"/>
		</div>
		<div class="remember">
			<label class="checkbox">
				<input type="checkbox" name="rememberMe"/>
				<span class="week-login">一周内自动登录</span>
            </label>
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
	<span style="color:#666">Copyright ©2015会员分销管理系统<br/></span>
</div>
</body>
</html>