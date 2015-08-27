<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<title>会员分销管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="/distributor/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/distributor/css/font-awesome.css"/>
<link rel="stylesheet" href="/distributor/css/main.css"/>
</head>
<body>
<div class="navbar navbar-duomi navbar-static-top" role="navigation">
	<div class="container-fluid">
    	<div class="navbar-header">
            <a class="navbar-brand" href="#" id="logo">会员分销管理系统</a>
        </div>
        <div class="login-box">
           	<span>欢迎您:&nbsp;&nbsp;${user.name}（
			<c:if test="${user.role == 1}">超级管理员</c:if>
			<c:if test="${user.role == 2}">操作员</c:if>）&nbsp;</span> 
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked">
                <li>
                    <a href="/distributor/pages/mainbody.jsp" target="view_window">
                        <i class="glyphicon glyphicon-th-large"></i> 首页 
                    </a>
                </li>
                <li>
                    <a href="#orderManage" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-credit-card"></i>订单消费
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="orderManage" class="nav nav-list secondmenu collapse" style="height: 0px;">
                        <li><a href="/distributor/pages/ordersubmit.jsp" target="view_window"><i class="glyphicon glyphicon-th-list"></i>&nbsp;订单消费</a></li>
                        <li><a href="/distributor/pages/orderlist.jsp" target="view_window"><i class="glyphicon glyphicon-asterisk"></i>&nbsp;订单列表</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#distributorManage" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-user"></i> 分销商管理	
                        <span class="pull-right glyphicon  glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="distributorManage" class="nav nav-list secondmenu collapse in">
                        <li><a href="/distributor/pages/distributorlist.jsp" target="view_window"><i class="glyphicon glyphicon-user"></i>&nbsp;分销商列表</a></li>
                        <li><a href="/distributor/pages/distributorconsumedetail.jsp" target="view_window"><i class="glyphicon glyphicon-star-empty"></i>&nbsp;分销商消费明细</a></li>
                        <li><a href="/distributor/pages/distributorpointsdetail.jsp" target="view_window"><i class="glyphicon glyphicon-star"></i>&nbsp;分销商积分明细</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#commodityManage" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-globe"></i> 商品管理
			 			<span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="commodityManage" class="nav nav-list secondmenu collapse">
                   		<c:if test="${user.role == 1}">
                   			<li><a href="/distributor/pages/commoditycategorylist.jsp" target="view_window"><i class="glyphicon glyphicon-adjust"></i>&nbsp;商品分类</a></li>
                   		</c:if>
                        <li><a href="/distributor/pages/commoditylist.jsp" target="view_window"><i class="glyphicon glyphicon-th-list"></i>&nbsp;商品列表</a></li>
                        <li><a href="/distributor/pages/commoditysearch.jsp" target="view_window"><i class="glyphicon glyphicon-search"></i>&nbsp;商品搜索</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#operationManage" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-bold"></i>运营管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="operationManage" class="nav nav-list secondmenu collapse">
                        <li><a href="/distributor/pages/rankingsale.jsp" target="view_window"><i class="glyphicon glyphicon-sort-by-order"></i>&nbsp;消费排行</a></li>
                        <li><a href="/distributor/pages/rankingcommission.jsp" target="view_window"><i class="glyphicon glyphicon-text-width"></i>&nbsp;提成排行</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#systemManage" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-cog"></i>系统管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                    <ul id="systemManage" class="nav nav-list secondmenu collapse">
                        <li><a href="/distributor/pages/systemusers.jsp" target="view_window"><i class="glyphicon glyphicon-user"></i>&nbsp;角色管理</a></li>
                        <li><a href="/distributor/pages/systemlogs.jsp" target="view_window"><i class="glyphicon glyphicon-eye-open"></i>&nbsp;日志查看</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="col-md-10">
        	<iframe name="view_window" src="/distributor/pages/distributorlist.jsp" width="100%" height="800px" scrolling="no" frameborder="0"></iframe>
        </div>
    </div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
</body>
</html>