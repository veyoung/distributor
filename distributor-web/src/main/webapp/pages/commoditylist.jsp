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
			<b><em></em>商品列表</b>
			<div class="pull-right action-group">               
				<button class="btn btn-success" data-toggle="modal" data-target="#myModal">
  					<i class="ace-icon fa fa-plus-circle"></i>添加商品
				</button>                     
			</div>
		</h4>
		
		
		<!-- Modal -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">添加商品</h4>
		      </div>
		      <form id="commodityAddForm" action="/distributor/commodity" method="post" class="form-horizontal" role="form">
			      <div class="modal-body">
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityName">商品名</label>
					    <div class="col-sm-8">
					    	<input type="text" name="name" class="form-control" id="commodityName" placeholder="输入商品名">
					    </div>
					 </div>
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityBrand">商品品牌</label>
					    <div class="col-sm-8">
					    	<input type="text" name="brand" class="form-control" id="commodityBrand" placeholder="输入商品品牌">
					    </div>
					 </div>
			         <div class="form-group">
					    <label class="col-sm-3 control-label" for="category">商品分类</label>
					    <div class="col-sm-8">
					    	<select id="category" name="categoryId" class="selectpicker col-sm-12 form-control">
							</select>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">商品价格</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="price" class="form-control" id="commodityPrice" placeholder="输入商品价格">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">vip消费自身提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="vipVip" class="form-control" id="vipVip" placeholder="输入vip消费自身提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">vip消费金牌提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="vipGold" class="form-control" id="vipGold" placeholder="输入vip消费金牌上级提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					  <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">vip消费钻石提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="vipDiamond" class="form-control" id="vipDiamond" placeholder="输入vip消费钻上级提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">金牌消费自身提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="goldGold" class="form-control" id=""goldGold"" placeholder="输入金牌消费自身提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					  <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">金牌消费钻石提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="goldDiamond" class="form-control" id="goldDiamond" placeholder="输入金牌消费钻石上级提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityPrice">钻石消费自身提成</label>
					    <div class="col-sm-8">
					    	<div class="input-group">
					    		<input type="text" name="diamondDiamond" class="form-control" id=""diamondDiamond" placeholder="输入钻石消费自身提成金额">
					    		<div class="input-group-addon">元</div>
					    	</div>
					    </div>
					 </div>	
					 <div class="form-group">
					    <label class="col-sm-3 control-label" for="commodityDescription">商品说明</label>
					    <div class="col-sm-8">
					    	<input type="text" name="description" class="form-control" id="commodityDescription" placeholder="输入商品说明">
					    </div>
					 </div>		
					 <div class="form-group">
					    <label class="col-sm-3"></label>
					    <label class="col-sm-8" id="tips" style="color:red"></label>
					 </div>				 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="submit" class="btn btn-primary">保存</button>
			      </div>
		       </form>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->  
	</div>
	
	
	<div class="row">
		<table class="table table-striped table-hover">
			<tr class="table-title-blue">
			<td width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品名称</td>
			<td width="15%">商品分类</td>
			<td width="15%">商品ID</td>
			<td width="15%">商品价格(元)</td>
			<td width="15%">商品说明</td>
			<td width="20%">操作</td></tr>
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
		      	是否下线商品？ 					 
			  </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <a type="button" id="deleteUrl" class="btn btn-danger">立即下线</a>
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

$(function(){
	
	var pageIndex = 0; //页面索引初始值
	var pageSize = 10; //每页显示条数初始化，修改显示条数，修改这里即可
	
	//添加商品
	$('#commodityAddForm').on('submit',function(){
		var name = $('#commodityName').val();
		var brand = $('#commodityBrand').val();
		var price = $('#commodityPrice').val();
		var description = $('#commodityDescription').val();
		if(name === ''){
			$('#tips').text('请输入商品名');
			return false;
		}
		if(brand === ''){
			$('#tips').text('请输入商品品牌');
			return false;
		}
		if(price === '' || isNaN(price)){
			$('#tips').text('请输入合格的商品价格');
			return false;
		}	
		return true;
	});
	
	//初始化页面
	$.ajax({
		type:"GET",
		url:"/distributor/commodityList/0",
	 	success: function(data) {
	 		coreFunction(data);
	 		
		}
	})
	
	//核心方法
	function coreFunction(data){
		if(data.success){
			var para = '';
			$(data.content).each(function (key,value) { //遍历返回的json   
				para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ value.brand+'·'+value.name + '</td><td>'
						+ value.categoryName +'</td><td>'+ value.id +'</td><td>'+ value.displayPrice + 
                        '</td><td>'+ value.description +'</td><td>'+
                        '<a class="blue" href="/distributor/commodity/'+value.id+
                        '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
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
                				para += '<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;'+ value.brand+'·'+value.name + '</td><td>'
	        						+ value.categoryName +'</td><td>'+ value.id +'</td><td>'+ value.displayPrice + 
	                                '</td><td>'+ value.description +'</td><td>'+
	                                '<a class="blue" href="/distributor/commodity/'+value.id+
	                                '"><i class="ace-icon fa fa-pencil"></i>&nbsp;编辑&nbsp;&nbsp;</a><a class="orange deleteBtn" id="'+value.id+
	        						'" data-toggle="modal" data-target="#deleteModal"><i class="ace-icon fa fa-trash-o"></i>&nbsp;删除</a>'
	                                '</td></tr>';        
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
                        }
                    }
                });
            };
            
            $('.deleteBtn').click(function(){
        		var id = $(this).attr('id');
        		var url= "/distributor/commodity/delete/"+id;
        		$("#deleteUrl").attr("href",url); 
        		return true;
        	});
            
    		var strs= new Array(); //定义一数组 
    		strs = data.categoriesStr.split(";"); ///字符分割 
    		for(i = 0; i < strs.length-1; i++){ 
    			var ss = new Array();
    			ss = strs[i].split(',');
    			var item = new Option(ss[1], ss[0]);  
    		    $("#category").append(item);  
    		} 
		}
	}
	
})
</script>
</body>
</html>