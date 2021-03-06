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
			<b><em></em>商品分类列表</b>
			<div class="pull-right action-group">     
				<c:if test="${sessionScope.user.role == 1}">            
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
  					<i class="ace-icon fa fa-plus-circle"></i>添加商品分类
				</button> 
				</c:if>                    
			</div>
		</h4>
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#4E8BBE">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel"><strong style="color:white;">添加商品分类</strong></h4>
		      </div>
		      <form action="/distributor/commodityCategory" method="post" class="form-horizontal" role="form">
			      <div class="modal-body">
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="categoryName">分类名</label>
					    <div class="col-sm-8">
					    	<input type="text" name="name" class="form-control" id="categoryName" placeholder="输入分类名">
					    </div>
					 </div>
			      </div>
			      <div class="modal-footer" style="background-color:white">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">保存</button>
			      </div>
		       </form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
	<div>
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
				<td width="30%">序号</td>
				<td width="35%">分类名</td>
				<td width="35%">操作</td>
				</tr>
			<tbody id="content-table"></tbody>
		</table>
		<div style="background-color:#eff3f8;height:60px;margin-top:-20px">
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
		      	将会删除该分类下的所有商品，是否确定？ 					 
			  </div>
			      <div class="modal-footer" style="background-color:white">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <a id="deleteUrl" type="button" class="btn btn-danger">确定</a>
			      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
</div>
<script src="/distributor/js/jquery-1.9.1.min.js"></script>
<script src="/distributor/js/bootstrap.min.js"></script>
<script src="/distributor/js/jquery.pagination.js"></script>
<script type="text/javascript">
var pageIndex = 0; //页面索引初始值
var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可

$(function(){
	
	//初始化页面
	$.ajax({
		type:"GET",
		url:"/distributor/commodityCategoryList/0",
	 	success: function(data) {
	 		if(data.success){
				var para = '';
				$(data.content).each(function (key,value) { //遍历返回的json 
					var count = key+1;
					para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ count + '</td><td>'
							+ value.name +'</td><td><a class="blue" href="/distributor/category/'+value.id
							+'"><i class="ace-icon fa fa-pencil"></i>&nbsp;查看&nbsp;&nbsp;&nbsp;</a>'
							+'<a class="orange deleteBtn" id="'+value.id
							+'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
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
	                    url: "/distributor/commodityCategoryList/" + index,
	                    error:function(XMLHttpRequest, textStatus, errorThrown){
	                    	alert(XMLHttpRequest.status);
	                        alert(XMLHttpRequest.readyState);
	                        alert(textStatus); 
	                    },
	                    success: function(data) {
	                        if (data.success) {
	                        	var para = '';
	                			$(data.content).each(function (key,value) { //遍历返回的json   
	                				var count = key+1;
	            					para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ count + '</td><td>'
			    							+ value.name +'</td><td><a class="blue" href="/distributor/category/'+value.id
			    							+'"><i class="ace-icon fa fa-pencil"></i>&nbsp;查看&nbsp;&nbsp;&nbsp;</a>'
			    							+'<a class="orange deleteBtn" id="'+value.id
			    							+'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
			    	                        '</td></tr>'; 
	                            });
	                			$("#content-table").empty();
	                            $("#content-table").append(para);
	                            $("#statics").html('总记录数： '+data.total);
	                            
	                            $('.deleteBtn').click(function(){
	                        		var id = $(this).attr('id');
	                        		var url= "/distributor/commodityCategory/delete/"+id;
	                        		$("#deleteUrl").attr("href",url); 
	                        		return true;
	                        	});
	                        }}
	                    });
	          	};
	          	
	            $('.deleteBtn').click(function(){
	        		var id = $(this).attr('id');
	        		var url= "/distributor/commodityCategory/delete/"+id;
	        		$("#deleteUrl").attr("href",url); 
	        		return true;
	        	});
			}
		}
	})
})
</script>
</body>
</html>