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
		    	<input type="text" class="form-control" value="" data-date-format="yyyy-mm-dd" id="startTime" placeholder="请选择起始日期">
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">截止日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" value="" data-date-format="yyyy-mm-dd" id="endTime" placeholder="请选择截止日期">
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
				<td width="10%">操作员</td>
				<td width="15%">操作时间</td>
				<td width="15%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan="6">暂无订单</td></tr></tbody>										
		</table>
		<div id="bottom-tip" style="background-color:#eff3f8;height:60px;margin-top:-20px;display:none">
			<div class="col-sm-3"><span id ="statics" style="line-height:60px"></span></div>
			<div class="col-sm-9"><div id="pagination" style="float:right"></div></div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   		aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
   		<div class="modal-dialog">
      		<div class="modal-content">
         		<div class="modal-header" style="background-color:#4E8BBE">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">
              		<strong style="color:white;">提示</strong>
            	</h4>
         		</div>
         		<div class="modal-body-dialog">
         		<div class="commodity-detail">
         			<table class="table table-striped table-hover table-bordered" style="diplay:none;">
						<tr class="table-title">
							 <td width="20%">商品名称</td>
							 <td width="20%">商品数量</td>
						</tr>
						<tbody id="content-table-dialog"></tbody>
					</table>
         		</div>
         		</div>
         		<div class="modal-footer" style="background-color:white">
            		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary btn-ok">确定</button>
         		</div>
      		</div>
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
	var localData;
	$('#startTime').datepicker();         
	$('#endTime').datepicker();   
	$('#searOderForm').on('submit',function(){
		var startTime = $('#startTime').val() == '' ? '0' : $('#startTime').val();
		var endTime = $('#endTime').val() == '' ? '0' : $('#endTime').val();
		$.ajax({
			type: "GET",
			url:"/distributor/order/" + startTime + "/" + endTime + "/0",
			success: function(data) {
				if(data.success){
					localData = data.content;
					var t = "";
        			$(data.content).each(function (key,value) { //遍历返回的json     
        				var bossName = value.bossDistributor != null ? value.bossDistributor.name : '暂无';
        				var commissionMoney = value.bossDistributor != null ? value.displayCommission:'0';
                        t += '<tr><td>'+ value.id +'</td><td>'+ value.orderDistributor.name + '</td><td>￥ '+ value.displayMoney  
                        		+ '</td><td>店小二'+ '</td><td>'+ value.displayCreateTime
                        		+ '</td><td class="blue operation-detail" data-id=' + value.id + '><i class="glyphicon glyphicon-search"></i>&nbsp;<span style="cursor:pointer">详情</span></td></tr>';
                    });
        			if(t === ''){
        				t = "<tr><td colspan='6'>&nbsp;未查询到符合条件的订单</td></tr>";
        			}
        			$("#content-table").empty();
                    $("#content-table").append(t);
                    $("#statics").html('总订单数： '+data.total);
                    $('#bottom-tip').css('display','block');
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
                            url: "/distributor/order/" + startTime + "/" + endTime + '/' + index,
                            success: function(data) {
                                if (data.success) {
                                	localData = data.content;
                                	var t = "";
                        			$(data.content).each(function (key,value) { //遍历返回的json     
                        				var bossName = value.bossDistributor != null ? value.bossDistributor.name : '暂无';
                        				var commissionMoney = value.bossDistributor != null ? value.displayCommission:'0';
                                        t += '<tr><td>'+ value.id +'</td><td>'+ value.orderDistributor.name + '</td><td>￥ '+ value.displayMoney  
                                        		+ '</td><td>店小二'+ '</td><td>'+ value.displayCreateTime
                                        		+ '</td><td class="blue operation-detail" data-id=' + value.id + '><i class="glyphicon glyphicon-search"></i><span style="cursor:pointer">&nbsp;&nbsp;详情</span></td></tr>';
                                    });
                        			if(t === ''){
                        				t = "<tr><td colspan='6'>&nbsp;未查询到符合条件的订单</td></tr>";
                        			}
                        			$("#content-table").empty();
                                    $("#content-table").append(t);
                                    $("#statics").html('总订单数： '+data.total);
                                }
                            },
                            error:function(XMLHttpRequest, textStatus, errorThrown){
                            	alert(XMLHttpRequest.status);
                                alert(XMLHttpRequest.readyState);
                                alert(textStatus);
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
	
	$("body").on('click', '.operation-detail', function(){
		var orderId = $(this).data("id")
		var distributor
		var orderCommodityIncludeList
		$.each(localData, function(key, value){
			if(orderId == value.id){
				distributor = value.orderDistributor
				orderCommodityIncludeList = value.orderCommodityIncludeList
			}
		})
		$('#myModal').modal('show');
		$('#commodity-detail').attr("style","")
		$('.modal-title').html('该订单记录是由<span style="color:red;">' + distributor.name + '</span>购买如下商品产生：')
		if(orderCommodityIncludeList == null){
			$('.commodity-detail').html('<div style="padding:20px;font-size:20px;color:red;">&nbsp;&nbsp;&nbsp;&nbsp;错误订单，该订单下无商品！</div>');
			
		}else{
			var para = ''
				$.each(orderCommodityIncludeList, function(key, value){
					para += '<tr><td>'+ value.commodity.name + 
			        '</td><td>'+ value.commodityCount +'</td></tr>'
				})
				$('#content-table-dialog').html(para);
		}
		$('.btn-ok').attr("style","display:none;"); 
	})
	
	
	
	
});       
</script>
</body>
</html>