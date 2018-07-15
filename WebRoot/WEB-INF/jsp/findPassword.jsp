<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>找回密码</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<style>
			*{
				padding:0px;
				margin:0px;
			}
			html,body{
				overflow-x: hidden;
			}
		</style>
	</head>

	<body style="background-image:url(img/img-bg.jpg);">

		<div style="width:500px; height:220px; border:1px solid #CCCCCC; background-color:rgba(255, 255, 255, 0.8); margin-left: auto;margin-right: auto; margin-top:10%; overflow: hidden;">
			<div class="validate" style="width:500px; height:220px;">
				<div style="width:100%; height:36px; line-height: 36px; font-size: 18px; padding-left: 20px; border-bottom:1px solid #CCCCCC; background-color: #ededed">邮箱验证
				</div>
				<div class="input-group" style="margin:20px">
					<span class="input-group-addon">邮箱</span>
					<input type="text" class="form-control input-email" placeholder="账号绑定的邮箱..." />
					<div class="input-group-btn">
						<button class="btn btn-default btn-sendVali">发送验证码</button>
					</div>
				</div>
				<div class="input-group" style="margin:20px">
					<span class="input-group-addon">验证码</span>
					<input type="text" class="form-control input-valiCode" placeholder="输入收到的验证码..."/>
				</div>

				<input type="hidden" class="input-md5Code"/>
				<input type="hidden" class="input-userID" value="1"/>

				<button class="btn btn-primary btn-next pull-right" style="margin-right: 20px; ">下一步</button>
			</div>

			<div class="modify" style="width:500px; height:220px">
				<div style="width:100%; height:36px; line-height: 36px; font-size: 18px; padding-left: 20px; border-bottom:1px solid #CCCCCC; background-color: #ededed">修改密码
				</div>
				<div class="input-group" style="margin:20px">
					<span class="input-group-addon">新密码</span>
					<input type="password" class="form-control input-newPassword" placeholder="新密码..." />
				</div>
				<div class="input-group" style="margin:20px">
					<span class="input-group-addon">确认密码</span>
					<input type="password" class="form-control input-confirm" placeholder="确认密码..."/>
				</div>

				<input type="hidden" class="input-userID"/>

				<button class="btn btn-primary btn-submit pull-right" style="margin-right: 20px; ">确认</button>
			</div>
		</div>


		<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/md5.js"></script>
		<script>
			// 检查验证码是否正确 切换到修改密码界面
			$('.btn-next').click(function(){
				email = $('.input-email').val();
				valiCode = $('.input-valiCode').val();
				md5Code = $('.input-md5Code').val();

				if(email == '' || valiCode == ''){
					alert('填写信息不完整，请确认');
				}else if(email.match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/) == null){
					alert('邮箱格式错误');
				}else if(hex_md5(email + valiCode) != md5Code){
					alert('验证码错误，或者邮箱与验证码不对应');
				}else{
					$('.validate').stop().animate({'marginTop':-220}, 600);
				}
			});

			// 发送验证码
			$('.btn-sendVali').click(function(){
				if($('.input-email').val() != ''){
					if($('.input-email').val().match(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/) == null){
						alert("邮箱格式错误");
						return ;
					}else if(!checkEmailBind($('.input-email').val())){
						alert("没有与此邮箱绑定的账号");
						return ;
					}

					$.ajax({
						type:'POST',
						dataType:"text",
						url:"User_sendValiCode",
						data:{rgstMail:$('.input-email').val()},
						success: function (data, status) {
		                    if(data != null){
		                    	$('.input-md5Code').val(data);
		                    	alert("验证码发送成功，若未收到请检查邮箱垃圾箱，或者重新发送");
		                    }else{
		                    	alert("验证码发送失败");
		                    }
		                },
		                error : function(XMLHttpRequest, textStatus, errorThrown) {
		                    alert(textStatus + ':' + errorThrown);
		                }
					});
				}else{
					alert("请先输入账号绑定的邮箱");
				}
			});

			// 检查邮箱是否绑定
			function checkEmailBind(email){
				var result = false;

				$.ajax({
					type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "User_checkEmailRgst" ,//url
	                async:false,
	                data: {
	                	rgstMail:email
	                },
	                success: function (data, status) {
	                    if(data != null && data['result'] != -1){
	                    	result = true;
	                    	$('.input-userID').val(data['result']);
	                    }
	                },
	                error : function(XMLHttpRequest, textStatus, errorThrown) {
	                    alert(textStatus + ':' + errorThrown);
	                }
				});

				return result;
			}

			// 修改密码提交
			$('.btn-submit').click(function(){
				newPassword = $('.input-newPassword').val();
				confirm = $('.input-confirm').val();

				if(newPassword == '' || confirm == ''){
					alert('信息填写不完整');
					return ;
				}else if(newPassword.length < 6 || newPassword.length > 16){
					alert('密码不能超过16位，且不能小于6位');
					return ;
				}else if(newPassword != confirm){
					alert('密码前后不一致');
					return ;
				}

				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						newPassword: newPassword,
						userID: $('.input-userID').val()
					},
					url:"User_findPassword",
					async:false,
					success: function (data, status) {
	                    if(data != null){
	                    	if(data['result'] == true){
	                    		alert('修改成功，请保管好您的新密码');
	                    		window.close();
	                    	}else{
	                    		alert('修改失败');
	                    	}
	                    }
	                },
	                error : function(XMLHttpRequest, textStatus, errorThrown) {
	                    alert(textStatus + ':' + errorThrown);
	                }
				});
			});
		</script>
	</body>
</html>
