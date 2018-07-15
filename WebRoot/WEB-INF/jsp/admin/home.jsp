<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>书签小站后台管理中心</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-datepicker3.css">
		<!-- 基础 -->
		<style>
			.row{
				margin:0px;
			}

			.manage-nav{
				width:100%; 
				height:70px; 
				border-bottom:1px solid #CCCCCC; 
				background-color: #FFFFF0;
			}
			.manage-nav-title{
				float: left; 
				height:70px; 
				line-height: 70px; 
				padding:0px 40px 0px 20px; 
				font-size:28px; 
				font-weight: 500;
				background-color: #1C1C1C;
				color:#f2f2f2;
			}
			.manage-nav-title:hover{
				cursor: default;
			}

			.manage-nav-item{
				float: left; 
				height:70px; 
				line-height: 70px; 
				padding:0px 30px; 
				font-size:16px; 
				font-weight: 500;
			}
			.manage-nav-item:hover{
				cursor:pointer;
			}
			.manage-nav-item-active{
				background-color: #4F4F4F;
				color:#FFFAFA;
			}

			.manage-content{
				width:100%;
				padding:20px;
			}

			.manage-content-item{
				width:100%;
				display:none;
			}
			.manage-content-item-active{
				display: inline;
			}

			.nullInfo{
				height:300px; 
				line-height:300px;
				width:100%; 
				color:#CCCCCC; 
				font-size:36px; 
				font-weight:600; 
				text-align:center; 
				margin:20px; 
				border:2px dashed #CCCCCC;
			}
		</style>

		<!-- 用户管理 -->
		<style>
			.user-page{
				text-align: center;
				margin-bottom:10px;
			}

			.user-item{
				white-space: nowrap;
			    overflow: hidden;   
			    text-overflow:ellipsis; 
			}
			.user-name{
				max-width:160px;
			}
			.user-email{
				max-width:160px;
			}

			.user-oprt{
				max-width: 190px;
				width:190px;
				min-width: 190px;
			}
			.user-description{
				max-width: 200px;
			}
			.div-user>table{
				text-align: center; 
			}
			.div-user>table>thead{
				background-color: #ffeeb8;
			}
			.div-user>table>tbody{
				background-color: #e9f7e9
			}
			.div-user>table>tbody>.tr-base:hover{
				background-color: #c4f8c4;
				cursor:pointer;
			}
		</style>

		<!-- 书签管理 -->
		<style>
			.bookmark-page{
				text-align: center;
				margin-bottom:10px;
			}

			.bookmark-item{
				white-space: nowrap;
			    overflow: hidden;   
			    text-overflow:ellipsis; 
			}
			.bookmark-name{
				max-width: 200px;
			}
			.bookmark-link{
				max-width: 200px;
			}
			.bookmark-creator{
				max-width:160px;
			}
			.bookmark-summary{
				max-width:200px;
			}

			.bookmark-oprt{
				max-width: 130px;
				width:130px;
				min-width: 130px;
			}
			.div-bookmark>table{
				text-align: center; 
			}
			.div-bookmark>table>thead{
				background-color: #ffeeb8;
			}
			.div-bookmark>table>tbody{
				background-color: #e9f7e9
			}
			.div-bookmark>table>tbody>.tr-base:hover{
				background-color: #c4f8c4;
				cursor:pointer;
			}

			.input-bmManage-label{
				margin-right:10px; 
				margin-bottom:5px;
				height:30px; 
				line-height:30px; 
				float:left; 
				border:1px solid #CCCCCC; 
				border-radius:5px; 
				padding:0px 5px;
			}
			.btn-removeLabel:hover{
				cursor:pointer;
				opacity:0.5;
			}
		</style>

		<style>
			.log-page{
				text-align: center;
				margin-bottom:10px;
			}
			.log-item{
				white-space: nowrap;
			    overflow: hidden;   
			    text-overflow:ellipsis; 
			}
			.div-log>table{
				text-align: center; 
			}
			.div-log>table>thead{
				background-color: #ffeeb8;
			}
			.div-log>table>tbody{
				background-color: #e9f7e9
			}
			.div-log>table>tbody>.tr-base:hover{
				background-color: #c4f8c4;
				cursor:pointer;
			}

			.form-control[disabled], .form-control[readonly]{
				background-color:#FFFFFF;
			}
			.form-control[disabled]:hover, .form-control[readonly]:hover{
				cursor:default;
			}
		</style>
	</head>

	<body>
		<div class="manage-nav">
			<div class="manage-nav-title" style="">书签小站后台管理中心</div>
			<div class="manage-nav-item manage-nav-item-active" onclick="showContent('#user')">用户管理</div>
			<div class="manage-nav-item" onclick="showContent('#bookmark')">书签管理</div>
			<div class="manage-nav-item" onclick="showContent('#log')">系统日志</div>
			<div class="manage-nav-item" onclick="showContent('#statistics')">统计报表</div>
			<div class="manage-nav-item" onclick="showSendInformationModal()">发布通知</div>
		</div>

		<div class="manage-content">
			<div class="manage-content-item manage-content-item-active" id="user">
				<div class="row div-user">
					<div class="row">
			    		<div class="input-group" style="margin-left:15px; margin-bottom:20px; width:400px">
			    			<input type="text" class="form-control user-input-word" placeholder="请输入关键字.."/>
			    			<span class="input-group-btn">
			    				<button class="btn btn-default user-btn-search">搜索</button>
			    			</span>
			    		</div>
			    	</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>ID</td>
								<td>名称</td>
								<td>绑定邮箱</td>
								<td>生日</td>
								<td>性别</td>
								<td>个人说明</td>
								<td>注册日期</td>
								<td>状态</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div class="row user-page">
						<input type="hidden" class="user-lastQuery" value=""/>
						<input type="hidden" class="user-totalPage" value="1"/>
						<input type="hidden" class="user-nowPage" value="1"/>

						<div class="btn-group">
							<button class="btn btn-default user-btn-firstPage">&lt;&lt;</button>
							<button class="btn btn-default user-btn-prevPage">&lt;</button>
						</div>
						<span>第</span>
						<span class="user-input-jumpPage">1</span>
						<span>/</span>
						<span class="user-span-totalPage">1</span>
						<span>页</span>
						<div class="btn-group">
							<button class="btn btn-default user-btn-nextPage">&gt;</button>
							<button class="btn btn-default user-btn-lastPage">&gt;&gt;</button>
						</div>
					</div>
				</div>
			</div>

			<div class="manage-content-item" id="bookmark">
				<div class="row div-bookmark">
					<div class="row">
			    		<div class="input-group" style="margin-left:15px; margin-bottom:20px; width:400px">
			    			<input type="text" class="form-control bookmark-input-word" placeholder="请输入关键字.."/>
			    			<span class="input-group-btn">
			    				<button class="btn btn-default bookmark-btn-search">搜索</button>
			    			</span>
			    		</div>
			    	</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>ID</td>
								<td>名称</td>
								<td>链接</td>
								<td>创建人</td>
								<td>简介</td>
								<td>创建日期</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<tr class="tr-base">
								<td class="bookmark-item bookmark-ID">11111</td>
								<td class="bookmark-item bookmark-name">白白白白白白白白白白白白白白v白白白</td>
								<td class="bookmark-item bookmark-link">链接链接链接链接链接链接链接链接链接链接</td>
								<td class="bookmark-item bookmark-creator">创建人创建人创建人创</td>
								<td class="bookmark-item bookmark-summary">简介简介简介简介简介简介简介简介简介简介简介简介</td>
								<td class="bookmark-item bookmark-date">创建日期</td>
								<td class="bookmark-oprt">
									<div class="btn-group">
										<button class="btn btn-sm btn-primary bookmark-btn-modify">修改</button>
										<button class="btn btn-sm btn-danger bookmark-btn-remove">删除</button>
									</div>
								</td>
							</tr>
							<tr style="display: none">
								<td colspan="9" style="margin:0px; padding:0px">
									<table class="table table-bordered" style="margin:0px">
										<tr>
											<td>评论</td>
											<td>收藏</td>
											<td>分享</td>
										</tr>
										<tr>
											<td>12</td>
											<td>23</td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="row bookmark-page">
						<input type="hidden" class="bookmark-lastQuery" value=""/>
						<input type="hidden" class="bookmark-totalPage" value="1"/>
						<input type="hidden" class="bookmark-nowPage" value="1"/>

						<div class="btn-group">
							<button class="btn btn-default bookmark-btn-firstPage">&lt;&lt;</button>
							<button class="btn btn-default bookmark-btn-prevPage">&lt;</button>
						</div>
						<span>第</span>
						<span class="bookmark-input-jumpPage">1</span>
						<span>/</span>
						<span class="bookmark-span-totalPage">1</span>
						<span>页</span>
						<div class="btn-group">
							<button class="btn btn-default bookmark-btn-nextPage">&gt;</button>
							<button class="btn btn-default bookmark-btn-lastPage">&gt;&gt;</button>
						</div>
					</div>
				</div>
			</div>

			<div class="manage-content-item" id="log">
				<div class="row div-log">
					<div class="row">
			    		<div class="input-group" style="margin-left:15px; margin-bottom:20px; width:400px">
			    			<input type="text" class="form-control log-input-word" placeholder="请输入关键字.."/>
			    			<span class="input-group-btn">
			    				<button class="btn btn-default log-btn-search">搜索</button>
			    			</span>
			    		</div>
			    	</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>ID</td>
								<td>类型</td>
								<td>执行人ID</td>
								<td>目标书签ID</td>
								<td>日期</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

					<div class="row log-page">
						<input type="hidden" class="log-lastQuery" value=""/>
						<input type="hidden" class="log-totalPage" value="1"/>
						<input type="hidden" class="log-nowPage" value="1"/>

						<div class="btn-group">
							<button class="btn btn-default log-btn-firstPage">&lt;&lt;</button>
							<button class="btn btn-default log-btn-prevPage">&lt;</button>
						</div>
						<span>第</span>
						<span class="log-input-jumpPage">1</span>
						<span>/</span>
						<span class="log-span-totalPage">1</span>
						<span>页</span>
						<div class="btn-group">
							<button class="btn btn-default log-btn-nextPage">&gt;</button>
							<button class="btn btn-default log-btn-lastPage">&gt;&gt;</button>
						</div>
					</div>
				</div>
			</div>

			<div class="manage-content-item" id="statistics">
				
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#userActivityWeek" data-toggle="tab">用户活动周报</a></li>
					<li><a href="#bookmarkActivityWeek" data-toggle="tab">书签活动周报</a></li>
					<!-- <li><a href="#messages" data-toggle="tab">3</a></li>
					<li><a href="#settings" data-toggle="tab">4</a></li> -->
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="userActivityWeek">
						<div class="row">
				    		<div class="input-group" style="margin:20px; width:400px">
				    			<span class="input-group-addon">
				    				<span class="glyphicon glyphicon-calendar"></span>
				    			</span>
				    			<input class="form-control input-datepicker input-userAtyWeek" readonly="readonly" type="text"/>
				    		</div>
				    	</div>
						
						<div id="chart-userActivityWeek" style="width: 1000px;height:500px;margin:20px"></div>
					</div>
					<div class="tab-pane" id="bookmarkActivityWeek">
						<div class="row">
				    		<div class="input-group" style="margin:20px; width:400px">
				    			<span class="input-group-addon">
				    				<span class="glyphicon glyphicon-calendar"></span>
				    			</span>
				    			<input class="form-control input-datepicker input-bookmarkAtyWeek" readonly="readonly" type="text"/>
				    		</div>
				    	</div>
						<div id="chart-bookmarkActivityWeek" style="width: 1000px;height:500px;margin:20px"></div>
					</div>
					<div class="tab-pane" id="messages">...</div>
					<div class="tab-pane" id="settings">...</div>
				</div>
			</div>
		</div>

		
		<div class="modal fade modal-bmManage" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">书签修改</h4>
					</div>
					<div class="modal-body">
						<form name="form-bmManage"  target="_self" id="form-bmManage" method="post" enctype="multipart/form-data" >
							<input type="hidden" class="input-bookmark-ID"/>
							<span>书签图片：</span><input name="file" type="file" id="input-bmManage-img" onchange="uploadBMImg()" accept="image/*" />
							<img class="img-thumbnail img-bmManage-preview" style="margin:10px; width:120px; height:120px; display:none" src=""/><br>

							<span>标题:</span>
							<input type="text" class="form-control input-bmManage-title"/>
							<span>链接:</span>
							<input type="text" class="form-control input-bmManage-link"/>

							
							<div class="input-bmManage-labels" style="margin:10px 0px; width:100%; height:70px;">
								<div style="height: 30px; line-height: 30px; float: left; margin-right: 10px; margin-bottom: 5px;">标签:</div>
								
								<div class="btn btn-primary btn-sm btn-addLabel" >添加标签</div>
							</div>

							<span>简介:</span>
							<textarea class="form-control input-bmManage-summary" rows="4" style="resize: none;"></textarea>
						</form>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary btn-bmManage-submit" onclick="addBookMark()">提交</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade modal-sendInformation" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">发布通知</h4>
					</div>
					<div class="modal-body">
						<div class="input-group">
							<span class="input-group-addon">通知内容</span>
							<textarea class="form-control input-sendInformation-content" rows="6" style="resize: none;"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary btn-sendInformation-submit" onclick="sendInformation()">提交</button>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>
		<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="locales/bootstrap-datepicker.zh-CN.min.js"></script>
		<script type="text/javascript" src="js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="js/echarts.common.min.js"></script>

		<script>

			$(document).ready(function(){
				queryUserListPage_Admin('', 1);
			});

			//初始化日期选择器
			$('.input-datepicker').datepicker({
				autoclose: true, //自动关闭   
			    clearBtn: true,          //显示清除按钮  
			    forceParse: true,         //是否强制转换不符合格式的字符串  
			    format: 'yyyy-mm-dd',     //日期格式  
			    keyboardNavigation: true, //是否显示箭头导航  
			    language: 'zh-CN',           //语言  
			    orientation: "auto",      //方向
			    todayBtn: false,          //今天按钮  
			    todayHighlight: true,    //今天高亮  
			});

			//生成无数据页面html代码
			function createNullInfo(){
				var html = "<tr><td colspan=\"8\" class='nullInfo'>没有数据</td></tr>";
				return html;
			}

			//导航菜单选中效果
			$('.manage-nav-item').click(function(){
				$('.manage-nav-item').removeClass('manage-nav-item-active');
				$(this).addClass('manage-nav-item-active');
			});

			function showContent(item){
				$('.manage-content-item').removeClass('manage-content-item-active');
				
				$(item).addClass('manage-content-item-active');

				if(item == '#user'){
					queryUserListPage_Admin('', 1);
				}else if(item == '#bookmark'){
					queryBookMarkListPage_Admin('', 1);
				}else if(item == '#log'){
					queryLogListPage_Admin('', 1);
				}else if(item == '#statistics'){
					showUserAtyWeek(getDate_Ymd());
					$(".input-userAtyWeek").val(getDate_Ymd());
				}
			}

			function showSendInformationModal(){
				$('.modal-sendInformation textarea').val("");
				$('.modal-sendInformation').modal("show");
			}
			
			function sendInformation(){
				content = $('.modal-sendInformation textarea').val();

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						content:content,
						date:getDate_Ymd()
					},
					url:"Admin_sendInformation",
					async:false,
					success:function(data, status){
						if(data != null && data['result'] == true){
							alert('发布成功！');
							$('.modal-sendInformation').modal("hide");
						}else{
							alert('发布失败！');
						}
					},
					error:function(xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}
		</script>

		<!-- 用户管理 -->
		<script>
			$('.div-user').on('click','.tr-base', function(){
				$(this).next().toggle();
			});

			//用户列表 分页按钮
			$('.user-btn-firstPage').click(function (){
				if($('.user-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}
				var word = $('.user-lastQuery').val();
				var pageNum = 1;
				queryUserListPage_Admin(word, pageNum);
			});
			$('.user-btn-prevPage').click(function (){
				if($('.user-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}

				var word = $('.user-lastQuery').val();
				var pageNum = -1 + parseInt($('.user-nowPage').val());
				queryUserListPage_Admin(word, pageNum);
			});
			$('.user-btn-nextPage').click(function (){
				if($('.user-nowPage').val() == $('.user-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.user-lastQuery').val();
				var pageNum = 1 + parseInt($('.user-nowPage').val());
				queryUserListPage_Admin(word, pageNum);
			});
			$('.user-btn-lastPage').click(function (){
				if($('.user-nowPage').val() == $('.user-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.user-lastQuery').val();
				var pageNum = $('.user-totalPage').val();
				queryUserListPage_Admin(word, pageNum);
			});

			//查询用户列表
			function queryUserListPage_Admin(word, pageNum){

				var pageSize = 20;
				var url = "Admin_getUserListPage";

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						word:word,
						pageNum:pageNum,
						pageSize:pageSize
					},
					async:false,
					url:url,
					success:function(data, status){
						if(data != null && data['total'] != 0){

							$('.user-lastQuery').val(word);
							$('.user-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
							$('.user-nowPage').val(pageNum);
							$('.user-input-jumpPage').text(pageNum);
							$('.user-span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

							var rows = data['data'];
							var html = "";
							for(var i = 0; i < rows.length; i++){
								 html += createUser(rows[i]);
							}
							$('.div-user tbody').html(html);
						}else{
							$('.user-lastQuery').val(word);
							$('.user-totalPage').val(1);
							$('.user-nowPage').val(1);
							$('.user-input-jumpPage').text(1);
							$('.user-span-totalPage').text(1);
							$('.div-user tbody').html(createNullInfo());
						}
					},
					error:function (xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}

			// 创建用户
			function createUser(user){
				var html = "<tr class=\"tr-base\">\
								<td class=\"user-item user-ID\">" + user['ID'] + "</td>\
								<td class=\"user-item user-name\">" + user['username'] + "</td>\
								<td class=\"user-item user-email\">" + user['email'] + "</td>\
								<td class=\"user-item user-birthday\">" + user['birthday'] + "</td>\
								<td class=\"user-item user-sex\">" + user['sex'] + "</td>\
								<td class=\"user-item user-description\">" + user['description'] + "</td>\
								<td class=\"user-item user-date\">" + user['rgstDate'] + "</td>\
								<td class=\"user-item user-status\">" + (user['isBan'] == 1?'禁用':'正常使用') + "</td>\
								<td class=\"user-oprt\">\
									<div class=\"btn-group\">\
										<button class=\"btn btn-sm btn-success user-btn-resetPWD\">重置密码</button>\
										<button class=\"btn btn-sm btn-danger user-btn-ban\">" + (user['isBan'] == 0?'禁用':'解除禁用') + "</button>\
									</div>\
								</td>\
							</tr>\
							<tr style=\"display: none\">\
								<td colspan=\"9\" style=\"margin:0px; padding:0px\">\
									<table class=\"table table-bordered\" style=\"margin:0px\">\
										<tr>\
											<td>评论</td>\
											<td>创建书签</td>\
											<td>收藏书签</td>\
											<td>关注</td>\
											<td>被关注</td>\
										</tr>\
										<tr>\
											<td>" + user['commentNum'] +  "</td>\
											<td>" + user['createNum'] +  "</td>\
											<td>" + user['collectNum'] +  "</td>\
											<td>" + user['focusNum'] +  "</td>\
											<td>" + user['beFocusNum'] +  "</td>\
										</tr>\
									</table>\
								</td>\
							</tr>";
				return html;
			}

			// 用户搜索
			$('.user-btn-search').click(function(){
				word = $('.user-input-word').val();
				queryUserListPage_Admin(word, 1);
			});

			// 禁用/解除禁用用户
			$('.div-user').on('click', '.user-btn-ban', function(){
				$theButton = $(this);
				if($(this).text() == '禁用'){
					$.ajax({
						type:'post',
						dataType:"json",
						data:{
							userID:$(this).parents("tr").children(".user-ID").text()
						},
						async:false,
						url:'Admin_banUser',
						success:function(data, status){
							if(data != null && data['result'] == true){
								alert('禁用成功');
								$theButton.text('解除禁用');
								$theButton.parents("tr").children(".user-status").text('禁用');
							}else{
								alert('禁用失败');
							}
						},
						error:function (xhr, textStatus, errorThrown){
							alert(textStatus + ":" + errorThrown);
						}
					});
				}else{
					$.ajax({
						type:'post',
						dataType:"json",
						data:{
							userID:$(this).parents("tr").children(".user-ID").text()
						},
						async:false,
						url:'Admin_unBanUser',
						success:function(data, status){
							if(data != null && data['result'] == true){
								alert('解除禁用成功');
								$theButton.text('禁用');
								$theButton.parents("tr").children(".user-status").text('正常使用');
							}else{
								alert('解除禁用失败');
							}
						},
						error:function (xhr, textStatus, errorThrown){
							alert(textStatus + ":" + errorThrown);
						}
					});
				}
			});

			// 重置密码
			$('.div-user').on('click', '.user-btn-resetPWD', function(){
				userID = $(this).parents("tr").children(".user-ID").text();
				email = $(this).parents("tr").children(".user-email").text();

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						userID:userID,
						email:email
					},
					async:false,
					url:'Admin_resetPWD',
					success:function(data, status){
						if(data != null && data['result'] == true){
							alert('重置成功，已将重置密码发至该用户邮箱');	
						}else{
							alert('重置失败');
						}
					},
					error:function (xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			});
		</script>

		<!-- 书签管理 -->
		<script>
			$('.div-bookmark').on('click','.tr-base', function(){
				$(this).next().toggle();
			});

			//书签列表 分页按钮
			$('.bookmark-btn-firstPage').click(function (){
				if($('.bookmark-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}
				var word = $('.bookmark-lastQuery').val();
				var pageNum = 1;
				queryBookMarkListPage_Admin(word, pageNum);
			});
			$('.bookmark-btn-prevPage').click(function (){
				if($('.bookmark-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}

				var word = $('.bookmark-lastQuery').val();
				var pageNum = -1 + parseInt($('.bookmark-nowPage').val());
				queryBookMarkListPage_Admin(word, pageNum);
			});
			$('.bookmark-btn-nextPage').click(function (){
				if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.bookmark-lastQuery').val();
				var pageNum = 1 + parseInt($('.bookmark-nowPage').val());
				queryBookMarkListPage_Admin(word, pageNum);
			});
			$('.bookmark-btn-lastPage').click(function (){
				if($('.bookmark-nowPage').val() == $('.bookmark-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.bookmark-lastQuery').val();
				var pageNum = $('.bookmark-totalPage').val();
				queryBookMarkListPage_Admin(word, pageNum);
			});

			//查询书签列表
			function queryBookMarkListPage_Admin(word, pageNum){

				var pageSize = 20;
				var url = "Admin_getBookMarkListPage";

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						word:word,
						pageNum:pageNum,
						pageSize:pageSize
					},
					async:false,
					url:url,
					success:function(data, status){
						if(data != null && data['total'] != 0){

							$('.bookmark-lastQuery').val(word);
							$('.bookmark-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
							$('.bookmark-nowPage').val(pageNum);
							$('.bookmark-input-jumpPage').text(pageNum);
							$('.bookmark-span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

							var rows = data['data'];
							var html = "";
							for(var i = 0; i < rows.length; i++){
								 html += createBookMark(rows[i]);
							}
							$('.div-bookmark tbody').html(html);
						}else{
							$('.bookmark-lastQuery').val(word);
							$('.bookmark-totalPage').val(1);
							$('.bookmark-nowPage').val(1);
							$('.bookmark-input-jumpPage').text(1);
							$('.bookmark-span-totalPage').text(1);
							$('.div-bookmark tbody').html(createNullInfo());
						}
					},
					error:function (xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}
			
			// 创建书签
			function createBookMark(bm){
				var html = 	"<tr class=\"tr-base\">\
								<td class=\"bookmark-item bookmark-ID\">" + bm['ID'] + "</td>\
								<td class=\"bookmark-item bookmark-name\">" + bm['name'] + "</td>\
								<td class=\"bookmark-item bookmark-link\">" + bm['link'] + "</td>\
								<td class=\"bookmark-item bookmark-creator\">" + bm['user']['username'] + "</td>\
								<td class=\"bookmark-item bookmark-summary\">" + bm['summary'] + "</td>\
								<td class=\"bookmark-item bookmark-date\">" + bm['date'] + "</td>\
								<td class=\"bookmark-oprt\">\
									<div class=\"btn-group\">\
										<button class=\"btn btn-sm btn-primary bookmark-btn-modify\">修改</button>\
										<button class=\"btn btn-sm btn-danger bookmark-btn-remove\">删除</button>\
									</div>\
								</td>\
							</tr>\
							<tr style=\"display: none\">\
								<td colspan=\"9\" style=\"margin:0px; padding:0px\">\
									<table class=\"table table-bordered\" style=\"margin:0px\">\
										<tr>\
											<td>评论</td>\
											<td>收藏</td>\
											<td>分享</td>\
											<td>标签</td>\
										</tr>\
										<tr>\
											<td>" + bm['commentNumber'] + "</td>\
											<td>" + bm['collectNumber'] + "</td>\
											<td>" + bm['shareNumber'] + "</td>\
											<td class=\"bookmark-labels\">";
				
										for(var i in bm['labels']){
											html += "<span>" + bm['labels'][i]['name'] + "</span>&nbsp;";
										}

				html +=						"</td>\
										</tr>\
									</table>\
								</td>\
							</tr>";
					return html;
			}

			// 书签管理搜索
			$('.bookmark-btn-search').click(function(){
				word = $('.bookmark-input-word').val();
				queryBookMarkListPage_Admin(word, 1);
			});

			//上传书签图片
			function uploadBMImg(){
				if(!checkSuffixAllow($('#input-bmManage-img').val())){
					alert("图片文件只接受jpg,jpeg,png,gif,bmp等格式");
					$('#input-bmManage-img').val("");
					return ;
				}

			    formData = new FormData(document.getElementById("form-bmManage"));  
			    temp = document.getElementById("input-bmManage-img");
			    formData.append("file", temp.files[0]);

			    $.ajax({    
			        contentType:"multipart/form-data",  
			        url:"Admin_bookmarkImgUpload",    
			        type:"POST",  
			        data:formData,
			        dataType:"json",
			        async:false,  
			        processData: false,  // 告诉jQuery不要去处理发送的数据  
			        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头  
			        success: function(data){  
			            if(data != null){
			            	if(data['result'] == true){
			            		$('.img-bmManage-preview').attr("src", "img/bookmark/" + data['filename']).show();
			            	}
			            }
			        },
			        error:function(xhr, textStatus, errorThrown){
			        	alert(textStatus + ":" + errorThrown);
			        }	
			    });  
			}

			//检查选择文件的后缀是否合法
			function checkSuffixAllow(filename){
				var suffix = filename.substr(filename.lastIndexOf('.') + 1);
				if(suffix != 'png' && suffix != 'jpg' && suffix != 'jpeg' && suffix != 'bmp' && suffix != 'gif'){
					return false;
				}else{
					return true;
				}
			}

			//显示修改书签模态框
			$('.div-bookmark').on('click', '.bookmark-btn-modify', function(){
				$theBookMark = $(this).parents("tr");

				$('.modal-bmManage .modal-title').text("书签修改");
				$('.modal-bmManage .input-bmManage-title').val($theBookMark.children('.bookmark-name').text());
				$('.modal-bmManage .input-bmManage-link').val($theBookMark.children('.bookmark-link').text());
				$('.modal-bmManage .input-bmManage-summary').val($theBookMark.children('.bookmark-summary').text());
				$('.modal-bmManage .input-bookmark-ID').val($theBookMark.children('.bookmark-ID').text());

				$theBookMark.next().find('.bookmark-labels span').each(function(){
					var temp = 	"<div class=\"input-bmManage-label\">"
							+		"<span>" + $(this).text() + "</span>"
							+		"<div class=\"btn-removeLabel\" style='float:right; font-size:24px'>&nbsp;&times;</div>"
							+ 	"</div>";
					$('.modal-bmManage .input-bmManage-labels .btn-addLabel').before(temp);
				});
				// alert($('.modal-bmManage .input-bmManage-labels span').text());

				$('.btn-bmManage-submit').attr('onclick', "modifyBookMark()");
				$('.modal-bmManage').modal('show');
			});

			$('.modal-bmManage .input-bmManage-labels').on('click', '.btn-removeLabel', function(){
				$(this).parent().remove();
			});

			//修改书签
			function modifyBookMark(){
				title = $('.input-bmManage-title').val();
				link = $('.input-bmManage-link').val();
				summary = $('.input-bmManage-summary').val();
				bookmarkID = $('.input-bookmark-ID').val();
				labels = [];
				$('.modal-bmManage .input-bmManage-label').each(function(){
					labels.push($(this).children('span').text());
				});

				if(title == '' || link == '' || summary == ''){
					alert("书签信息不完整");
					return ;
				}else if(title.length > 50){
					alert("书签标题不能超过50个字符");
					return ;
				}else if(link.length > 300){
					alert("书签链接不能超过300个字符");
					return ;
				}else if(summary.length > 400){
					alert("书签简介不能超过400个字符");
					return ;
				}

			    formData = new FormData(document.getElementById("form-bmManage"));  
			    
			    if($('#input-bmManage-img').val() != ''){
			    	temp = document.getElementById("input-bmManage-img");
			    	formData.append("file", temp.files[0]);
			    	formData.append("filename", $('.img-bmManage-preview').attr("src").substr(13));
			    }else{
			    	formData.append("file", null);
			    	formData.append("filename", '');
			    }
			    
			    formData.append("title", title);
			    formData.append("link", link);
			    formData.append("summary", summary);
			    formData.append("bookmarkID",bookmarkID);
			    formData.append("labels", labels);

			    $.ajax({    
			        contentType:"multipart/form-data",  
			        url:"Admin_modifyBookMark",    
			        type:"POST",  
			        data:formData,
			        dataType:"json",
			        async:false,  
			        processData: false,  // 告诉jQuery不要去处理发送的数据  
			        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头  
			        success: function(data){  
			            if(data != null){
			            	if(data['result'] == true){
			            		alert("修改成功");

			            		$('.div-bookmark .tr-base').each(function(){
			            			if($(this).children(".bookmark-ID").text() == bookmarkID){
			            				$(this).children(".bookmark-name").text(title);
										$(this).children(".bookmark-link").text(link)
										$(this).children(".bookmark-summary").text(summary);

										var html = "";
										for(var i = 0; i < labels.length; i++){
											html += "<span>" + labels[i] + "</span>&nbsp;";
										}
										$(this).next().find('.bookmark-labels').html(html);
					            	}
			            		});

			            		clearBMManageModal();
			            	}else if(data['result'] == false){
			            		alert("修改失败");
			            	}
			            }
			        },
			        error:function(xhr, textStatus, errorThrown){
			        	alert(textStatus + ":" + errorThrown);
			        }	
			    });  
			}

			//显示标签输入框
			$('.modal-bmManage .btn-addLabel').click(function(){
				if($('.modal-bmManage .input-bmManage-label').length >= 4){
					alert('最多拥有4个标签');
					return ;
				}

				var temp = "<div class=\"input-group input-group-sm\" style=\"margin-bottom:5px\"><input class=\"form-control\" style=\"min-width:100px\"type=\"text\"/>"
							+"<div class=\"input-group-btn\"><div class=\"btn btn-default btn-save\">保存</div></div>"
							+"<div class=\"input-group-btn\"><div class=\"btn btn-default btn-cancel\">取消</div></div>"
							+"</div>";
				$(this).before(temp);
				$(this).hide();
			});

			//保存标签
			$('.modal-bmManage').on('click', '.btn-save', function(){
				var label = $(this).parent().prev().val();
				if(label.length > 6){
					alert('标签长度不能超过6位字符');
					return ;
				}else if(label.length == 0){
					alert('标签不能为空');
					return ;
				}

				$(this).parent().parent().before("<div class=\"input-bmManage-label\">"
									+		"<span>" + label + "</span>"
									+		"<div class=\"btn-removeLabel\" style='float:right; font-size:24px'>&nbsp;&times;</div>"
									+ 	"</div>");

				$(this).parent().parent().remove();
				$('.modal-bmManage .btn-addLabel').show();
			});

			//取消添加标签
			$('.modal-bmManage').on('click', '.btn-cancel', function(){
				$(this).parent().parent().remove();
				$('.modal-bmManage .btn-addLabel').show();
			});

			//重置书签模态框
			function clearBMManageModal(){
				$('.img-bmManage-preview').hide();
				$('#input-bmManage-img').val("");
				$('.input-bmManage-title').val("");
				$('.input-bmManage-link').val("");
				$('.input-bmManage-summary').val("");
				$('.modal-bmManage .input-bmManage-labels .input-bmManage-label').remove();

				$('.modal-bmManage').modal('hide');
			}

			$('.div-bookmark').on('click', '.bookmark-btn-remove', function(){
				$theBookMark = $(this).parents("tr");

				if(confirm('您确定要移除这个书签吗？')){
					$.ajax({
				        url:"Admin_removeBookMark",    
				        type:"POST",  
				        data:{
				        	bookmarkID:$theBookMark.children(".bookmark-ID").text()
				        },
				        dataType:"json",
				        async:false,
				        success: function(data){  
				            if(data != null){
				            	if(data['result'] == true){
				            		alert("移除成功");

				            		queryBookMarkListPage_Admin($('.bookmark-lastQuery').val(), $('.bookmark-nowPage').val());
				            	}else if(data['result'] == false){
				            		alert("移除失败");
				            	}
				            }
				        },
				        error:function(xhr, textStatus, errorThrown){
				        	alert(textStatus + ":" + errorThrown);
				        }	
				    });  
				}
			});
		</script>

		<!-- 系统日志 -->
		<script>
	    	//日志列表 分页按钮
			$('.log-btn-firstPage').click(function (){
				if($('.log-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}
				var word = $('.log-lastQuery').val();
				var pageNum = 1;
				queryLogListPage_Admin(word, pageNum);
			});
			$('.log-btn-prevPage').click(function (){
				if($('.log-nowPage').val() == 1){
					alert('已经是第一页了！');
					return ;
				}

				var word = $('.log-lastQuery').val();
				var pageNum = -1 + parseInt($('.log-nowPage').val());
				queryLogListPage_Admin(word, pageNum);
			});
			$('.log-btn-nextPage').click(function (){
				if($('.log-nowPage').val() == $('.log-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.log-lastQuery').val();
				var pageNum = 1 + parseInt($('.log-nowPage').val());
				queryLogListPage_Admin(word, pageNum);
			});
			$('.log-btn-lastPage').click(function (){
				if($('.log-nowPage').val() == $('.log-totalPage').val()){
					alert('已经是最后一页了！');
					return ;
				}
				var word = $('.log-lastQuery').val();
				var pageNum = $('.log-totalPage').val();
				queryLogListPage_Admin(word, pageNum);
			});

			// 用户名和书签名 提示框
			$('body').on('mouseover', "[data-toggle='tooltip']", function(){
				$(this).tooltip('show');
			});

			// 系统日志搜索
			$('.log-btn-search').click(function(){
				word = $('.log-input-word').val();
				queryLogListPage_Admin(word, 1);
			});

			//查询日志列表
			function queryLogListPage_Admin(word, pageNum){

				var pageSize = 20;
				var url = "Admin_getLogListPage";

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						word:word,
						pageNum:pageNum,
						pageSize:pageSize
					},
					async:false,
					url:url,
					success:function(data, status){
						if(data != null && data['total'] != 0){

							$('.log-lastQuery').val(word);
							$('.log-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
							$('.log-nowPage').val(pageNum);
							$('.log-input-jumpPage').text(pageNum);
							$('.log-span-totalPage').text(parseInt((data['total'] + pageSize - 1) / pageSize));

							var rows = data['data'];
							var html = "";
							for(var i = 0; i < rows.length; i++){
								 html += createLog(rows[i]);
							}
							$('.div-log tbody').html(html);
						}else{
							$('.log-lastQuery').val(word);
							$('.log-totalPage').val(1);
							$('.log-nowPage').val(1);
							$('.log-input-jumpPage').text(1);
							$('.log-span-totalPage').text(1);
							$('.div-log tbody').html(createNullInfo());
						}
					},
					error:function (xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}

			function createLog(log){
				var html = "<tr class=\"tr-base\">\
								<td class=\"log-item log-ID\">" + log['ID'] + "</td>\
								<td class=\"log-item log-type\">" + log['type'] + "</td>";
							if(log['type'] == '用户注册' || log['type'] == '用户登录'){

					html +=		"<td class=\"log-item log-userID\" data-toggle=\"tooltip\" title=\"用户名：" + log['user']['username'] + "\" data-container=\"body\">" + log['userID'] + "</td>\
								<td class=\"log-item log-bookmarkID\">-</td>";
								

							}else if(log['type'] == '访问书签'){

					html += 	"<td class=\"log-item log-userID\">-</td>\
								<td class=\"log-item log-bookmarkID\" data-toggle=\"tooltip\" title=\"书签名：" + log['bookmark']['name'] + "\" data-container=\"body\">" + log['bookmarkID'] + "</td>";

							}else{

					html += 	"<td class=\"log-item log-userID\" data-toggle=\"tooltip\" title=\"用户名：" + log['user']['username'] + "\" data-container=\"body\">" + log['userID'] + "</td>\
								<td class=\"log-item log-bookmarkID\" data-toggle=\"tooltip\" title=\"书签名：" + log['bookmark']['name'] + "\" data-container=\"body\">" + log['bookmarkID'] + "</td>";

							}

					html += 	"<td class=\"log-item log-date\">" + log['date'] + "</td>\
							</tr>";

					return html;
			}
	    </script>

		<!-- 统计报表 -->
		<script>
			$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				if($(this).text() == "用户活动周报"){
					showUserAtyWeek(getDate_Ymd());
					$(".input-userAtyWeek").val(getDate_Ymd());
				}else if($(this).text() == "书签活动周报"){
					showBookMarkAtyWeek(getDate_Ymd());
					$(".input-bookmarkAtyWeek").val(getDate_Ymd());
				}
			});

			$('.input-userAtyWeek').change(function(){
				showUserAtyWeek($(this).val());
			});

			$('.input-bookmarkAtyWeek').change(function(){
				showBookMarkAtyWeek($(this).val());
			});

			function showUserAtyWeek(date){
				dateArr = getWeekArray(date);
				dateStr = '';
				for(i in dateArr){
					if(i == 6)
						dateStr += dateArr[i];
					else
						dateStr += dateArr[i] + ',';
				}
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						date:dateStr
					},
					url:'Admin_getUserAtyWeek',
					async:false,
					success:function(data, status){
						if(data != null){

							var target = "chart-userActivityWeek";
							var title = "用户活动周报";
							var legend = [];
							legend.push('用户登录数');
							legend.push('用户注册数');
							var xAxis = getWeekArray(date);//数据
							var series = [];
							series.push({
								name:'用户登录数',
								type:'bar',
								data:data['login']
							});
							series.push({
								name:'用户注册数',
								type:'bar',
								data:data['rgst']
							});
							makeChart(target, title, legend, xAxis, series);
						}
					},
					error:function(xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}
	        
			function showBookMarkAtyWeek(date){
				dateArr = getWeekArray(date);
				dateStr = '';
				for(i in dateArr){
					if(i == 6)
						dateStr += dateArr[i];
					else
						dateStr += dateArr[i] + ',';
				}
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						date:dateStr
					},
					url:'Admin_getBookMarkAtyWeek',
					async:false,
					success:function(data, status){
						if(data != null){

							var target = "chart-bookmarkActivityWeek";
							var title = "书签活动周报";
							var legend = [];
							legend.push('书签访问数');
							legend.push('书签分享数');
							legend.push('书签收藏数');
							legend.push('书签添加数');
							var xAxis = getWeekArray(date);//数据
							var series = [];
							series.push({
								name:'书签访问数',
								type:'bar',
								data:data['visit']
							});
							series.push({
								name:'书签分享数',
								type:'bar',
								data:data['share']
							});
							series.push({
								name:'书签收藏数',
								type:'bar',
								data:data['collect']
							});
							series.push({
								name:'书签添加数',
								type:'bar',
								data:data['add']
							});
							makeChart(target, title, legend, xAxis, series);
						}
					},
					error:function(xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}

	        //获取当前日期 格式：yyyy-mm-dd
			function getDate_Ymd(){
				var nowDate = new Date();
				var year = nowDate.getFullYear();
				var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;
				var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
				var dateStr = year + "-" + month + "-" + day;

				return dateStr;
			}

			function getWeekArray(date){ 
				var array = [];
				
				for(var i = 6; i >= 0; i--){
					var dt = new Date(date);
					dt.setDate(dt.getDate() - i);
					var d = dt.getDate() <= '9'?('0' + dt.getDate()):dt.getDate(); 
					var m = (dt.getMonth() + 1) <= 9?('0' + (dt.getMonth() + 1)):(dt.getMonth() + 1); 
					var y = dt.getFullYear();
					array.push(y + '-' + m + '-' + d);
				}

				return array;
			}

			function makeChart(target, title, legend, xAxis, series){
				// 基于准备好的dom，初始化echarts实例
		        var chart = echarts.init(document.getElementById(target));

		        // 指定图表的配置项和数据
		        var option = {
		            title: {
		                text: title
		            },
		            tooltip: {},
		            legend: {
		                data:legend
		            },
		            xAxis: {
		                data: xAxis
		            },
		            yAxis: {},
		            series: series
		        };

		        // 使用刚指定的配置项和数据显示图表。
		        chart.setOption(option);
			}
	    </script>
	</body>
</html>
