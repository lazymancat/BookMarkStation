<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>  

<!DOCTYPE HTML>
<html>
	<head>
		<rapid:block name="title"></rapid:block> 
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-datepicker3.css">
		<style>			
			*{
				padding:0px;
				margin:0px;
			}
			
			.base-img-head{
				border-bottom: 1px solid;
				height:100px; 
				overflow: hidden;
				background-image: url("img/img-head2.jpg");
			}

			.base-navbar .navbar-header span, .base-navbar .navbar-nav li a{
				display:block; 
				padding-left:50px; 
				padding-right:50px;
			}

			.base-modal .modal-dialog{
				width:400px;
			}
			
			.base-row{
				margin-left:0px;
				margin-right: 0px;
			}

			.base-go-top{
				position: fixed; 
				right:10px; 
				bottom: 30px; 
				z-index: 2； 
				text-align:center; 
				background-color: #1E90FF; 
				color:#FFFFFF; 
				padding:10px;
			}
			.base-go-top:hover{
				cursor:pointer;
				background-color: #0870DF
			}

			.base-footer{
				background-color: #EEEEEE; 
				border-top:1px solid #CCCCCCl; 
				width:100%; 
				margin-bottom:0px;
			}
		</style>

		<!-- 子页面css -->
		<rapid:block name="style"></rapid:block>
	</head>
	<body>
		<!-- 头图 开始 -->
		<div class="row base-row base-img-head">
			<span style="height: 100px; line-height: 100px;color:white; font-size: 40px; font-weight: 500; margin-left: 30px">个人书签管理网站</span>
		</div> 
		<!-- 头图 结束 -->
 
 		<!-- 导航条 开始 -->
		<div class="row base-row">
			<nav class="navbar navbar-default base-navbar">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
			    </div>

				<div class="collapse navbar-collapse" id="navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="index">首页</a></li>
					</ul>

					<spirng:form class="navbar-form navbar-left">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle" id="btn-toggleSearchType" data-toggle="dropdown">书签&nbsp;&nbsp;<span class="caret"></span></button>
						        <ul class="dropdown-menu">
						          <li><a href="#" class="btn-searchType">书签</a></li>
						          <li><a href="#" class="btn-searchType">用户</a></li>
						        </ul>
							</div>
							<input class="form-control input-word" type="text" placeholder="输入关键字" />
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default btn-search">搜索</button>
							</span>
						</div>
					</spirng:form>

					<ul class="nav navbar-nav navbar-right nav-user">
						<c:if test="${user == null}">
							<li><a href="#" id="btn-login">登录</a></li>
							<li><a href="#" id="btn-register">注册</a></li>
						</c:if>
						<c:if test="${user != null}">
							<li>
								<input type="hidden" class="user-ID" value="${user.ID}"/>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="btn-userDropdown">${user.username}&nbsp;&nbsp;<span class="caret"></span></a>
								<ul class="dropdown-menu">
						          <li><a href="#" id="btn-homepage">个人中心</a></li>
						          <li><a href="#" id="btn-updatePWD">修改密码</a></li>
						          <li><a href="#" id="btn-logout">注销</a></li>
						        </ul>
							</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
		<!-- 导航条 结束 -->

		
		<!-- 子页面内容 -->
		<rapid:block name="content"></rapid:block>

		
		<!-- 回到顶部 开始 -->
		<div class="base-go-top">
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-arrow-up" style="margin:0 auto"></span></span><br>
			<span>回到顶部</span>
		</div>
		<!-- 回到顶部 结束 -->

		<!-- 页脚 开始 -->
		<div class="row base-row base-footer">
			<span style="margin-left:47%">By Lazymancat</span>
		</div>
		<!-- 页脚 结束 -->

		<!-- 登录模态框 开始 -->
		<div class="modal fade base-modal" id="modal-login" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">登录</h4>
					</div>
					<div class="modal-body">
						<div role="form">
							<div class="alert alert-danger" id="msg-login" style="display:none"></div>

			        		<div class="input-group">
			        			<span class="input-group-addon">   <span class="glyphicon glyphicon-user"></span></span>
			        			<input id="input-username-login" class="form-control" name="username" type="text" placeholder="用户名.."></input>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">
			        				<span class="glyphicon glyphicon-lock"></span>
			        			</span>
			        			<input id="input-password-login" class="form-control" name="password" type="password" placeholder="密码.."></input>
			        			<span class="input-group-btn">
			        				<a class="btn btn-default" id="btn-pwdToggle-login">
			        					<span class="glyphicon glyphicon-eye-close"></span>
			        				</a>
			        			</span>
			        		</div>
			        		<br>
			        	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info btn-forget" style="float: left">忘记密码？</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="btn-submit-login" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 登录模态框 结束 -->

		<!-- 注册模态框 开始 -->
		<div class="modal fade base-modal" id="modal-rgst" tabindex="-2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">注册</h4>
					</div>
					<div class="modal-body">
						<div role="form">
							<div class="alert alert-danger" id="msg-rgst" style="display:none"></div>

			        		<div class="input-group">
			        			<span class="input-group-addon">   <span class="glyphicon glyphicon-user"></span></span>
			        			<input id="input-username-rgst" class="form-control" name="username" type="text" placeholder="用户名.."></input>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">
			        				<span class="glyphicon glyphicon-lock"></span>
			        			</span>
			        			<input id="input-password-rgst" class="form-control" name="password" type="password" placeholder="密码.."></input>
			        			<span class="input-group-btn">
			        				<a class="btn btn-default btn-pwdToggle-rgst">
			        					<span class="glyphicon glyphicon-eye-close"></span>
			        				</a>
			        			</span>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">
			        				<span class="glyphicon glyphicon-lock"></span>
			        			</span>
			        			<input id="input-passwordConfirm-rgst" class="form-control" name="password" type="password" placeholder="确认密码.."></input>
			        			<span class="input-group-btn">
			        				<a class="btn btn-default btn-pwdToggle-rgst">
			        					<span class="glyphicon glyphicon-eye-close"></span>
			        				</a>
			        			</span>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">
			        				<span class="glyphicon glyphicon-envelope"></span>
			        			</span>
			        			<input id="input-email-rgst" class="form-control" type="text" placeholder="邮箱.."></input>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">
			        				<span class="glyphicon glyphicon-send"></span>
			        			</span>
			        			<input id="input-valiCode-rgst" class="form-control" type="text" placeholder="验证码.."></input>
			        			<span class="input-group-btn">
			        				<a class="btn btn-default" id="btn-sendValiCode-rgst">
			        					发送验证码
			        				</a>
			        			</span>
			        		</div>
			        		<input type="hidden" id="input-md5Code" />
			        	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="btn-submit-rgst" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 注册模态框 结束 -->

		<!-- 修改密码模态框 开始 -->
		<div class="modal fade base-modal" id="modal-updatePWD" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">修改密码</h4>
					</div>
					<div class="modal-body">
						<div role="form">
							<div class="alert alert-danger" id="msg-updatePWD" style="display:none"></div>

			        		<div class="input-group">
			        			<span class="input-group-addon">原密码</span>
			        			<input id="input-oldPassword" class="form-control" type="password" placeholder="原密码.."></input>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">新密码</span>
			        			<input id="input-newPassword" class="form-control" type="password" placeholder="新密码.."></input>
			        		</div>
			        		<br>
			        		<div class="input-group">
			        			<span class="input-group-addon">确认密码</span>
			        			<input id="input-confirmNew" class="form-control" type="password" placeholder="确认密码.."></input>
			        		</div>
			        		<br>
			        	</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="btn-submit-updatePWD" type="button" class="btn btn-primary">提交</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改密码模态框 结束 -->

		<!-- 子页面模态框 -->
		<rapid:block name="popup"></rapid:block>

		<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>
		<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="locales/bootstrap-datepicker.zh-CN.min.js"></script>
		<script type="text/javascript" src="js/ajaxfileupload.js"></script>

		<!-- 页面基础功能 开始 -->
		<script type="text/javascript">
			
			// 导航鼠标覆盖样式
			$('.navbar-nav').on("mouseover", "li", function(){
				$(this).addClass("active");
			}); 
			$('.navbar-nav').on("mouseout", "li", function(){
				$(this).removeClass("active");
			});

			// 个人中心
			$('#btn-homepage').click(function(){
				window.location.href = "User_homepage";
			});			

			//搜索类型切换
			$('.btn-searchType').click(function(){
				var searchType = $(this).text();
				$('#btn-toggleSearchType').html(searchType + "&nbsp;&nbsp;<span class='caret'></span>");
			});

			//返回顶部
			$('.base-go-top').click(function(){
				$(window).scrollTop(0);
			});

			//搜索
			$('.btn-search').click(function(){
				if($('#btn-toggleSearchType').text().substr(0, 2) == "书签"){
					var word = $('.input-word').val();
					window.location.href="index?word=" + word;
				}else{
					var word = $('.input-word').val();
					window.location.href="User_userList?word=" + word;
				}
			});

			//输入关键字时回车 快捷触发搜索
			$('.input-word').keypress(function(e){
				if(e.keyCode == 13){
					$('.btn-search').trigger('click');
				}
			});

			// 查看书签详情
			$('body').on('click', '.btn-entry', function(){
				var ID = $(this).parents('.bookmark').children('.bookmark-ID').val();

				window.open("BookMark_show?ID=" + ID);
			});

			// 处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
			function forbidBackSpace(e){    
				var ev = e || window.event; 
				//获取event对象    
				var obj = ev.target || ev.srcElement; 
				//获取事件源    
				var t = obj.type || obj.getAttribute('type'); 
				//获取事件源类型    
				//获取作为判断条件的事件类型   
				var vReadOnly = obj.readOnly;    
				var vDisabled = obj.disabled;    
				//处理undefined值情况    
				vReadOnly = (vReadOnly == undefined) ? false : vReadOnly;    
				vDisabled = (vDisabled == undefined) ? true : vDisabled;    
				//当敲Backspace键时，事件源类型为密码或单行、多行文本的，    
				////并且readOnly属性为true或disabled属性为true的，则退格键失效    
				var flag1 = ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vDisabled == true);    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
				var flag2 = ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea";
				//判断
				if (flag2 || flag1) 
					return false;
			}
			$(document).ready(function(){	
				//禁止后退键 作用于Firefox、Opera
				document.onkeypress = forbidBackSpace;
				//禁止后退键  作用于IE、Chrome
				document.onkeydown = forbidBackSpace;
			});

			// 获取当前日期 格式：yyyy-mm-dd
			function getDate_Ymd(){
				var nowDate = new Date();
				var year = nowDate.getFullYear();
				var month = nowDate.getMonth() + 1 < 10 ? "0" + (nowDate.getMonth() + 1) : nowDate.getMonth() + 1;
				var day = nowDate.getDate() < 10 ? "0" + nowDate.getDate() : nowDate.getDate();
				var dateStr = year + "-" + month + "-" + day;

				return dateStr;
			}

			// 忘记密码
			$('.btn-forget').click(function(){
				window.open("User_jumpFindPassword");
			});

			// 添加日志
			function addLog(type, userID, bookmarkID){
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						type:type,
						userID:userID,
						bookmarkID:bookmarkID
					},
					url:"Log_addLog"
				});
			}
		</script>
		<!-- 页面基础功能 结束 -->

		<!-- 登录 开始 -->
		<script type="text/javascript">
			// 登录提示信息
			function showLoginMsg(msg){
				$('#msg-login').html(msg).show();
			}
			function hideLoginMsg(){
				$('#msg-login').html('').hide();
			}

			// 重置登录模态框
			function cleanModalLogin(){
				hideLoginMsg();
				$('#input-username-login').val('');
				$('#input-password-login').val('');
				$('#input-password-login').attr('type', 'password');
				$('#btn-pwdToggle-login').children('span').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
			}
			$('#modal-login').on("hide.bs.modal", cleanModalLogin);

			// 解决模态框弹出时 页面右侧出现17px内补
			$('#btn-login').click(function(){
				$('#modal-login').modal('show');
				$("body").css('padding-right','0px');
			});

			// 密码可见状态切换
			$('#btn-pwdToggle-login').click(function(){
				if($('#input-password-login').attr('type') == 'password'){
					$('#input-password-login').attr('type', 'text');
					$(this).children('span').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
				}else{
					$('#input-password-login').attr('type', 'password');
					$(this).children('span').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
				}
			});
			
			// 输入回车快捷提交登录
			$('#input-username-login, #input-password-login').keypress(function(e){
				if(e.keyCode == 13){
					$('#btn-submit-login').trigger('click');					
				}
			});

			// 提交登录
			$('#btn-submit-login').click(function(){
				$username = $('#input-username-login').val();
				$password = $('#input-password-login').val();
				
				if($username == null || $username == '' || $password == null || $password == ''){
					showLoginMsg('信息不完整，请确认');
				}else if(checkUserIsBan($username, $password)){
					showLoginMsg('该账号已被禁用');
				}else{
					$.ajax({
		                type: "POST",//方法类型
		                dataType: "text",//预期服务器返回的数据类型
		                url: "User_doLogin" ,//url
		                data: {username:$username,
		                	password:$password
		                },
		                success: function (data, status) {
		                    if(data == "success"){
		                    	window.location.reload();
		                    }else{
		                    	showLoginMsg('账号不存在或者密码错误');
		                    }
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
		            });
				}
			});

			// 检查用户是否已被禁用
			function checkUserIsBan(username, password){
				var result = false;
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						username:username,
						password:password
					},
					async:false,
					url:"User_checkUserIsBan",
					success : function(data, status ){
						result = data['result'];
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
	                    alert(textStatus + ':' + errorThrown);
	                }
				});

				return result;
			}
		</script>
		<!-- 登录 结束 -->

		<!-- 注销 开始 -->
		<script type="text/javascript">
			$('#btn-logout').on("click", function(){
				if(confirm('您确定要注销吗？')){
					window.location.href = "User_doLogout";
				}
			});
		</script>
		<!-- 注销 结束 -->

		<!-- 注册 开始 -->
		<script type="text/javascript">
			
			// 注册提示信息
			function showRgstMsg(msg){
				$('#msg-rgst').html(msg).show();
			}
			function hideRgstMsg(){
				$('#msg-rgst').html('').hide();
			}

			// 重置注册模态框
			function cleanModalRgst(){
				hideRgstMsg();
				$('#input-username-rgst').val('');
				$('#input-password-rgst').val('');
				$('#input-password-rgst').attr('type', 'password');
				$('#input-passwordConfirm-rgst').val('');
				$('#input-passwordConfirm-rgst').attr('type', 'password');
				$('.btn-pwdToggle-rgst').children('span').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
				$('#input-email-rgst').val('');
				$('#input-valiCode-rgst').val('');
			}
			$('#modal-rgst').on("hide.bs.modal", cleanModalRgst);
			
			// 解决模态框弹出时 页面右侧出现17px内补
			$('#btn-register').click(function(){
				$('#modal-rgst').modal('show');
				$("body").css('padding-right','0px');
			});

			// 密码显示状态切换
			$('.btn-pwdToggle-rgst').click(function(){
				$thePwd = $(this).parent('span').prev('input');
				if($thePwd.attr('type') == 'password'){
					$thePwd.attr('type', 'text');
					$(this).children('span').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
				}else{
					$thePwd.attr('type', 'password');
					$(this).children('span').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
				}
			});
			
			// 发送验证码
			$('#btn-sendValiCode-rgst').click(function(){
				if($('#input-email-rgst').val() != ''){
					if($('#input-email-rgst').val().match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/) == null){
						showRgstMsg("邮箱格式错误");
						return ;
					}else if(checkEmailRgst($('#input-email-rgst').val())){
						showRgstMsg("该邮箱已被注册");
						return ;
					}

					$.ajax({
						type:'POST',
						dataType:"text",
						url:"User_sendValiCode",
						data:{rgstMail:$('#input-email-rgst').val()},
						success: function (data, status) {
		                    if(data != null){
		                    	$('#input-md5Code').val(data);
		                    	showRgstMsg("验证码发送成功，若未收到请检查邮箱垃圾箱，或者重新发送");
		                    }else{
		                    	showRgstMsg("验证码发送失败");
		                    }
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
					});
				}else{
					showRgstMsg("请先输入注册邮箱");
				}
			})

			// 提交注册
			$('#btn-submit-rgst').click(function(){
				$username = $('#input-username-rgst').val();
				$password = $('#input-password-rgst').val();
				$passwordConfirm = $('#input-passwordConfirm-rgst').val();
				$email = $('#input-email-rgst').val();
				$valiCode = $('#input-valiCode-rgst').val();
				$md5Code = $('#input-md5Code').val();
				
				if($username == '' || $password == '' || $passwordConfirm == '' || $email == '' || $valiCode == ''){
					showRgstMsg('信息不完整，请确认');
				}else if($username.length > 10){
					showRgstMsg('用户名长度不能超过10位');
				}else if($password.length > 16 || $password.length < 6){
					showRgstMsg('密码长度不能超过16位, 且不能小于6位');
				}else if($password != $passwordConfirm){
					showRgstMsg('前后密码不一致');
				}else if(hex_md5($email + $valiCode) != $md5Code){
					//将邮箱和验证码一起md5 防止用户在发送验证码后改动邮箱
					showRgstMsg('验证码错误，或验证码与填写的邮箱不对应，请确认');
				}else{
					$.ajax({
		                type: "POST",//方法类型
		                dataType: "text",//预期服务器返回的数据类型
		                url: "User_checkUserNameExist" ,//url
		                data: {username:$username
		                },
		                success: function (data, status) {
		                    if(data == "success"){

		                    	$.ajax({
		                    		type:"post",
		                    		dataType:"text",
		                    		url:"User_doRegister",
		                    		data:{
		                    			username:$username,
		                    			password:$password,
		                    			email:$email,
		                    			rgstDate:getDate_Ymd()
		                    		},
		                    		success:function(data, status){
		                    			if(data == "success"){
		                    				alert("注册成功，请前往登录！");
		                    				cleanModalRgst();

		                    				$('#modal-rgst').modal('hide');
		        
									        $('#modal-rgst').one('hidden.bs.modal', function(){
									               $('#modal-login').modal('show');     					
									        });
		                    			}else{
		                    				showRgstMsg("注册失败！");
		                    			}
		                    		},
		                    		error : function(XMLHttpRequest, textStatus, errorThrown) {
					                    alert(textStatus + ':' + errorThrown);
					                }

		                    	});
		                    }else{
		                    	showRgstMsg('用户名已存在');
		                    }
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
		            });
				}
			});

			// 检查邮箱是否已被注册
			function checkEmailRgst(email){
				var result = true;

				$.ajax({
					type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "User_checkEmailRgst" ,//url
	                async:false,
	                data: {
	                	rgstMail:email
	                },
	                success: function (data, status) {
	                    result = data['result'];
	                },
	                error : function(XMLHttpRequest, textStatus, errorThrown) {
	                    alert(textStatus + ':' + errorThrown);
	                }
				});

				return result;
			}
		</script>
		<!-- 注册 结束 -->

		<!-- 修改密码 开始 -->
		<script type="text/javascript">
			// 修改密码
			$('#btn-updatePWD').click(function(){
				$('#modal-updatePWD').modal('show');
				$("body").css('padding-right','0px');
			});

			// 提交修改
			$('#btn-submit-updatePWD').click(function(){
				oldPassword = $('#input-oldPassword').val();
				newPassword = $('#input-newPassword').val();
				confirmNew = $('#input-confirmNew').val();

				if(oldPassword == '' || newPassword == '' || confirmNew == ''){
					showUpdatePWDMsg('信息不完整，请确认');
				}else if(!checkOldPWDCorrect(oldPassword)){
					showUpdatePWDMsg('原密码错误');
				}else if(newPassword.length < 6 || newPassword.length > 16){
					showUpdatePWDMsg('密码长度不能超过16位, 且不能小于6位');
				}else if(newPassword != confirmNew){
					showUpdatePWDMsg('前后密码不一致');
				}else{
					$.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "User_updatePassword" ,//url
		                data: {
		                	newPassword:newPassword,
		                	userID:$('.user-ID').val()
		                },
		                success: function (data, status) {
		                   if(data != null && data['result'] == true){
		                   		alert('修改成功');
		                   		$('#modal-updatePWD').modal('hide');
		                   }else{
		                   		showUpdatePWDMsg('修改失败');
		                   }
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
		            });
				}
			});

			// 修改密码提示信息
			function showUpdatePWDMsg(msg){
				$('#msg-updatePWD').html(msg).show();
			}
			function hideUpdatePWDMsg(){
				$('#msg-updatePWD').html('').hide();
			}

			// 重置修改密码模态框
			function cleanModalUpdatePWD(){
				hideUpdatePWDMsg();
				$('#input-oldPassword').val('');
				$('#input-newPassword').val('');
				$('#input-confirmNew').val('');
			}
			$('#modal-updatePWD').on('hidden.bs.modal', cleanModalUpdatePWD);

			// 检查原密码是否正确
			function checkOldPWDCorrect(oldPassword){
				userID = $('.user-ID').val();

				result = false;
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						password:oldPassword,
						userID:userID
					},
					async:false,
					url:'User_checkOldPasswordCorrect',
					success:function(data,status){
						result = data['result'];
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
	                    alert(textStatus + ':' + errorThrown);
	                }
				});

				return result;
			}
		</script>
		<!-- 修改密码 结束 -->

		<!-- 生成html 开始 -->
		<script type="text/javascript">
			// 生成书签html代码
			function createBookMark(ID, title, summary, link, imgName){
				var html = "<div class='col-md-3 col-sm-3 col-xs-3 bookmark'>" + 
								"<input type='hidden' class='bookmark-ID' value='" + ID + "'/>" +
								"<div class='panel panel-default'>" + 
									"<div class='panel-heading bookmark-title' title=\"" + title + "\" onclick=\"jumpBookMark('" + link + "')\">" + title + "</div>" + 
									"<img src='img/bookmark/" + imgName + "' class='bookmark-img' onclick=\"jumpBookMark('" + link + "')\"/>" + 
									"<div class='panel-body'>"+
										"<div class='bookmark-summary'>" + summary + "</div>" + 
									"</div>"+
									"<div class='panel-footer'>"+
										"<button class='btn btn-primary btn-sm btn-jump' onclick=\"jumpBookMark('" + link + "')\">去看看</button>"+
										"<button class='btn btn-info btn-sm btn-entry'>查看详情</button>"+
									"</div>"+
								"</div>"+
							"</div>";
				return html;
			}	
			// 生成评论html代码
			function createComment(ID, imgName, name, date, content){
				var html = "<div class=\"comment\">"
							+   "<input type='hidden' class='comment-ID' value='" + ID + "'/>"
							+	"<img class=\"img-circle comment-photo\" src=\"img/user/" + imgName + "\" />"
							+	"<div class=\"comment-name\">" + name + "</div>"
							+	"<div class=\"comment-date\">" + date + "</div>"
							+	"<div class=\"comment-content\">" + content + "</div>"
							+"</div>";
				return html;
			}
			// 生成书签管理页元素代码
			function createBMManage(ID, title, summary, link, imgName, labels){
				var html  = "<div class=\"row bm-manage\">"
							+	"<img src=\"img/bookmark/" + imgName + "\" class=\"bm-manage-img\"/>"
							+	"<div class=\"bm-manage-info\">"
							+		"<span style=\"color: #1491f0\">标题:&nbsp;&nbsp;</span><span class=\"bm-manage-title\" style=\"color: #888888\">" + title + "</span><br>"
							+		"<span style=\"color: #1491f0\">链接:&nbsp;&nbsp;</span><span class=\"bm-manage-link\" style=\"color: #888888\">" + link + "</span><br>"
							+		"<span style=\"color: #1491f0\">标签:&nbsp;&nbsp;</span>"
							+		"<span class=\"bm-manage-labels\" style=\"color: #888888\">";

								for(var i = 0; i < labels.length; i++){
									html += "<span style=\"margin-right:10px;\">" + labels[i]['name'] + "</span>";
								}

				html 		+=		"</span><br>"
							+		"<span style=\"color: #1491f0\">简介:&nbsp;&nbsp;</span><span class=\"bm-manage-summary\" style=\"color: #888888\">" + summary + "</span>"
					   		+		"<input type=\"hidden\" class=\"bm-manage-ID\" value=\"" + ID + "\"/>"
							+	"</div>"
							+"</div>";
				return html;
			}
			// 生成用户html代码
			function createUser(imgName, userID, username, description){
				var html = "<div class=\"user\">\
								<input type=\"hidden\" class=\"user-userID\" value=\"" + userID + "\"/>\
								<img src=\"img/user/" + imgName + "\" class=\"img-circle user-img\"/>\
								<div class=\"user-info\">\
									<span class=\"user-name\">" + username + "</span>\
									<p class=\"user-description\">" + description + "</p>\
								</div>\
								<div class=\"btn btn-primary btn-focusUser\">关注</div>\
							</div>";

				return html;
			}
			// 生成关注用户html代码
			function createFocusUser(imgName, userID, username, description){
				var html = "<div class=\"focusUser\">\
								<input type=\"hidden\" class=\"focusUser-userID\" value=\"" + userID + "\"/>\
								<img src=\"img/user/" + imgName + "\" class=\"img-circle focusUser-img\"/>\
								<div class=\"focusUser-info\">\
									<span class=\"focusUser-name\">" + username + "</span>\
									<p class=\"focusUser-description\">" + description + "</p>\
								</div>\
								<div class=\"btn btn-primary btn-focusUser btn-beFocused\">已关注</div>\
							</div>";

				return html;
			}
			// 生成通知html代码
			function createInformation(information){
				var title = information['type'] == 1?"书签分享":"系统通知";
				var isNew = information['isChecked'] == 0?"new":"";
				
				var html = "";
				if (information['type'] == 1){
					var cont = information['content'] == ""?"":",  并留言：" + information['content'];

					html += "<div class=\"row information\">\
										<input type=\"hidden\" value=\"" + information['ID'] + "\"/>\
										<span class=\"information-type\">" + title + "</span>  \
										<span class=\"badge\" style=\"background-color:#FF4500\">" + isNew + "</span>\
										<button class=\"btn btn-sm btn-primary btn-checkInformation\" style=\"float: right;\">查看详情</button>\
										<span style=\"float:right; margin-right:20px\">日期：" + information['date'] + "</span>\
										<p class=\"information-content\">\
										<a href=\"User_viewUser?ID=" + information['fromUser']['ID'] + "\" target=\"_blank\">" + information['fromUser']['username'] + "</a>向你分享了一个书签：<a href=\"BookMark_show?ID=" + information['bookmark']['ID'] + "\" target=\"_blank\">" + information['bookmark']['name'] + "</a>" + cont + "</p>\
								</div>";
				}else if (information['type'] == 2){
					html += "<div class=\"row information\">\
										<input type=\"hidden\" value=\"" + information['ID'] + "\"/>\
										<span class=\"information-type\">" + title + "</span>  \
										<span class=\"badge\" style=\"background-color:#FF4500\">" + isNew + "</span>\
										<button class=\"btn btn-sm btn-primary btn-checkInformation\" style=\"float: right;\">查看详情</button>\
										<span style=\"float:right; margin-right:20px\">日期：" + information['date'] + "</span>\
										<p class=\"information-content\">" + information['content'] + "</p>\
								</div>";
				}
				return html;
			}
			// 生成无数据页面html代码
			function createNullInfo(){
				var html = "<div class='nullInfo' style='height:300px; line-height:300px ; width:auto; color:#CCCCCC; font-size:36px; font-weight:600; text-align:center; margin:20px; border:2px dashed #CCCCCC'>"
							+"没有数据"
							+"</div>";
				return html;
			}
		</script>
		<!-- 生成html 结束 -->

		<!-- 子页面js -->
		<rapid:block name="script"></rapid:block>
	</body>
</html>