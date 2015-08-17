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
<link rel="stylesheet" href="/distributor/css/pagination.css"/>
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>订单列表</b>
		</h4>
	</div>
	<form id="searOderForm" class="form-horizontal" role="form">
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">起始日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" value="" data-date-format="yyyy-mm-dd" id="startTime" >
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">截止日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" value="" data-date-format="yyyy-mm-dd" id="endTime" >
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission"></label>
		    <div class="col-sm-4">
		    	<button type="submit" class="btn btn-primary btn-primary">查询&nbsp;&nbsp;<i class="glyphicon glyphicon-search"></i></button>
		    </div>
		 </div>		 					 	 
	</form>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
				<td width="10%">订单号</td>
				<td width="10%">订单归属</td>
				<td width="10%">订单金额(元)</td>
				<td width="10%">上级分销商</td>
				<td width="10%">上级提成(元)</td>
				<td width="10%">操作员</td>
				<td width="15%">操作时间</td>
				<td width="15%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan="6">暂无订单</td></tr></tbody>										
		</table>
		<div style="background-color:#eff3f8;height:60px;margin-top:-20px">
			<div class="col-sm-3"><span id ="statics" style="line-height:60px"></span></div>
			<div class="col-sm-9"><div id="pagination" style="float:right"></div></div>
		</div>
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/bootstrap-datepicker.js"></script>
<script src="/distributor/js/jquery.pagination.js"></script>
<script type="text/javascript">
var pageIndex = 0; //页面索引初始值
var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
$(function(){
	$('#startTime').datepicker();         
	$('#endTime').datepicker();   
	$('#searOderForm').on('submit',function(){
		$.ajax({
			type: "GET",
			url:"/distributor/order/" + $("#startTime").val() + "/" + $('#endTime').val() + "/0",
			success: function(data) {
				if(data.success){
					var t = "";
        			$(data.content).each(function (key,value) { //遍历返回的json     
        				var bossName = value.bossDistributor != null ? value.bossDistributor.name : '暂无';
        				var commissionMoney = value.bossDistributor != null ? value.displayCommission:'0';
                        t += '<tr><td>'+ value.id +'</td><td>'+ value.orderDistributor.name + '</td><td>￥ '+ value.displayMoney  
                        		+ '</td><td>' + bossName + '</td><td>￥ ' + commissionMoney + '</td><td>店小二'+ '</td><td>'+ value.displayCreateTime
                        		+ '</td><td class="blue"><i class="glyphicon glyphicon-search"></i>&nbsp;详情</td></tr>';
                    });
        			if(t === ''){
        				t = "&nbsp;未查询到符合条件的订单"
        			}
        			$("#content-table").empty();
                    $("#content-table").append(t);
                    $("#statics").html('总订单数： '+data.total);
                    
                  	//分页，PageCount是总条目数，这是必选参数，其它参数都是可选
                    $('#pagination').pagination(data.total, {
                        callback: PageCallback, 
                        prev_text: '<<',
                        next_text: '>>',
                        items_per_page:pageSize,
                        num_edge_entries: 2, //两侧首尾分页条目数
                        num_display_entries: 5, //连续分页主体部分分页条目数
                        current_page: pageIndex, //当前页索引
                    });
                    
                  	//翻页调用
                    function PageCallback(index, jq) {
                        $.ajax({
                            type: 'GET',
                            url: "/distributor/commodityList/" + index,
                            error:function(XMLHttpRequest, textStatus, errorThrown){
                            	alert(XMLHttpRequest.status);
                                alert(XMLHttpRequest.readyState);
                                alert(textStatus);
                            },
                            success: function(data) {
                                if (data.success) {
                                	var t = "";
                        			$(data.content).each(function (key,value) { //遍历返回的json     
                        				var bossName = value.bossDistributor != null ? value.bossDistributor.name : '暂无';
                        				var commissionMoney = value.bossDistributor != null ? value.displayCommission:'0';
                                        t += '<tr><td>'+ value.id +'</td><td>'+ value.orderDistributor.name + '</td><td>￥ '+ value.displayMoney  
                                        		+ '</td><td>' + bossName + '</td><td>￥ ' + commissionMoney + '</td><td>店小二'+ '</td><td>'+ value.displayCreateTime
                                        		+ '</td><td><i class="glyphicon glyphicon-search"></i>详情</td></tr>';
                                    });
                        			if(t === ''){
                        				t = "&nbsp;未查询到符合条件的订单"
                        			}
                        			$("#content-table").empty();
                                    $("#content-table").append(t);
                                    $("#statics").html('总订单数： '+data.total);
                                }
                            }
                        });
                    };
                    
				}else{
					alert('订单查询失败');
				}
			}
		});
		return false;
	})
});       
</script>
</body>
</html>