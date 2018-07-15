<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<rapid:override name="title">  
    <title>书签详情</title>
</rapid:override>  

<rapid:override name="style">
	<style type="text/css">
		html,body{
			overflow-x: hidden;
		}
		.bookmark-name{
			padding:10px;
			border-bottom: 1px solid #CCCCCC;

		}
		.bookmark-name h1{
			margin-top: 5px;
		}
		.bookmark-summary{
			padding:10px;
		}
		
		.btn-jump{
			width:100%;
			height:60px;
			line-height: 60px;
			background-color: #FF4500;
			color:white;
			font-size: 24px;
			font-weight: 500;
			margin-right:30px;
			margin-top: 20px;
			text-align: center;	
		}
		.btn-jump:hover{
			background-color: #DD1100;
			cursor: pointer;
			box-shadow: 0px 0px 10px #DD1100;
		}

		.btn-mark{
			width:100%;
			height:60px;
			line-height: 60px;
			background-color: #9C9C9C;
			color:white;
			font-size: 24px;
			font-weight: 500;
			margin-right:30px;
			margin-top: 20px;
			text-align: center;	
		}
		.btn-mark:hover{
			background-color: #707070;
			cursor: pointer;
			box-shadow: 0px 0px 10px #707070;
		}
		.btn-marked{
			background-color: #ffde57;
		}
		.btn-marked:hover{
			background-color: #fec025;
			box-shadow: 0px 0px 10px #fec025;
		}


		.btn-share{
			width:100%;
			height:60px;
			line-height: 60px;
			background-color: #00BFFF;
			color:white;
			font-size: 24px;
			font-weight: 500;
			margin-right:30px;
			margin-top: 20px;
			text-align: center;	
		}
		.btn-share:hover{
			background-color: #00A0DD;
			cursor: pointer;
			box-shadow: 0px 0px 10px #00A0DD;
		}

		.comment{
			width:100%; 
			padding:10px 30px 5px 30px;
		}
		.comment-photo{
			width:48px; 
			height:48px;
			display: inline;
		}
		.comment-name{
			width:100%; 
			height:48px; 
			line-height: 48px; 
			padding-left: 10px;
			font-size: 18px; 
			font-weight: 500; 
			display: inline;
		}
		.comment-date{
			width:100px; 
			height:48px; 
			line-height: 48px; 
			font-size: 14px; 
			font-weight: 500; 
			display: inline;
			float: right;
		}
		.comment-content{
			width:100%; 
			line-height:24px;
			padding-left: 60px; 
			padding-bottom: 10px; 
			color:#888888; 
			border-bottom: 1px solid #CCCCCC;
		}

		.comment-page{
			text-align: center;
			margin-bottom:10px;
		}

		.btn-addComment{
			width:30%; 
			float: right; 
			background-color: #98FB98; 
			font-size: 20px; 
			height:48px; 
			line-height: 48px; 
			text-align: center;
		}
		.btn-addComment:hover{
			background-color: #88EB88;
			cursor:pointer;
		}

		.commentsList{
			margin:10px 10px; 
			min-height: 150px;
			border:1px solid #CCCCCC;
		}
		.commentsList-heading{
			width:100%;  
			height:48px; 
			border-bottom: 1px solid #CCCCCC; 
			margin-bottom: 10px;
		}
		.commentsList-title{
			width:70%; 
			height:48px; 
			line-height: 48px; 
			font-size: 20px; 
			padding-left: 20px; 
			float: left;
		}

		.form-control[disabled], .form-control[readonly]{
			background-color:#FFFFFF;
		}
		.form-control[disabled]:hover, .form-control[readonly]:hover{
			cursor:pointer;
		}

		.bookmark-info{
			margin:10px 0px
		}
		.bookmark-labels{
			width:100%; 
			height:140px; 
			border:1px solid #CCCCCC; 
			padding:10px 20px;
		}
		.bookmark-labels-title{
			float: left;
			height:30px; 
			line-height: 30px;
			margin:5px;
		}
		.bookmark-label{
			float: left; 
			border:1px solid #1fa6ff; 
			height:30px; 
			line-height: 30px; 
			border-radius: 10px; 
			padding: 0px 10px; 
			margin:5px;
		}
		.bookmark-link, .bookmark-creator, .bookmark-date, .bookmark-collectNumber, .bookmark-commentNumber{
			width:100%; 
			border:1px solid #CCCCCC; 
			padding:20px;
		}
		.menu-focusUser{
			left:67px; 
			max-height: 300px; 
			overflow-y: scroll;
		}

	</style>
</rapid:override> 

<rapid:override name="content">
	
	<div class="row" style="height:280px; overflow: hidden;">
		<!-- 书签信息1 -->
		<div class="col-lg-9">
			<input type="hidden" class="bookmark-ID" value="${shownBookMark.ID}"/>
			<div class="col-md-4">
				<img class="img-rounded img-thumbnail" style="width:280px; height:280px"  src="img/bookmark/${shownBookMark.img.name}" />
			</div>
			<div class="col-md-8">
				<div class="row bookmark-name">
					<h1>${shownBookMark.name}</h1>
				</div>
				<div class="row bookmark-summary">
					<p>
						${shownBookMark.summary}
					</p>
				</div>
			</div>		
		</div>
		<!-- 操作按钮 -->
		<div class="col-lg-3" style="padding-right:30px">
			<div class="btn-jump">马上进入</div>
			<div class="btn-mark">收藏</div>
			<div class="btn-share">分享书签</div>
		</div>
	</div>

	<div class="row">
		<!-- 书签评论 -->
		<div class="col-lg-9">
			<div class="commentsList">
				<!-- 列表头 -->
				<div class="commentsList-heading">
					<div class="commentsList-title">
						评论列表
					</div>
					<div class="btn-addComment">
						添加评论
					</div>
				</div>

				<!-- 列表区域 -->
				<div class="commentsList-list">
				</div>

				<!-- 分页组件 -->
				<div class="row comment-page">
					<input type="hidden" class="comment-totalPage"  value="1"/>
					<input type="hidden" class="comment-nowPage" value="1"/>

					<div class="btn-group">
						<button class="btn btn-default btn-firstPage">&lt;&lt;</button>
						<button class="btn btn-default btn-prevPage">&lt;</button>
					</div>
					<span>第</span>
					<span class="span-nowPage">1</span>
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
		<!-- 书签信息2 -->
		<div class="col-lg-3">
			<div class="bookmark-info">
				<div class="bookmark-labels">
					<div class="bookmark-labels-title">标签：</div>
					<c:forEach items="${shownBookMark.labels}" var="label">  
					    <div class="bookmark-label">${label.name}</div>
					</c:forEach>
				</div>
				<div class="bookmark-link">
					<span>书签链接：<a href="${shownBookMark.link}" style="word-wrap:break-word;" target="_blank">${shownBookMark.link}</a></span>
				</div>
				<div class="bookmark-creator">
					<span>创建人：<a href="User_viewUser?ID=${shownBookMark.user.ID}" target="_blank">${shownBookMark.user.username}</a></span>
				</div>
				<div class="bookmark-date">
					<span>创建时间：<span>${shownBookMark.date}</span></span>
				</div>
				<div class="bookmark-collectNumber">
					<span>收藏数：${shownBookMark.collectNumber}</span>
				</div>
				<div class="bookmark-commentNumber">
					<span>评论数：</span>
				</div>
			</div>
		</div>
	</div>
</rapid:override> 

<rapid:override name="popup">
	<div class="modal fade modal-addComment" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">添加评论</h4>
				</div>
				<div class="modal-body">
					<textarea class="form-control input-addComment" rows="6" style="resize: none;" placeholder="输入评论内容..."></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-photoUpload" onclick="addComment()">提交</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade modal-shareBookMark" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">分享书签</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">分享给</span>
						<input type="text" readonly="readonly" data-toggle="dropdown" class="form-control input-shareTo-username" placeholder="选择分享人..." />
						<input type="hidden" class="input-shareTo-ID"/>
						<ul class="dropdown-menu menu-focusUser">
							
						</ul>
					</div>

					<div style="height:20px; width:100%"></div>

					<div class="input-group">
						<span class="input-group-addon">留言</span>
						

						<textarea class="form-control input-shareMessage" rows="6" style="resize: none;" placeholder="输入留言内容..."></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-photoUpload" onclick="shareBookMark()">提交</button>
				</div>
			</div>
		</div>
	</div>
</rapid:override> 

<rapid:override name="script">
	<script>
		$(document).ready(function (){
			// 初始化评论列表
			queryCommentsListPage(1);

			// 更新收藏状态
			if($('.user-ID').length != 0 && checkBookMarkMarked($('.user-ID').val(), $('.bookmark-ID').val())){
				$('.btn-mark').text('已收藏').addClass("btn-marked");
			}
		});

		// 分页按钮
		$('.btn-firstPage').click(function (){
			if($('.comment-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var pageNum = 1;
			queryCommentsListPage(pageNum);
		});
		$('.btn-prevPage').click(function (){
			if($('.comment-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var pageNum = -1 + parseInt($('.comment-nowPage').val());
			queryCommentsListPage(pageNum);
		});
		$('.btn-nextPage').click(function (){
			if($('.comment-nowPage').val() == $('.comment-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var pageNum = 1 + parseInt($('.comment-nowPage').val());
			queryCommentsListPage(pageNum);
		});
		$('.btn-lastPage').click(function (){
			if($('.comment-nowPage').val() == $('.comment-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var pageNum = $('.comment-totalPage').val();
			queryCommentsListPage(pageNum);
		});

		// 分页查询评论列表
		function queryCommentsListPage(pageNum){

			var pageSize = 4;
			var url = "Comment_getCommentsListPage";
			var bookmarkID = $('.bookmark-ID').val();

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					pageNum:pageNum,
					pageSize:pageSize,
					bookmarkID:bookmarkID
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){
						$('.comment-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.comment-nowPage').val(pageNum);
						$('.span-nowPage').text(pageNum);
						$('.span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.bookmark-commentNumber').children().text('评论数：' + data['total']);

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							html += createComment(rows[i]['ID'], rows[i]['user']['img']['name'], rows[i]['user']['username'], rows[i]['date'], rows[i]['content']);
						}
						// console.log(rows);
						$('.commentsList-list').html(html);
					}else{
						$('.commentsList-list').html(createNullInfo());

						$('.comment-totalPage').val(1);
						$('.comment-nowPage').val(1);
						$('.span-nowPage').text(1);
						$('.span-totalPage').text(1);
						$('.bookmark-commentNumber').children().text('评论数：0');
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 打开书签链接
		$('.btn-jump').click(function(){
			window.open($('.bookmark-link').children().text().substr(
					5, $('.bookmark-link').children().text().length - 5
				));
		});

		// 收藏按钮覆盖响应
		$('.btn-mark').on({
			mouseover:function(){
				if($(this).text() == "已收藏"){
					$(this).text('取消收藏');
				}
			},
			mouseout:function(){
				if($(this).text() == "取消收藏"){
					$(this).text('已收藏');
				}
			}
		});

		// 书签收藏
		$('.btn-mark').click(function(){
			//用户已登录
			if($('.user-ID').length !=  0){
				if($(this).text() == "收藏"){
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							bookmarkID:$('.bookmark-ID').val(),
							userID:$('.user-ID').val()
						},
						url:"Collect_addCollect",
						async:false,
						success:function(data, status){
							if(data['result'] == true){
								alert('收藏成功');

								$('.btn-mark').text("已收藏");
								$('.btn-mark').addClass("btn-marked");

								collectNumber = $('.bookmark-collectNumber').children().text();
								collectNumber = collectNumber.substr(4, collectNumber.length - 4);
								$('.bookmark-collectNumber').children().text("收藏数：" + (parseInt(collectNumber) + 1));
							}else{
								alert('收藏失败');
							}
						},
						error:function (xhr, textStatus, errorThrown){
							alert(textStatus + ":" + errorThrown);
						}
					});
				}else{
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							bookmarkID:$('.bookmark-ID').val(),
							userID:$('.user-ID').val()
						},
						url:"Collect_deleteCollect",
						success:function(data, status){
							if(data['result'] == true){
								alert('取消收藏成功');

								$('.btn-mark').text("收藏");
								$('.btn-mark').removeClass("btn-marked");

								collectNumber = $('.bookmark-collectNumber').children().text();
								collectNumber = collectNumber.substr(4, collectNumber.length - 4);
								$('.bookmark-collectNumber').children().text("收藏数：" +  (parseInt(collectNumber) - 1));

							}else{
								alert('取消收藏失败');
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

		// 检查书签是否已经收藏
		function checkBookMarkMarked(userID, bookmarkID){
			var result = false;

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					userID:userID,
					bookmarkID:bookmarkID
				},
				url:"Collect_checkBookMarkMarked",
				async:false,
				success:function(data, status){
					result = data['result'];
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
					result = false;
				}
			});

			return result;
		}

		// 点击添加评论按钮 显示添加评论框
		$('.btn-addComment').click(function(){
			if($('.user-ID').length == 0){
				alert('请先登录！');
				return ;
			}

			$('.input-addComment').val("");
			$('.modal-addComment').modal('show');

			$("body").css('padding-right','0px');
		});

		// 添加评论
		function addComment(){
			content = $('.input-addComment').val();
			bookmarkID = $('.bookmark-ID').val();
			userID = $('.user-ID').val();
			date = getDate_Ymd();

			if(content.length > 400 ){
				alert('评论内容不能超过400个字符');
				return ;
			}

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					content: content,
					date: date,
					bookmarkID: bookmarkID,
					userID: userID
				},
				url:"Comment_addComment",
				async:false,
				success:function(data, status){
					if(data != null){
						if(data['result'] == true){
							alert('评论成功！');
							$('.modal-addComment').modal('hide');
							queryCommentsListPage($('.comment-nowPage').val());
						}else{
							alert('评论失败！');
						}
					}
				},
				error:function(xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}
	</script>

	<!-- 书签分享 -->
	<script>
		// 点击分享按钮
		$('.btn-share').click(function(){

			if($('.user-ID').length == 0){
				alert('请先登录！');
				return ;
			}
			$('.modal-shareBookMark input').val("");

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					fromUserID:$('.user-ID').val()
				},
				async:false,
				url:"User_getUserFocusList",
				success:function(data, status){
					if(data != null){
						$('.menu-focusUser').html(createFocusMenu(data['data']));
					}else{
						alert('获取关注列表失败');
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}

			});

			$('.input-shareMessage').val("");
			$('.modal-shareBookMark').modal('show');
			$("body").css('padding-right','0px');
		});

		// 创建关注人下拉列表
		function createFocusMenu(data){
			var html = "";
			for(var i in data){
				html += "<li><a>\
							<img src=\"img/user/" + data[i]['img']['name'] + "\" style=\"width:20px; height:20px\"/>\
							<span>" + data[i]['username'] + "</span>\
							<input type=\"hidden\" value=\"" + data[i]['ID'] + "\"/>\
						</a></li>";
			}

			return html;
		}

		// 下拉列表项点击 改变分享人输入框值
		$('.menu-focusUser').on('click', 'a', function(){
			$('.input-shareTo-ID').val($(this).children('input').val());
			$('.input-shareTo-username').val($(this).children('span').text());
		});

		// 书签分享
		function shareBookMark(){
			if($('.input-shareTo-ID').val() == ''){
				alert('请选择分享人');
				return ;
			}

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					toUserID:$('.input-shareTo-ID').val(),
					fromUserID:$('.user-ID').val(),
					bookmarkID:$('.bookmark-ID').val(),
					date:getDate_Ymd(),
					content:$('.input-shareMessage').val()
				},
				async:false,
				url:"Information_shareBookMark",
				success:function(data, status){
					if(data != null && data['result'] == true){
						alert('分享成功');
						$('.modal-shareBookMark').modal('hide');
					}else{
						alert('分享失败');
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}
	</script>
</rapid:override> 

<%@ include file="base.jsp" %> 