<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
			<b><em></em>商品搜索</b>
		</h4>
	</div>
	<form id="commoditySearchForm" class="form-horizontal" role="form">
         <div class="form-group">
		    <label class="col-sm-2 control-label" for="distributorName">商品分类</label>
		    <div class="col-sm-3">
		    	<select id="category" name="categoryId" class="selectpicker col-sm-12 form-control">
				</select>
		    </div>
		    <div class="col-sm-2">
		    	<button type="submit" class="btn btn-primary btn-primary">查询&nbsp;&nbsp;<i class="glyphicon glyphicon-search"></i></button>
		    </div>
		 </div> 
    </form>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
			<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称</td>
			<td width="10%">商品分类</td>
			<td width="15%">商品ID</td>
			<td width="15%">商品价格(元)</td>
			<td width="30%">操作</td></tr>
			<tbody id="content-table"><tr><td colspan="5">暂无查询结果</td></tr></tbody>
		</table>
		<div id="bottom-tip" style="background-color:#eff3f8;height:60px;margin-top:-20px;display:none">
			<div class="col-sm-3"><span id ="statics" style="line-height:60px"></span></div>
			<div class="col-sm-9"><div id="pagination" style="float:right"></div></div>
		</div>
		
		<div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#4E8BBE">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel"><strong style="color:white;">提示</strong></h4>
		      </div>
		      <div class="modal-body">			
		      	是否下线商品？ 					 
			  </div>
			      <div class="modal-footer" style="background-color:white">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <a type="button" id="deleteUrl" class="btn btn-danger">立即下线</a>
			      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
		
		 <div class="modal fade" id="modal-info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		   <div class="modal-dialog">
		      <div class="modal-content">
		         <div class="modal-header" style="background-color:#4E8BBE">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
		                  &times;</button>
		            <h4 class="modal-title" id="myModalLabel"><strong style="color:white;">提示</strong></h4>
		         </div>
		         <div class="modal-body" style="padding:20px;font-size:18px;"></div>
		         <div class="modal-footer" style="background-color:white">
		            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
		            </button>
		            <button type="button" class="btn btn-primary btn-ok" data-dismiss="modal">确定
		            </button>
		         </div>
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
$(function(){
	var pageIndex = 0; //页面索引初始值
	var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
	
	$.ajax({
		type:"GET",
		url:"/distributor/categoryString",
	 	success: function(data) {
	 		if(data.success){
	 			var strs= new Array(); //定义一数组 
	    		strs = data.content.split(";"); ///字符分割 
	    		for(var i = 0; i < strs.length-1; i++){ 
	    			var ss = new Array();
	    			ss = strs[i].split(',');
	    			var item = new Option(ss[1], ss[0]);  
	    		    $("#category").append(item);  
	    		} 
	 		}
		}
	});
	
	$('#commoditySearchForm').on('submit',function(){
		$.ajax({
			type:"GET",
			url:"/distributor/commodityList/" + $('#category').val() + '/0',
		 	success: function(data) {
		 		if(data.success){
		 			var para = '';
					$(data.content).each(function (key,value) { //遍历返回的json  
						var display = '';
						if (data.user.role === 1) {
							display = '<a class="blue" href="/distributor/commodity/'+value.id+
		                        '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
								'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除&nbsp;&nbsp;</a>'+
								 '<a class="green add2Order" id="add,'+value.id+'"><i class="ace-icon fa fa-check">&nbsp;加入订单</a>';
						} else {
							display = '<a class="green add2Order" id="add,'+value.id+'"><i class="ace-icon fa fa-check">&nbsp;加入订单</a>';
						}
						
						para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ value.brand+'·'+value.name + '</td><td>'
								+ value.categoryName +'</td><td>'+ value.id +'</td><td>￥ '+ value.displayPrice + 
		                        '</td><td>' + display+ '</td></tr>';        
		            });
					$("#content-table").empty();
		            $("#content-table").append(para);
		            $("#statics").html('总记录数： '+data.total);
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
		                    url: "/distributor/commodityList/" + index,
		                    error:function(XMLHttpRequest, textStatus, errorThrown){
		                    	alert(XMLHttpRequest.status);
		                        alert(XMLHttpRequest.readyState);
		                        alert(textStatus);
		                    },
		                    success: function(data) {
		                        if (data.success) {
		                        	var para = '';
		                			$(data.content).each(function (key,value) { //遍历返回的json   
		                				var display = '';
		                				if (data.user.role === 1) {
		                					display = '<a class="blue" href="/distributor/commodity/'+value.id+
		                                        '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
		                						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除&nbsp;&nbsp;</a>'+
		                						 '<a class="green add2Order" id="add,'+value.id+'"><i class="ace-icon fa fa-check">&nbsp;加入订单</a>';
		                				} else {
		                					display = '<a class="green add2Order" id="add,'+value.id+'"><i class="ace-icon fa fa-check">&nbsp;加入订单</a>';
		                				}
		                				
		                				para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ value.brand+'·'+value.name + '</td><td>'
		                						+ value.categoryName +'</td><td>'+ value.id +'</td><td>￥ '+ value.displayPrice + 
		                                        '</td><td>' + display+ '</td></tr>';        
		                            });
		                			$("#content-table").empty();
		                            $("#content-table").append(para);
		                            $("#statics").html('总记录数： '+data.total);
		                            
		                            $('.deleteBtn').click(function(){
		                        		var id = $(this).attr('id');
		                        		var url= "/distributor/commodity/delete/"+id;
		                        		$("#deleteUrl").attr("href",url); 
		                        		return true;
		                        	});
		                            $('.add2Order').click(function(){
		                            	var id = $(this).attr('id').split(',')[1];
		                            	$.ajax({
		                            		type:'GET',
		                            		url:'/distributor/addCommodity/' + id,
		                            		success: function(data){
		                            			if (data.success) {
		                            				$('#modal-info').modal('show');
		                            				$('#modal-info').find('.btn-ok').attr('style','');
		                            				$('.modal-body').html('恭喜您商品添加成功！您可以点击关闭继续添加商品或者确定前往订单消费结账！')
		                            				$('#modal-info').find('.btn-ok').click(function(){
		                            					location.href = "/distributor/pages/ordersubmit.jsp";
		                            				})
		                            				//alert('商品添加成功');
		                            			} else {
		                            				$('#modal-info').modal('show');
		                            				$('.modal-body').html('对不起商品添加失败！'+ data.content)
		                            				$('#modal-info').find('.btn-ok').attr('style','display:none');
		                            				//alert(data.content);
		                            			}
		                            		}
		                            	});
		                            	return false;
		                            });
		                        }
		                    }
		                });
		            };
		            
		            $('.add2Order').click(function(){
		            	var id = $(this).attr('id').split(',')[1];
		            	$.ajax({
		            		type:'GET',
		            		url:'/distributor/addCommodity/' + id,
		            		success: function(data){
		            			if (data.success) {
		            				$('#modal-info').modal('show');
		            				$('#modal-info').find('.btn-ok').attr('style','');
		            				$('.modal-body').html('恭喜您商品添加成功！<br>您可以“关闭”继续添加商品或者“前往”订单消费处结账！')
		            				$('#modal-info').find('.btn-ok').click(function(){
		            					location.href = "/distributor/pages/ordersubmit.jsp";
		            				})//alert('商品添加成功');
		            			} else {
		            				$('#modal-info').modal('show');
		            				$('.modal-body').html('对不起商品添加失败,'+ data.content)
		            				$('#modal-info').find('.btn-ok').attr('style','display:none');
		            				//alert(data.content);
		            			}
		            		}
		            	});
		            	return false;
		            });
		            $('.deleteBtn').click(function(){
		        		var id = $(this).attr('id');
		        		var url= "/distributor/commodity/delete/"+id;
		        		$("#deleteUrl").attr("href",url); 
		        		return true;
		        	});
		    		var strs= new Array(); //定义一数组 
		    		strs = data.categoriesStr.split(";"); ///字符分割 
		    		$("#category").empty();
		    		for(var i = 0; i < strs.length-1; i++){ 
		    			var ss = new Array();
		    			ss = strs[i].split(',');
		    			var item = new Option(ss[1], ss[0]);  
		    		    $("#category").append(item);  
		    		} 
		 		}
			}
		})
		return false;
	})
});    

</script>
</body>
</html>