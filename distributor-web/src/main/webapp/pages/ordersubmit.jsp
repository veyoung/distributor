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
			<b><em></em>订单提交</b>&nbsp;<small>(录入会员Id，选择商品)</small>
		</h4>
	</div>
	<div class="row">  
		<form class="form-horizontal" id="addCommodityForm" role="form">
		 <div class="form-group">
			<label class="col-sm-2 control-label" for="distributorName">商品ID</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="commodityId" placeholder="输入商品ID">
			</div>
			<div class="col-sm-4">
				<button type="submit" class="btn btn-primary">添加商品</button>
			</div>
		 </div>
		</form>
	</div>
	<table class="table table-striped table-hover data-table">
		<tr class="table-title-blue">
		<td>商品名</td><td>单价(元)</td><td>数量</td><td>总价(元)</td><td>操作</td></tr>
		<tbody id="content-table">
			<c:if test="${commodities == '' }">
				<tr><td colspan="5">暂无商品</td></tr>
			</c:if>
			<c:if test="${commodities != '' }">
				<c:forEach items="${commodities}" var="item">
					<tr>
						<td>${item.name}</td>
						<td>${item.priceDisplay}</td>
						<td>1</td>
						<td>${item.priceDisplay}</td>
						<td><a href="/distributor/deleteCommodity/${item.name}" class="orange"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a></td></tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div class="row" style="border:1px solid #ddd;margin:0 5px 0 5px">
		<strong>会员：</strong><br><br>
		<div class="row" style="margin-bottom:10px;margin-left:40px;">
			<form id ="checkDistributorForm" class="form-inline">
				<div class="form-group col-sm-5">
					<label class="col-sm-3 control-label" for="distributorId">会员ID</label>
					<div class="col-sm-9">
						<input id="distributorId" type="text" class="form-control">
						<button type="submit" class="btn btn-primary" id="distributorId">检查会员</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row" style="margin-bottom:10px;margin-left:40px;">
			<form class="form-inline">
				<div class="form-group col-sm-5">
					<label class="col-sm-3 control-label" for="distributorName">会员姓名</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="distributorName" readonly="readonly">
					</div>
				</div>
				<div class="form-group col-sm-5">
					<label class="col-sm-3 control-label" for="mobile">手机号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="mobile" readonly="readonly">
					</div>
				</div>
			</form>
		</div>
		<div class="row" style="margin-bottom:10px;margin-left:40px;">
			<form class="form-inline">
				<div class="form-group col-sm-5">
					<label class="col-sm-3 control-label" for="bossName">上级会员</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="bossName" readonly="readonly">
					</div>
				</div>	
				<!-- <div class="form-group col-sm-5">
					<label class="col-sm-3 control-label" for="commission">提成比例</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="commission" readonly="readonly">
					</div>
				</div> -->
			</form>
		</div>
	</div>
	
	<br>
	<div class="row" style="margin:0 5px 0 5px">
		<div style="margin-left:25px;float:right">
			<form id="submitOrderForm">
				<strong>合计：</strong>
				[总金额：<span style="color:red">￥<span id="totalPrice"></span></span>&nbsp;元]&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success">提交订单</button>
			</form>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   		aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">
              		提示
            	</h4>
         		</div>
         		<div class="modal-body"></div>
         		<div class="modal-footer">
            		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary btn-ok">确定</button>
         		</div>
      		</div>
		</div>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	//添加商品
    $('#addCommodityForm').bind('submit', function(){
    	$.ajax({
    		type: "GET",
    		url:"/distributor/addCommodity/" + $("#commodityId").val(),
    		error: function(request) {
    			$('#myModal').modal('show');
    			$('.modal-body').html('发送请求失败！');
    			$('.btn-ok').attr("style","display:none;");
    			//alert("发送请求失败！");
    		},
    		success: function(data) {
    			if(data.success){
    				var t = "";
    				var totalPrice = 0;
        			$(data.content).each(function (key,value) { //遍历返回的json                     
                        t += '<tr class="for-total-price"><td>'+ value.name +'</td><td>'+ value.priceDisplay + '</td><td id="commodity-count"><a class="adjustbox subtracting">-</a><span class="countbox">1</span>'
                        		+ '<a class="adjustbox adding">+</a></td><td id="priceDisplay">' 
                        		+ value.priceDisplay * 1 + '</td><td>'
    							+ '<a href="/distributor/deleteCommodity/' 
    							+ value.id + '" class="orange"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
                        		+ '</td></tr>';
                        totalPrice += parseFloat(value.priceDisplay);
                    });
        			
        			$("#content-table").empty();
                    $("#content-table").append(t);
                    $("#totalPrice").text(totalPrice);
                    $("#content-table").find('.subtracting').addClass("disable-background");
                    
    			} else{
    				$('#myModal').modal('show');
        			$('.modal-body').html(data.content);
        			$('.btn-ok').attr("style","display:none;");
    				//alert(data.content);
    			}
    		}
    	});
        return false;
    });
    
	//减少商品数量
    $("#content-table").on('click', '.subtracting', function(){
    	if(parseInt($(this).next('.countbox').text()) == 1){
    		 return;
    	}
    	var currentCount = parseInt($(this).next('.countbox').text())
    	var avgPrice = parseFloat($(this).closest('#commodity-count').next("#priceDisplay").text())/currentCount
    	var count = parseInt($(this).next('.countbox').text()) - 1;
    	var dom = $(this).next('.countbox');
    	$.ajax({
    		type: "GET",
    		url:"/distributor/subtractCommodityCount/" + $("#commodityId").val(),
    		success: function(data) {
    			if(data.success){
    				dom.text(count);
    		    	if(count > 1){
    		    		dom.prev('.subtracting').removeClass("disable-background");
    		    	}else if(count == 1){
    		    		dom.prev('.subtracting').addClass("disable-background");
    		    	}
    		    	var currentPrice = avgPrice*count;
    		    	dom.closest('#commodity-count').next("#priceDisplay").text(currentPrice);
    		    	var brothers = dom.closest('#commodity-count').closest('.for-total-price').siblings();
    		    	if(brothers.length == 0){
    		    		$('#totalPrice').html(currentPrice)
    		    	}else{
    		    		var totalPrice =currentPrice;
    		    		brothers.each(function (key,value) {
    		    			totalPrice += parseFloat($(value).children('#priceDisplay').text());
        		    	})
        		    	$('#totalPrice').html(totalPrice)
    		    	}
    		    	
    			} else{
    				$('#myModal').modal('show');
        			$('.modal-body').html("分销商不存在!!");
        			$('.btn-ok').attr("style","display:none;");
    				//alert("分销商不存在!!");
    			}
    		}
    	});
    	
    });

  //增加商品数量
    $("#content-table").on('click', '.adding', function(){
    	var currentCount = parseInt($(this).prev('.countbox').text())
    	var avgPrice = parseFloat($(this).closest('#commodity-count').next("#priceDisplay").text())/currentCount
    	var count = currentCount + 1;
    	var dom = $(this).prev('.countbox');
    	$.ajax({
    		type: "GET",
    		url:"/distributor/addCommodityCount/" + $("#commodityId").val(),
    		success: function(data) {
    			if(data.success){
    				dom.text(count);
    		    	if(count > 1){
    		    		dom.prev('.subtracting').removeClass("disable-background");
    		    	}else if(count == 1){
    		    		dom.prev('.subtracting').addClass("disable-background");
    		    	}
    		    	var currentPrice = avgPrice*count;
    		    	dom.closest('#commodity-count').next("#priceDisplay").text(currentPrice)
    		    	var brothers = dom.closest('#commodity-count').closest('.for-total-price').siblings();
    		    	if(brothers.length == 0){
    		    		$('#totalPrice').html(currentPrice)
    		    	}else{
    		    		var totalPrice = currentPrice;
    		    		brothers.each(function (key,value) {
    		    			console.log(value);
    		    			totalPrice += parseFloat($(value).children('#priceDisplay').text());
        		    	})
        		    	$('#totalPrice').html(totalPrice)
    		    	}
    			} else{
    				$('#myModal').modal('show');
        			$('.modal-body').html("分销商不存在!!");
        			$('.btn-ok').attr("style","display:none;");
    				//alert("分销商不存在!!");
    			}
    		}
    	});
    	
    });
  
  
	
    //校验分销商
    $('#checkDistributorForm').bind('submit', function(){
    	$.ajax({
    		type: "GET",
    		url:"/distributor/distributorInfo/" + $("#distributorId").val(),
    		success: function(data) {
    			if(data.success){
    				$("#distributorName").val(data.content.name)
    				$("#mobile").val(data.content.mobile)
    				$("#bossName").val(data.content.owner.name)
    				/* $("#commission").val(data.content.owner.commission+"%") */
    			} else{
    				$('#myModal').modal('show');
        			$('.modal-body').html("分销商不存在!!");
        			$('.btn-ok').attr("style","display:none;");
    				//alert("分销商不存在!!");
    			}
    		}
    	});
        return false;
    });
    
    //提交订单表单
    $('#submitOrderForm').bind('submit', function(){
    	/* alert("顺利提交表单"); */
    	
    	if($('.data-table').children().length <= 2){
    		$('#myModal').modal('show');
			$('.modal-body').html("请先选择商品");
			$('.btn-ok').attr("style","display:none;");
    	}
    	if($('#distributorId').val() === "" || $('#distributorName').val() === ""){
    		$('#myModal').modal('show');
			$('.modal-body').html("请输入正确的会员ID");
			$('.btn-ok').attr("style","display:none;");
    		//alert("请输入正确的会员ID");
    		return false;
    	} else {
    		$.ajax({
        		type: "GET",
        		url:"/distributor/submitOrder/" + $("#distributorId").val(),
        		success: function(data) {
        			if(data.success){
    					location.href="/distributor/pages/orderlist.jsp";
        			} else{
        				$('#myModal').modal('show');
        				$('.modal-body').html("提交表单结果失败");
        				$('.btn-ok').attr("style","display:none;");
        				//alert("提交表单结果失败");
        			}
        		}
        	});
    	}
        return false;
    });

});
</script>
</body>
</html>