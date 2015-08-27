<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<link rel="stylesheet" href="/distributor/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/distributor/css/datepicker.css"/>
<link rel="stylesheet" href="/distributor/css/font-awesome.css"/>
<link rel="stylesheet" href="/distributor/css/distributorlist.css"/>
<link rel="stylesheet" href="/distributor/css/common.css"/>
<link rel="stylesheet" href="/distributor/css/pagination.css"/>
</head>
<body>
<div class="page-content">
	<div class="page-header">
		<h4 class="header">
			<b><em></em>分销商积分查询</b>
		</h4>
	</div>
	<form id="distributorCommissionForm" class="form-horizontal" role="form">
         <div class="form-group">
		    <label class="col-sm-2 control-label" for="distributorId">分销商ID</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" id="distributorId" placeholder="输入分销商ID">
		    </div>
		 </div>
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">起始日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" data-date-format="yyyy-mm-dd" id="startTime" placeholder="请选择起始日期" >
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission">截止日期</label>
		    <div class="col-sm-4">
		    	<input type="text" class="form-control" data-date-format="yyyy-mm-dd" id="endTime" placeholder="请选择截止日期">
		    </div>
		 </div>	
		 <div class="form-group">
		    <label class="col-sm-2 control-label" for="commission"></label>
		    <div class="col-sm-4">
		    	<button type="submit" class="btn btn-primary btn-primary">查询&nbsp;&nbsp;<i class="glyphicon glyphicon-search"></i></button>
		    </div>
		    <div class="col-sm-8 exchange" style="display:none;">
		    	<button type="submit" class="btn btn-primary">积分兑换</button>
		    </div>
		 </div>		 					 
    </form>
	<div>
		<div class='distributor'></div>
		<table class="table table-striped table-hover table-bordered">
			<tr class="table-title-gray">
				<td width="25%" class="distributor-font">提成时间</td>
				<td width="20%">单次提成金额(元)</td>
				<td width="20%">账户提成总数(元)</td>
				<td width="20%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan='4'>暂无提成记录</td></tr></tbody>
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
         		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">
              		提示
            	</h4>
         		</div>
         		<div class="modal-body-dialog">         		
         		<div class="commodity-detail">
         			<table class="table table-striped table-hover table-bordered" style="diplay:none;">
						<tr class="table-title">
							 <td width="20%">商品名称</td>
							 <td width="20%">商品数量</td>
							 <td width="20%">积分</td>
						</tr>
						<tbody id="content-table-dialog"></tbody>
					</table>
         		</div>
         		</div>
         		<div class="modal-footer">
            		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary btn-ok">确定</button>
         		</div>
      		</div>
		</div>
	</div>
	
	<div class="modal fade" id="modal-exchange" tabindex="-1" role="dialog" 
   		aria-labelledby="exchange-modalLabel" aria-hidden="true" data-backdrop="static">
   		<div class="modal-exchange-dialog">
      		<div class="modal-content" style="width: 55%;">
         		<div class="modal-header" style="background-color:#4E8BBE">
            		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="exchange-modalLabel" style="color:white">
              		您的可兑换总积分为<span>&nbsp;&nbsp;<strong class="total-commission" style="color:red"></strong></span>
            	</h4>
         		</div>
         		<div class="modal-exchange-body" style="padding: 30px;">
						<form id="exchangeCommissionForm" class="form-horizontal"
							role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="reduceCommission">兑换积分：</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="reduceCommission"
										placeholder="请输入兑换积分">
								</div>
							</div>
						</form>
				</div>
         		<div class="modal-footer" style="background-color:white">
            		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            		<button type="button" class="btn btn-primary btn-exchange-ok">确定</button>
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
	$('#startTime').datepicker(
			{format: 'yyyy-mm-dd',
	            showButtonPanel: true,
	            autoclose: true,
	            minView: "month", //选择日期后，不会再跳转去选择时分秒
	            language: 'zh-CN'});         
	$('#endTime').datepicker(
			{format: 'yyyy-mm-dd',
	            showButtonPanel: true,
	            autoclose: true,
	            minView: "month", //选择日期后，不会再跳转去选择时分秒
	            language: 'zh-CN'});   
	$('#distributorCommissionForm').on('submit',function(){
		var distributorId = '';
		var startTime = '';
		var endTime = '';
		if($('#distributorId').val() == ''){
			$('#myModal').modal('show');
			$('.modal-body-dialog').html('<div style="padding:20px;font-size:20px;color:red;">&nbsp;&nbsp;&nbsp;&nbsp;请输入分销商ID</div>');
			$('.btn-ok').attr("style","display:none;");
			//alert('请输入分销商ID');
			return false;
		}else{
			distributorId = $('#distributorId').val()
			$('.exchange').attr('style', '').attr('style', 'float:left;  margin-left: 25%;margin-top: -34px;')
		}
		if($('#startTime').val() == ''){
			startTime = 0 + '' 
		}
		else{
			startTime = $('#startTime').val()
		}
		if($('#endTime').val() == ''){
			endTime = 0 + ''
		}else{
			endTime = $('#endTime').val()
		}
		
		$.ajax({
			url:'/distributor/distributorCommission/list/' + distributorId +'/' + startTime +'/'+ endTime +'/0',
			type:'GET',
			success: function(data) {
				if(data.success){
					localData = data.content;
					var para = '';
					$(data.content).each(function (key,value) { //遍历返回的json   
						para += '<tr><td>'+ value.displayCreateTime + 
		                        '</td><td>￥'+ value.displayCommission +'</td><td>￥'+ value.displayTotalCommission + 
		                        '</td><td class="blue detail" data-id=' + value.id + '><i class="glyphicon glyphicon-search""></i><span style="cursor:pointer;">查看</span></td></tr>';
		            });
					$("#content-table").empty();
		            $("#content-table").append(para);
		            $("#statics").html('总记录数： '+data.total);
		            $('#bottom-tip').css('display','block');
		            $('.distributor').html('<span style="color:red;">' + data.distributor.name + '</span>先生/女士的积分详情如下：')
		            
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
		                    url: '/distributor/distributorOrder/list/' + distributorId +'/' + startTime +'/'+ endTime +'/'+index,
		                    success: function(data) {
		                    	if(data.success){
		                    		localData = data.content;
		                    		var para = '';
			        				$(data.content).each(function (key,value) { //遍历返回的json   
			        					para += '<tr><td>'+ value.displayCreateTime + 
			        	                        '</td><td>￥'+ value.displayMoney +'</td><td>￥'+ value.displayCommission + 
			        	                        '</td><td class="blue detail" data-id=' + value.id + '><i class="glyphicon glyphicon-search""></i><span style="cursor:pointer;">查看</span></td></tr>';
			        	            });
			        				$("#content-table").empty();
			        	            $("#content-table").append(para);
			        	            $("#statics").html('总记录数： '+data.total);
			                    }
		                    }
		                });
		            };
				}
			}
		});
		return false;
	});
	
	
	$('.exchange').click(function(){
		var distributorId = $('#distributorId').val()
		$.ajax({
            type: 'GET',
            url: '/distributor/exchangeCommission/' + distributorId,
            success: function(data) {
            	if(data.success){
            		$('#modal-exchange').modal('show')
        			$('.total-commission').text(data.content.totalcommission/100 + '元')
            		$('.btn-exchange-ok').click(function(){
            			var distributorCommissionId = data.content.id
            			var reduceCommission = $('#reduceCommission').val()
            			if(!isNaN($('#reduceCommission').val) && reduceCommission > data.content.totalcommission){
            				alert("请重新输入！")
            			}else{
            				$.ajax({
                	            type: 'POST',
                	            url: '/distributor/exchangeCommission/' + distributorId + '?reduceCommission=' +reduceCommission +'&distributorCommissionId='+distributorCommissionId,
                	            success: function(reduceData) {
                	            	if(reduceData.success){
                	            		$('#modal-exchange').modal('hide')
                	            	}else{
                	            		$('#modal-exchange').modal('hide')
                	            	}
                	            }
                			})
            			}
            		})
        			
            	}else{
            		$('#modal-exchange').modal('hide')
            	}
            }
		})
		
	})
	
	$("body").on('click', '.detail', function(){
		var dccid = $(this).data("id")
		var distributor
		var distributorCommissionCommoditys
		$.each(localData, function(key, value){
			if(dccid == value.id){
				distributor = value.orderDistributor
				distributorCommissionCommoditys = value.distributorCommissionCommodityList
			}
		})
		$('#myModal').modal('show');
		$('#commodity-detail').attr("style","")
		$('.modal-title').html('该积分记录是由<span style="color:red;">' + distributor.name + '</span>购买如下商品产生：')
		var para = ''
		$.each(distributorCommissionCommoditys, function(key, value){
			para += '<tr><td>'+ value.commodityName + 
            '</td><td>'+ value.commodityCount +'</td><td>'+ 
            value.commodityCommission/100 + '</td></tr>'
		})
		$('#content-table-dialog').html(para);
		$('.btn-ok').attr("style","display:none;");
	});
	
});       
</script>
</body>
</html>