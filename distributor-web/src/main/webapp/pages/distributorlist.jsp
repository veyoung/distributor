<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
			<b><em></em>分销商列表</b>
			<div class="pull-right action-group">               
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
  					<i class="ace-icon fa fa-plus-circle"></i>添加分销商
				</button>                     
			</div>
		</h4>
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">添加分销商</h4>
		      </div>
		      <form action="/distributor/distributorAdd" method="post" class="form-horizontal" id="distributorAddForm" role="form">
			      <div class="modal-body">
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="distributorName">分销商姓名</label>
					    <div class="col-sm-8">
					    	<input type="text" name="name" class="form-control" id="distributorName" placeholder="输入姓名">
					    </div>
					 </div>
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="distributorName">会员等级</label>
					    <div class="col-sm-8">
					    	<select id="level" name="level" class="selectpicker col-sm-12 form-control">
							    <option value="1">钻石会员</option>
							    <option value="2">金牌会员</option>
							    <option value="3">VIP会员</option>
							  </select>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="mobile">手机号</label>
					    <div class="col-sm-8">
					    	<input type="text" name="mobile" class="form-control" id="mobile" placeholder="输入手机号">
					    </div>
					 </div>		
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="mobile">上级会员ID</label>
					    <div class="col-sm-8">
					    	<input type="text" name="ownerId" class="form-control" id="ownerId" placeholder="输入上级会员Id">
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3"></label>
					    <label class="col-sm-8" id="tips" style="color:red"></label>
					 </div>				 					 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">立即添加</button>
			      </div>
		      </form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
	
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue"><td width="10%" class="distributor-font">分销商姓名</td><td width="20%">ID</td><td width="15%">等级</td><td width="10%">所属会员</td><td width="10%">下属会员</td><td width="10%">账户余额(元)</td><td width="25%">操作</td></tr>
			<tbody id="content-table"></tbody>							
		</table>
		<div style="background-color:#eff3f8;height:60px;margin-top:-20px">
			<div class="col-sm-3"><span id ="statics" style="line-height:60px"></span></div>
			<div class="col-sm-9"><div id="pagination" style="float:right"></div></div>
		</div>
		<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">提示</h4>
		      </div>
		      <div class="modal-body">			
		      	是否删除分销商？ 					 
			  </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <a type="button" id="deleteUrl" class="btn btn-danger">确定</a>
			      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
		
		<div class="modal" id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">分销商充值</h4>
		      </div>
		       <form id="rechargeForm" class="form-horizontal" role="form"> 	
			      <div class="modal-body">	
			      		<br>
				      	<div class="form-group">
							<label class="col-sm-3 control-label" for="recharge">充值金额</label>
							<div class="col-sm-8">
								<input type="hidden" name="distributorId" id="rechargeDistributorId">
								<input type="text" name="money" class="form-control" id="money" placeholder="输入充值金额">
							</div>
						</div>
						<br>
				  </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">立即添加</button>
			      </div>
		      </form>	
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/jquery.pagination.js"></script>
<script type="text/javascript">

$(function (){
	var pageIndex = 0; //页面索引初始值
	var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
	
	//添加分销商
	$('#distributorAddForm').on('submit',function(){
		var name = $('#distributorName').val();
		var commison = $('#commission').val();
		var mobile = $('#mobile').val();
		var ownerId = $('#ownerId').val();
		if(name === ''){
			//alert('请输入分销商姓名');
			$('#tips').text('请输入分销商姓名');
			return false;
		}
		if(mobile === ''  ||  !(/^1[3|4|5|8]\d{9}$/.test(mobile))){
			//alert('请输入合格的手机号');
			$('#tips').text('请输入合格的手机号');
			return false;
		}
		if(ownerId != ''  ||  isNaN(ownerId)){
			//alert('请输入合格的上级会员ID');
			$('#tips').text('请输入合格的上级会员ID');
			return false;
		}
		
		return true;
	});
	
	
	///上级ID文本框校验事件
	$('#ownerId').on('input',function(){
		$.ajax({
			type:"GET",
			url:"/distributor/validateDistributorLevel/" + $('#level').val() + "/" + $('#ownerId').val() ,
		 	success: function(data) {
		 		if(data.success){
		 		}
		 		else{
		 			alert(data.content);
		 		}
			}
		});
	});
	
	//初始化页面
	$.ajax({
		type:"GET",
		url:"/distributor/list/0",
	 	success: function(data) {
	 		coreFunction(data);
		}
	});
	
	//核心方法
	function coreFunction(data){
		if(data.success){
			var para = '';
			$(data.content).each(function (key,value) { //遍历返回的json   
				var name = value.owner != null ? value.owner.name :'暂无';
				var level = value.level == 1 ? '钻石会员':value.level == 2 ? '金牌会员':'VIP会员';
				para += '<tr><td>'+ value.name + 
                        '</td><td>'+ value.id +'</td><td>'+ level + 
                        '</td><td>'+ name +'</td><td><a href="/distributor/distributorSubmember/'+ value.id +'">查看</a></td><td id="money'+value.id+'">￥' + value.balance +
                        '</td><td><a class="blue" href="/distributor/distributorEdit/'+value.id+
                        '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除&nbsp;&nbsp;</a>'+
						'<a class="green chargeBtn" data-toggle="modal" data-target="#rechargeModal" id="charge,'+value.id+'"><i class="ace-icon fa fa-check"></i>&nbsp;账户充值&nbsp;&nbsp;</a>'+
                        '</td></tr>';        
            });
			$("#content-table").empty();
            $("#content-table").append(para);
            $("#statics").html('总记录数： '+data.total);
            
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
                    url: "/distributor/list/" + index,
                    error:function(XMLHttpRequest, textStatus, errorThrown){
                    	alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    },
                    success: function(data) {
                        if (data.success) {
                        	var para = '';
            				$(data.content).each(function (key,value) { //遍历返回的json   
            					var name = value.owner != null ? value.owner.name :'暂无';
            					var level = value.level == 1 ? '钻石会员':value.level == 2 ? '金牌会员':'VIP会员';
            					para += '<tr><td>'+ value.name + 
	            					'</td><td>'+ value.id +'</td><td>'+ level + 
	                                '</td><td>'+ name +'</td><td><a href="/distributor/distributorSubmember/'+ value.id +'">查看</a></td><td id="money'+value.id+'">￥' + value.balance +
	                                '</td><td><a class="blue" href="/distributor/distributorEdit/'+value.id+
	                                '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
	        						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除&nbsp;&nbsp;</a>'+
	        						'<a class="green chargeBtn" data-toggle="modal" data-target="#rechargeModal" id="charge,'+value.id+'"><i class="ace-icon fa fa-check"></i>&nbsp;账户充值&nbsp;&nbsp;</a>'+
	                                '</td></tr>'; 
            				});
            				$("#content-table").empty();
                            $("#content-table").append(para);
                            $("#statics").html('总记录数： '+data.total);
                            
                            $('.deleteBtn').click(function(){
                        		var id = $(this).attr('id');
                        		var url= "/distributor/distributorDelete/"+id;
                        		$("#deleteUrl").attr("href",url); 
                        		return true;
                        	});
                            
                            $('.chargeBtn').on('click',function(){
                            	var id = $(this).attr('id').split(',')[1];
                            	$('#rechargeDistributorId').val(id);
                            	return true;
                            });
                            
                        }
                    }
                });
            };
            
            $('.deleteBtn').click(function(){
        		var id = $(this).attr('id');
        		var url= "/distributor/distributorDelete/"+id;
        		$("#deleteUrl").attr("href",url); 
        		return true;
        	});
            
            $('.chargeBtn').on('click',function(){
            	var id = $(this).attr('id').split(',')[1];
            	$('#rechargeDistributorId').val(id);
            	return true;
            });
            
            $('#rechargeForm').on('submit',function(){
            	var money = $('#money').val();
            	if(money === '' || isNaN(money) || money <= 0){
            		alert('请输入合格的金额');
            		return false;
            	}
            	
            	$.ajax({
					type:'GET',
					url:'/distributor/recharge/'+ $('#rechargeDistributorId').val() +'/' +$('#money').val(),
					success: function(data){
						if(data.success){
							var v = '#money'+$('#rechargeDistributorId').val();
							$(v).html('￥' + data.content);
							$('#rechargeModal').modal('hide')
						}else{
							alert('充值失败');
						}
					}
            	})
            	return false;
            });
		}
	}
})

</script>
</body>
</html>