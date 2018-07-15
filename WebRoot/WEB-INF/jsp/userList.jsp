<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<rapid:override name="title">  
    <title>用户查找</title>
</rapid:override>  

<rapid:override name="style">
	<style type="text/css">
		html,body{
			overflow-x: hidden;
		}

		.user-page{
			text-align: center;
			margin-bottom:10px;
		}

		.row{
			margin:0px;
		}
		.user-list{
			box-shadow: 0px -1px 4px #000000;
		}
		.user{
			height: 100px; 
			padding:10px;
			border-bottom: 1px solid #CCCCCC;
		}
		.user-img{
			width:60px;
			height:60px;
			float:left;
			margin:10px;
		}
		.user-info{
			margin-left:20px;
			float: left;
		}
		.user-name{
			font-size:24px;
			font-weight: 600;
			line-height: 40px;
		}
		.user-name:hover{
			cursor:pointer;
			color:#777777;
		}
		.user-description{
			font-size:16px;
			font-weight: 500;
			line-height: 30px;
			white-space: nowrap;  
		    width:600px;   
		    overflow: hidden;   
		    text-overflow:ellipsis; 
		}
		.btn-focusUser{
			float: right;
			height:40px;
			width:100px;
			line-height: 28px;
			margin-top:20px;
			margin-right:20px;
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
	<div class="row">
		<div class="col-lg-10 div-user">
			<!-- 列表区域 -->
			<div class="row user-list" style="min-height: 550px">
			</div>

			<!-- 分页组件 -->
			<div class="row user-page">
				<input type="hidden" class="user-lastQuery" value="${word}"/>
				<input type="hidden" class="user-totalPage" value="1"/>
				<input type="hidden" class="user-nowPage" value="1"/>

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
</rapid:override> 

<rapid:override name="popup">
</rapid:override> 

<rapid:override name="script">
	<script>
		$(document).ready(function (){
			// 初始化
			$('#btn-toggleSearchType').html("用户&nbsp;&nbsp;<span class='caret'></span>");
			queryUserListPage($('.user-lastQuery').val(), 1);
		});

		// 分页按钮
		$('.btn-firstPage').click(function (){
			if($('.user-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.user-lastQuery').val();
			var pageNum = 1;
			queryUserListPage(word, pageNum);
		});
		$('.btn-prevPage').click(function (){
			if($('.user-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var word = $('.user-lastQuery').val();
			var pageNum = -1 + parseInt($('.user-nowPage').val());
			queryUserListPage(word, pageNum);
		});
		$('.btn-nextPage').click(function (){
			if($('.user-nowPage').val() == $('.user-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.user-lastQuery').val();
			var pageNum = 1 + parseInt($('.user-nowPage').val());
			queryUserListPage(word, pageNum);
		});
		$('.btn-lastPage').click(function (){
			if($('.user-nowPage').val() == $('.user-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.user-lastQuery').val();
			var pageNum = $('.user-totalPage').val();
			queryUserListPage(word, pageNum);
		});

		// 分页插件用户数据
		function queryUserListPage(word, pageNum){

			var pageSize = 8;
			var url = "User_getUserListPage";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.user-lastQuery').val(word);
						$('.user-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.user-nowPage').val(pageNum);
						$('.input-jumpPage').text(pageNum);
						$('.span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createUser(rows[i]['img']['name'], rows[i]['ID'], rows[i]['username'], rows[i]['description']);
						}
						 $('.user-list').html(html);

						if($('.user-ID').length != 0){
							checkUserBeFocus();
							removeButtonForMyself();
						}
					}else{
						$('.user-lastQuery').val(word);
						$('.user-totalPage').val(1);
						$('.user-nowPage').val(1);
						$('.input-jumpPage').text(1);
						$('.span-totalPage').text(1);

						$('.user-list').html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 根据关注状态改变关注按钮内容
		function checkUserBeFocus(){
			$.ajax({
				type:'post',
				dataType:"json",
				data:{
					fromUserID:$('.user-ID').val()
				},
				url:"User_getUserFocusList",
				async:false,
				success:function(data, status){
					if(data != null){
						$('.user').each(function(){
							var userID = $(this).children('.user-userID').val();
							var result = 0;
							for(var i in data['data']){
								if(data['data'][i]['ID'] == userID){
									result = 1;
									break;
								}
							}

							if(result == 1){
								$(this).children('.btn-focusUser').text('已关注');
								$(this).children('.btn-focusUser').addClass('btn-beFocused');
							}
						});
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 如果列表项为当前登录用户 移除关注按钮 并红名
		function removeButtonForMyself(){
			$('.user').each(function(){
				if($(this).children(".user-userID").val() == $('.user-ID').val()){
					$(this).children(".btn-focusUser").remove();
					$(this).find('.user-name').css('color', '#FF4500');
				}
			});
		}

		//收藏按钮覆盖响应
		$('.user-list').on('mouseover', '.btn-focusUser', function(){
			if($(this).text() == "已关注"){
				$(this).text('取消关注');
			}
		});
		$('.user-list').on('mouseout', '.btn-focusUser', function(){
			if($(this).text() == "取消关注"){
				$(this).text('已关注');
			}
		});

		// 点击用户名可跳转至用户页
		$('.user-list').on('click', '.user-name', function(){
			window.open("User_viewUser?ID=" + $(this).parents('.user').children(".user-userID").val());
		});

		// 关注/取消关注用户
		$('.user-list').on('click', '.btn-focusUser', function(){
			$theButton = $(this);
			//用户已登录
			if($('.user-ID').length !=  0){
				if($(this).text() == "关注"){
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							toUserID:$(this).parent().children(".user-userID").val(),
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
							toUserID:$(this).parent().children(".user-userID").val(),
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

	</script>
</rapid:override> 

<%@ include file="base.jsp" %> 