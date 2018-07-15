<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>后台管理系统登录</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-datepicker3.css">
		<style>
			
		</style>
	</head>
	
	<body>
		<div class="panel panel-default" style="margin-top:10%; width:40%; margin-left:30%;">
			<div class="panel-heading">
				后台管理系统登录
			</div>
			<div class="panel-body">
				<div class="alert alert-danger" style="display: none"></div>
				<div class="input-group">
					<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
					<input type="text" class="form-control input-account" placeholder="账号..." />
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
					<input type="password" class="form-control input-password" placeholder="密码..." />
				</div>
			</div>
			<div class="panel-footer">
				<button class="btn btn-primary" style="margin-left: 80%">&nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
		</div>



		<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>
		<script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
		<script type="text/javascript" src="locales/bootstrap-datepicker.zh-CN.min.js"></script>
		<script type="text/javascript" src="js/ajaxfileupload.js"></script>
		<script>
			$('.panel input').keypress(function(e){
				if(e.keyCode == 13){
					$('.btn').trigger('click');
				}
			});

			$('.btn').click(function(){
				var account = $('.input-account').val();
				var password = $('.input-password').val();

				if(account == '' || password == ''){
					showMessage('信息填写不完整');
					return ;
				}else{
					hideMessage();
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							account:account,
							password:password
						},
						async:false,
						url:"Admin_login",
						success:function(data, status){
							if(data != null && data['result'] == true){
								window.location.href = "Admin_home";
							}else{
								showMessage('账号不存在，或密码错误');
							}
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
					});
				}
			});

			function showMessage(message){
				$('.alert').text(message).show();
			}

			function hideMessage(){
				$('.alert').text("").hide();
			}
		</script>
	</body>
</html>