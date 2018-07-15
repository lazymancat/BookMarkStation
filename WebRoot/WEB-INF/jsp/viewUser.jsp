<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">  
    <title>查看用户</title>
</rapid:override>  

<rapid:override name="style">
	<style>
	
		html,body{
			overflow-x: hidden;
		}
		.row{
			margin:0px;
		}
		.viewUser{
			padding:0px;
			min-height:450px;
			border: 1px dashed #CCCCCC;
			margin-bottom: 20px;
		}
		.viewUser-nav{
			padding:0px;
		}
		.viewUser-content{
			padding:20px;
			border:1px dashed #CCCCCC;
		}

		.user-photo{
			width:222px;
			height:222px;
		}
		.user-name{
			width:100%;
			height:80px;
			line-height: 80px;
			font-size: 40px;
			font-weight: 600px;
			padding-left:20px;
			color:#555555;
			border-bottom: 1px solid #CCCCCC;
		}
		.user-description{
			width:100%;
			font-size: 18px;
			padding:20px;
			color:#AAAAAA;
		}
		.user-info-1{
			max-height: 280px; 
			overflow: hidden;
		}

		.div-bookmark{
			padding:0px;
		}
		.div-bookmark .panel-body div{
			width:100%; 
			height:100px; 
			overflow: hidden;
		}
		.bookmark{
			margin-bottom: 20px;
		}
		.bookmark-title{ 
		    white-space: nowrap;  
		    width: 100%;   
		    overflow: hidden;   
		    text-overflow:ellipsis; 
		}
		.bookmark .panel:hover{
			box-shadow: 0px 0px 10px #000000;
		}
		.bookmark .panel .panel-heading:hover{
			cursor: pointer;
			background-color: #DDDDDD;
		}
		.bookmark .panel .panel-footer .btn{
			margin-left: 20px;
		}
		.bookmark-summary{
			width:100%; 
			height:100px; 
			overflow: hidden;
		}
		
		.bookmark-img{
			width:100%; 
			height:200px;
		}
		.bookmark-img:hover{
			opacity: 0.5;
			cursor: pointer;
		}

		.form-control[disabled], .form-control[readonly]{
			background-color:#FFFFFF;
		}
		.form-control[disabled]:hover, .form-control[readonly]:hover{
			cursor:default;
		}

		.btn-focusUser{
			width:100px;
			line-height: 24px;
			margin-top: 20px; 
			margin-left:25%;
		}
		.btn-beFocused{
			background-color: #CCCCCC;
			border-color:#CCCCCC;
		}
		.btn-beFocused:hover{
			background-color: #AAAAAA;
			border-color:#CCCCCC;
		}

	</style>
</rapid:override> 

<rapid:override name="content">
	<!-- <input type="text" readonly="readonly" class="input-datepicker" data-provide="datepicker"/> -->
	<div class="row">
		<div class="col-lg-12 viewUser">
			<!-- 导航栏 -->
			<div class="col-lg-2 viewUser-nav">
				<ul class="nav nav-pills nav-stacked">
				    <li class="active">
				    	<a href="#info" data-toggle="tab">个人信息</a>
				    </li>
				    <li>
				    	<a href="#collectedList" data-toggle="tab">收藏列表</a>
				    </li>
				</ul>
			</div>

			<!-- 内容 -->
			<div class="col-lg-10 viewUser-content">
				<div class="tab-content">
					<!-- 个人信息 -->
				    <div class="tab-pane active" id="info">
				    	<input type="hidden" class="user-userID" value="${viewUser.ID}">
				    	<div class="row user-info-1">
				    		<div class="col-md-3">
				    			<img class="img-circle img-thumbnail user-photo" src="img/user/${viewUser.img.name}"/>
				    			<div class="btn btn-primary btn-sm btn-focusUser">关注</div>
				    		</div>
				    		<div class="col-md-9">
				    			<div class="user-name">
				    				<span>${viewUser.username}</span>
				    			</div>
				    			<div class="user-description">
				    				<span>${viewUser.description}</span>
				    			</div>
				    		</div>
				    	</div>
				    	<div class="row">
				    		<div class="form-group" style="margin-top: 20px; border-top:1px solid #CCCCCC; padding:20px;">
					    		<div class="input-group col-md-3" style="float: left">
					    			<span class="input-group-addon">生日</span>
					    			<input class="form-control user-birthday" readonly="readonly" disabled="disabled" type="text" value="${viewUser.birthday}"/>
					    		</div>
					    		<div class="input-group col-md-3 col-md-offset-1" style="float: left">
					    			<span class="input-group-addon">性别</span>
					    			<input class="form-control user-sex" readonly="readonly" disabled="disabled" type="text" value="${viewUser.sex}"/>
					    		</div>
					    		<div class="input-group col-md-3 col-md-offset-1" style="float: left">
					    			<span class="input-group-addon">注册日期</span>
					    			<input class="form-control user-rgstDate" readonly="readonly" disabled="disabled" type="text" value="${viewUser.rgstDate}"/>
					    		</div>
					    	</div>
				    	</div>
				    </div>
				    <!-- 收藏列表 -->
				    <div class="tab-pane" id="collectedList">
				    	<div class="row">
				    		<div class="input-group" style="margin-left:15px; margin-bottom:20px; width:400px">
				    			<input type="text" class="form-control input-collectList-word" placeholder="请输入关键字.."/>
				    			<span class="input-group-btn">
				    				<button class="btn btn-default btn-collectedList-search">搜索</button>
				    			</span>
				    		</div>
				    	</div>
				    	<div class="row div-bookmark">
							<div class="row" style="min-height: 550px">
							</div>

							<div class="row bookmark-p" style="text-align: center">
								<input type="hidden" class="bookmark-lastQuery"/>
								<input type="hidden" class="bookmark-totalPage" value="1"/>
								<input type="hidden" class="bookmark-nowPage" value="1"/>

								<div class="btn-group">
									<button class="btn btn-default btn-firstPage">&lt;&lt;</button>
									<button class="btn btn-default btn-prevPage">&lt;</button>
								</div>
								<span>第</span>
								<span class="input-jumpPage">1</span>
								<span>/</span>
								<span class="span-totalPage">1</span>
								<span>页</span>
								<div class="btn-group">
									<button class="btn btn-default btn-nextPage">&gt;</button>
									<button class="btn btn-default btn-lastPage">&gt;&gt;</button>
								</div>
							</div>
						</div>
				    </div>
			  	</div>
			</div>
		</div>
	</div>
</rapid:override> 

<rapid:override name="popup">
</rapid:override> 

<rapid:override name="script">
	<script>
		$(document).ready(function (){
			if($('.user-ID').length != 0){
				checkUserBeFocus();
				removeButtonForMyself();
			}
		});

		// 收藏列表 分页按钮
		$('.btn-firstPage').click(function (){
			if($('.bookmark-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = 1;
			queryBookMarkListPage_User(word, pageNum);
		});
		$('.btn-prevPage').click(function (){
			if($('.bookmark-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var word = $('.bookmark-lastQuery').val();
			var pageNum = -1 + parseInt($('.bookmark-nowPage').val());
			queryBookMarkListPage_User(word, pageNum);
		});
		$('.btn-nextPage').click(function (){
			if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = 1 + parseInt($('.bookmark-nowPage').val());
			queryBookMarkListPage_User(word, pageNum);
		});
		$('.btn-lastPage').click(function (){
			if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = $('.bookmark-totalPage').val();
			queryBookMarkListPage_User(word, pageNum);
		});

		// 查询收藏书签列表
		function queryBookMarkListPage_User(word, pageNum){

			var pageSize = 8;
			var url = "BookMark_getBookMarkListPage_User";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
					userID:$('.user-userID').val()
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.bookmark-lastQuery').val(word);
						$('.bookmark-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.bookmark-nowPage').val(pageNum);
						$('.input-jumpPage').text(pageNum);
						$('.span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createBookMark(rows[i]['ID'], rows[i]['name'], rows[i]['summary'], rows[i]['link'], rows[i]['img']['name']);
							 // console.log(rows);
						}
						 $('.div-bookmark').children(".row").first().html(html);
					}else{
						$('.bookmark-lastQuery').val(word);
						$('.bookmark-totalPage').val(1);
						$('.bookmark-nowPage').val(1);
						$('.input-jumpPage').text(1);
						$('.span-totalPage').text(1);
						$('.div-bookmark').children(".row").first().html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 搜索
		$('.btn-collectedList-search').click(function(){
			queryBookMarkListPage_User($('.input-collectList-word').val(), 1);
		});

		// 跳转到书签页
		function jumpBookMark(address){
			window.open(address);
		}

		// 切换模块 显示不同内容
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			if($(this).text().substr(0, 4) == "收藏列表"){
				queryBookMarkListPage_User('', 1);
			}
		});

		// 收藏按钮覆盖响应
		$('.btn-focusUser').on('mouseover', function(){
			if($(this).text() == "已关注"){
				$(this).text('取消关注');
			}
		});
		$('.btn-focusUser').on('mouseout', function(){
			if($(this).text() == "取消关注"){
				$(this).text('已关注');
			}
		});

		// 关注/取消关注
		$('.btn-focusUser').on('click', function(){
			$theButton = $(this);
			//用户已登录
			if($('.user-ID').length !=  0){
				if($(this).text() == "关注"){
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							toUserID:$(".user-userID").val(),
							fromUserID:$('.user-ID').val()
						},
						url:"User_addFocus",
						async:false,
						success:function(data, status){
							if(data['result'] == true){

								$theButton.text("已关注");
								$theButton.addClass("btn-beFocused");
							}else{
								alert('关注失败');
							}
						},
						error:function (xhr, textStatus, errorThrown){
							alert(textStatus + ":" + errorThrown);
						}
					});
				}else if($(this).text() == "取消关注"){
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							toUserID:$(".user-userID").val(),
							fromUserID:$('.user-ID').val()
						},
						url:"User_removeFocus",
						success:function(data, status){
							if(data['result'] == true){

								$theButton.text("关注");
								$theButton.removeClass("btn-beFocused");

							}else{
								alert('取消关注失败');
							}
						},
						error:function (xhr, textStatus, errorThrown){
							alert(textStatus + ":" + errorThrown);
						}
					});
				}
			}else{
				alert("请先登录");
			}
		});

		// 根据关注状态改变关注按钮内容
		function checkUserBeFocus(){
			var toUserID = $(".user-userID").val();
			var fromUserID = $('.user-ID').val();

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					fromUserID:fromUserID,
					toUserID:toUserID
				},
				async:false,
				url:"User_checkUserBeFocus",
				success:function(data, status){
					if(data != null && data['result'] == true){
						$('.btn-focusUser').text('已关注');
						$('.btn-focusUser').addClass("btn-beFocused");
					}
				},
				error:function(xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		function removeButtonForMyself(){
			if($('.user-userID').val() == $('.user-ID').val()){
				$('.btn-focusUser').remove();
			}
		}
	</script>
</rapid:override> 

<%@ include file="base.jsp" %> 