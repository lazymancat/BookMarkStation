<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">  
    <title>个人书签管理网站</title>
</rapid:override>  

<rapid:override name="style">
	<style>
		html,body{
			overflow-x: hidden;
		}
		.panel-footer{
			padding:5px;
		}

		.panel{
			margin:0px;
		}
		
		.row{
			margin-left:0px;
			margin-right: 0px;
		}
		.div-bookmark{
			padding:0px;
		}
		.div-bookmark .panel-body div{
			width:100%; 
		}
		.btn-up .badge{
			background-color: #4444FF;
		}
		.btn-down .badge{
			background-color: red;
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
			height:180px; 
		}
		.bookmark-img:hover{
			opacity: 0.5;
			cursor: pointer;
		}

		.bookmark-page{
			text-align: center;
			margin-bottom:10px;
		}

		.btn-order{
			margin:0px auto 20px 20px;
		}
	</style>
</rapid:override> 

<rapid:override name="content">
	<div class="row">
		<!-- 书签列表 -->
		<div class="col-lg-9 div-bookmark">
			<!-- 排序按钮组 -->
			<div class="row">
				<div class="btn-group btn-order">
					<button class="btn btn-default btn-order-date">按时间排序</button>
					<button class="btn btn-default btn-order-colNum">按收藏数排序</button>
					<button class="btn btn-default btn-order-comNum">按评论数排序</button>
				</div>
			</div>

			<!-- 列表区域 -->
			<div class="row bookmark-list" style="min-height: 550px">
			</div>

			<!-- 分页组件 -->
			<div class="row bookmark-page">
				<input type="hidden" class="bookmark-lastQuery" value="${word}"/>
				<input type="hidden" class="bookmark-lastQueryType" value="0"/>
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

		<!-- 书签推荐面板 开始 -->
		<div class="col-lg-3">
			<div class="panel panel-default">
				<div class="panel-heading">最新添加</div>
				<div class="list-group bookmark-recent">
				</div>
			</div>
			<br>
			<div class="panel panel-default">
				<div class="panel-heading">热门书签</div>
				<div class="list-group bookmark-popular">
				</div>
			</div>
		</div>
		<!-- 书签推荐面板 结束 -->
	</div>
</rapid:override> 

<rapid:override name="popup">
</rapid:override> 

<rapid:override name="script">
	<script>
		$(document).ready(function (){
			// 初始化列表数据
			queryBookMarkListPage($('.bookmark-lastQuery').val(), 1, 0);
			getRecentBookMark();
			getPopularBookMark();
		});

		// 列表排序
		$('.btn-order-date').click(function(){
			$('.btn-order button').removeClass('btn-primary');
			$(this).addClass('btn-primary');
			queryBookMarkListPage($('.bookmark-lastQuery').val(), 1, 1);
		});
		$('.btn-order-colNum').click(function(){
			$('.btn-order button').removeClass('btn-primary');
			$(this).addClass('btn-primary');
			queryBookMarkListPage($('.bookmark-lastQuery').val(), 1, 2);
		});
		$('.btn-order-comNum').click(function(){
			$('.btn-order button').removeClass('btn-primary');
			$(this).addClass('btn-primary');
			queryBookMarkListPage($('.bookmark-lastQuery').val(), 1, 3);
		});


		// 翻页
		$('.btn-firstPage').click(function (){
			if($('.bookmark-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = 1;
			var type = $('.bookmark-lastQueryType').val();
			queryBookMarkListPage(word, pageNum, type);
		});
		$('.btn-prevPage').click(function (){
			if($('.bookmark-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var word = $('.bookmark-lastQuery').val();
			var pageNum = -1 + parseInt($('.bookmark-nowPage').val());
			var type = $('.bookmark-lastQueryType').val();
			queryBookMarkListPage(word, pageNum, type);
		});
		$('.btn-nextPage').click(function (){
			if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = 1 + parseInt($('.bookmark-nowPage').val());
			var type = $('.bookmark-lastQueryType').val();
			queryBookMarkListPage(word, pageNum, type);
		});
		$('.btn-lastPage').click(function (){
			if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery').val();
			var pageNum = $('.bookmark-totalPage').val();
			var type = $('.bookmark-lastQueryType').val();
			queryBookMarkListPage(word, pageNum, type);
		});

		// 分页查询
		function queryBookMarkListPage(word, pageNum, type){

			var pageSize = 8;
			var url = "BookMark_getBookMarkListPage";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
					type:type
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.bookmark-lastQuery').val(word);
						$('.bookmark-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.bookmark-lastQueryType').val(type);
						$('.bookmark-nowPage').val(pageNum);
						$('.input-jumpPage').text(pageNum);
						$('.span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createBookMark(rows[i]['ID'], rows[i]['name'], rows[i]['summary'], rows[i]['link'], rows[i]['img']['name']);
							 // console.log(rows);
						}
						 $('.bookmark-list').html(html);
					}else{
						$('.bookmark-lastQuery').val(word);
						$('.bookmark-totalPage').val(1);
						$('.bookmark-lastQueryType').val(type);
						$('.bookmark-nowPage').val(1);
						$('.input-jumpPage').text(1);
						$('.span-totalPage').text(1);

						$('.bookmark-list').html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 书签跳转
		function jumpBookMark(address){
			window.open(address);
		}

		// 获取最新书签
		function getRecentBookMark(){
			$.ajax({
				type:'get',
				url:"BookMark_getRecentBookMark",
				success:function(data, status){
					if(data != null){
						$('.bookmark-recent').html(getListGroupItem(data['data']));
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 获取热门书签
		function getPopularBookMark(){
			$.ajax({
				type:'get',
				url:"BookMark_getPopularBookMark",
				success:function(data, status){
					if(data != null){
						$('.bookmark-popular').html(getListGroupItem(data['data']));
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 获取书签排名列表组元素
		function getListGroupItem(data){
			var str = "";

			for(i in data){
				str += "<a href=\"BookMark_show?ID=" + data[i]['ID'] + "\" target=\"_blank\" class=\"list-group-item\">" + data[i]['name'] + "</a>";
			}
			return str;
		}
	</script>
</rapid:override> 

<%@ include file="base.jsp" %> 