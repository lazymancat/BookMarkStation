<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">  
    <title>用户个人中心</title>
</rapid:override>  

<rapid:override name="style">
	<style>
	
		html,body{
			overflow-x: hidden;
		}
		.row{
			margin:0px;
		}
		.homepage{
			padding:0px;
			min-height:450px;
			/*border: 1px dashed #CCCCCC;*/
			margin-bottom: 20px;
		}
		.homepage-nav{
			padding:0px;
		}
		.homepage-content{
			padding:20px;
			/*border:1px dashed #CCCCCC;*/
		}
		
		.user-infoGroup{
			margin-top: 20px; 
			border-top:1px solid #CCCCCC; 
			padding:20px;
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

		.div-bookmark, .div-bookmark2{
			padding:0px;
		}
		.div-bookmark .panel-body div, .div-bookmark2 .panel-body div{
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

		.bm-manage{
			border:1px solid #CCCCCC; 
			padding:5px; 
			margin-bottom:5px;
			background-color: #F6F6F6;
		}
		.bm-manage-selected{
			border:1px solid #0091e0;
			box-shadow: 0px 0px 5px #0091e0;
		}
		.bm-manage-img{
			width:100px; 
			height:100px;
			float: left;
		}
		.bm-manage-info{
			height:100px; 
			overflow:hidden; 
			width:888px; 
			float: left; 
			padding-left:20px;
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

		.information{
			width:100%; 
			height:75px; 
			border:1px solid #CCCCCC; 
			border-radius: 10px;
			padding:10px;
			margin-bottom:10px;
		}
		.information-type{
			font-size:16px;
		}
		.information-content{
			white-space: nowrap; 
			width: 100%; 
			overflow: hidden; 
			text-overflow:ellipsis; 
			margin-top:15px;
		}

		.focusUser-page{
			text-align: center;
			margin-top:10px;
			margin-bottom:10px;
		}
		.focusUser-list{
			box-shadow: 0px -1px 4px #000000;
		}
		.focusUser{
			height: 100px; 
			padding:10px;
			border-bottom: 1px solid #CCCCCC;
		}
		.focusUser-img{
			width:60px;
			height:60px;
			float:left;
			margin:10px;
		}
		.focusUser-info{
			margin-left:20px;
			float: left;
		}
		.focusUser-name{
			font-size:24px;
			font-weight: 600;
			line-height: 40px;
		}
		.focusUser-name:hover{
			cursor:pointer;
			color:#777777;
		}
		.focusUser-description{
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

		.btn-changePhoto{
			margin-top: 20px; margin-left:30%;
		}

		.collectedList-searchBox{
			margin-left:15px; 
			margin-bottom:20px; 
			width:400px;
		}
		.bmManage-searchBox{
			margin-left:15px; 
			margin-bottom:20px; 
			width:450px; 
			float: left;
		}
		.btn-oprtGroup{
			margin-left:40px; 
			float: left;
		}
		.btn-oprtGroup .btn{
			width:150px;
		}

		.focusUser-searchBox{
			margin-left:15px; 
			margin-bottom:20px;
			width:400px;
		}

		.img-preview{
			margin:10px; 
			width:120px; 
			height:120px; 
			display:none;
		}

		.img-bmManage-preview{
			margin:10px; 
			width:120px; 
			height:120px; 
			display:none;
		}

		.input-bmManage-labels{
			margin:10px 0px; 
			width:100%; 
			height:70px;
		}
		.input-bmManage-labels-title{
			height: 30px; 
			line-height: 30px; 
			float: left; 
			margin-right: 10px; 
			margin-bottom: 5px;
		}
	</style>
</rapid:override> 

<rapid:override name="content">
	<div class="row">
		<div class="col-lg-12 homepage">
			<!-- 导航栏 -->
			<div class="col-lg-2 homepage-nav">
				<ul class="nav nav-pills nav-stacked">
				    <li class="active">
				    	<a href="#info" data-toggle="tab">个人信息</a>
				    </li>
				    <li>
				    	<a href="#collectedList" data-toggle="tab">收藏列表</a>
				    </li>
				    <li>
				    	<a href="#bookmarkManage" data-toggle="tab">书签管理</a>
				    </li>
				    <li>
				    	<a href="#myFocus" data-toggle="tab">我的关注</a>
				    </li>
				    <li>
				    	<a href="#information" data-toggle="tab">系统通知  <span class="badge"></span></a>
				    </li>
				</ul>
			</div>

			<!-- 内容 -->
			<div class="col-lg-10 homepage-content">
				<div class="tab-content">
					<!-- 个人信息 -->
				    <div class="tab-pane active" id="info">
				    	<div class="row user-info-1">
				    		<div class="col-md-3">
				    			<img class="img-circle img-thumbnail user-photo" src="img/user/${user.img.name}"/>
				    			<button class="btn btn-success btn-sm btn-changePhoto">更换头像</button>
				    		</div>
				    		<div class="col-md-9">
				    			<div class="user-name">
				    				<span>${user.username}</span>
				    			</div>
				    			<div class="user-description">
				    				<span>${user.description}</span>
				    			</div>
				    		</div>
				    	</div>
				    	<div class="row">
				    		<div class="form-group user-infoGroup">
					    		<div class="input-group col-md-3" style="float: left">
					    			<span class="input-group-addon">生日</span>
					    			<input class="form-control user-birthday" readonly="readonly" disabled="disabled" type="text" value="${user.birthday}"/>
					    		</div>
					    		<div class="input-group col-md-3 col-md-offset-1" style="float: left">
					    			<span class="input-group-addon">性别</span>
					    			<input class="form-control user-sex" readonly="readonly" disabled="disabled" type="text" value="${user.sex}"/>
					    		</div>
					    		<div class="input-group col-md-3 col-md-offset-1" style="float: left">
					    			<span class="input-group-addon">注册日期</span>
					    			<input class="form-control user-rgstDate" readonly="readonly" disabled="disabled" type="text" value="${user.rgstDate}"/>
					    		</div>
					    	</div>
				    	</div>
				    	<div class="row" style="text-align: center; padding-top:40px;">
					    	<button class="btn btn-primary user-btnEdit">编辑</button>
				    	</div>
				    </div>

					<!-- 收藏书签列表 -->
				    <div class="tab-pane" id="collectedList">
				    	<!-- 搜索栏 -->
				    	<div class="row">
				    		<div class="input-group collectedList-searchBox">
				    			<input type="text" class="form-control input-collectList-word" placeholder="请输入关键字.."/>
				    			<span class="input-group-btn">
				    				<button class="btn btn-default btn-collectedList-search">搜索</button>
				    			</span>
				    		</div>
				    	</div>
				    	<!-- 列表 -->
				    	<div class="row div-bookmark">
				    		<!-- 列表内容 -->
							<div class="row" style="min-height: 450px">
							</div>

							<!-- 分页组件 -->
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

				    <!-- 个人书签管理 -->
				    <div class="tab-pane" id="bookmarkManage">
				    	<!-- 操作栏 -->
				    	<div class="row">
				    		<div class="input-group bmManage-searchBox">
				    			<input type="text" class="form-control input-manage-word" placeholder="请输入关键字.."/>
				    			<span class="input-group-btn">
				    				<button class="btn btn-primary btn-manage-search" style="width:150px">搜索</button>
				    			</span>
				    		</div>
				    		<div class="btn-group btn-oprtGroup">
				    			<button class="btn btn-success" onclick="goAddBM()">添加</button>
				    			<button class="btn btn-warning" onclick="goModifyBM()">修改</button>
				    			<button class="btn btn-danger" onclick="goRemoveBM()">移除</button>
				    		</div>
				    	</div>
						<div class="row div-bookmark2">
							<!-- 列表区域 -->
							<div class="row" style="min-height: 450px">
							</div>
	
							<!-- 分页组件 -->
							<div class="row bookmark-p2" style="text-align: center">
								<input type="hidden" class="bookmark-lastQuery2"/>
								<input type="hidden" class="bookmark-totalPage2" value="1"/>
								<input type="hidden" class="bookmark-nowPage2" value="1"/>

								<div class="btn-group">
									<button class="btn btn-default btn-firstPage2">&lt;&lt;</button>
									<button class="btn btn-default btn-prevPage2">&lt;</button>
								</div>
								<span>第</span>
								<span class="input-jumpPage2">1</span>
								<span>/</span>
								<span class="span-totalPage2">1</span>
								<span>页</span>
								<div class="btn-group">
									<button class="btn btn-default btn-nextPage2">&gt;</button>
									<button class="btn btn-default btn-lastPage2">&gt;&gt;</button>
								</div>
							</div>
						</div>
				    </div>

				    <!-- 关注列表 -->
				    <div class="tab-pane" id="myFocus">
				    	<div class="col-md-12 div-focusUser">
				    		<!-- 搜索栏 -->
							<div class="row">
					    		<div class="input-group focusUser-searchBox">
					    			<input type="text" class="form-control input-focusList-word" placeholder="请输入关键字.."/>
					    			<span class="input-group-btn">
					    				<button class="btn btn-default btn-focusList-search">搜索</button>
					    			</span>
					    		</div>
					    	</div>
							
							<!-- 列表区域 -->
							<div class="row focusUser-list" style="min-height: 450px">
							</div>

							<!-- 分页组件 -->
							<div class="row focusUser-page">
								<input type="hidden" class="focusUser-lastQuery" value=""/>
								<input type="hidden" class="focusUser-totalPage" value="1"/>
								<input type="hidden" class="focusUser-nowPage" value="1"/>

								<div class="btn-group">
									<button class="btn btn-default btn-firstPage4">&lt;&lt;</button>
									<button class="btn btn-default btn-prevPage4">&lt;</button>
								</div>
								<span>第</span>
								<span class="input-jumpPage4">1</span>
								<span>/</span>
								<span class="span-totalPage4">1</span>
								<span>页</span>
								<div class="btn-group">
									<button class="btn btn-default btn-nextPage4">&gt;</button>
									<button class="btn btn-default btn-lastPage4">&gt;&gt;</button>
								</div>
							</div>
						</div>
				    </div>

				    <!-- 系统通知 -->
				    <div class="tab-pane" id="information">
						<div class="row div-information">
							<!-- 列表区域 -->
							<div class="row" style="min-height: 450px">
							</div>

							<!-- 分页组件 -->
							<div class="row information-p" style="text-align: center">
								<input type="hidden" class="information-lastQuery"/>
								<input type="hidden" class="information-totalPage" value="1"/>
								<input type="hidden" class="information-nowPage" value="1"/>

								<div class="btn-group">
									<button class="btn btn-default btn-firstPage3">&lt;&lt;</button>
									<button class="btn btn-default btn-prevPage3">&lt;</button>
								</div>
								<span>第</span>
								<span class="input-jumpPage3">1</span>
								<span>/</span>
								<span class="span-totalPage3">1</span>
								<span>页</span>
								<div class="btn-group">
									<button class="btn btn-default btn-nextPage3">&gt;</button>
									<button class="btn btn-default btn-lastPage3">&gt;&gt;</button>
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
	<!-- 个人信息修改模态框 -->
	<div class="modal fade modal-modifyInfo" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">修改资料</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="input-group col-sm-8 col-sm-offset-2" style="margin-bottom: 20px">
			    			<span class="input-group-addon">个人说明</span>
			    			<textarea class="form-control input-description" rows="6" style="resize: none;"></textarea>
			    		</div>
			    		<div class="input-group col-sm-8 col-sm-offset-2" style="margin-bottom: 20px">
			    			<span class="input-group-addon">生日</span>
			    			<input class="form-control input-datepicker input-birthday" readonly="readonly" type="text"/>
			    		</div>
			    		<div class="input-group col-sm-8 col-sm-offset-2">
			    			<span class="input-group-addon">性别</span>
			    			<input class="form-control input-sex" data-toggle="dropdown" readonly="readonly" type="text"/>

			    			<ul class="dropdown-menu dropdown-sex">
								<li><a>男</a></li>
								<li><a>女</a></li>
								<li><a>保密</a></li>
			    			</ul>
			    		</div>
			    	</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary user-btnSubmit">提交</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 头像上传模态框 -->
	<div class="modal fade modal-photoUpload" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">头像上传</h4>
				</div>
				<div class="modal-body">
					<form name="form-photo"  target="_self" id="form-photo" method="post" enctype="multipart/form-data" >
						<input name="file" type="file" id="input-photo" onchange="upload()" accept="image/*" />
					</form>
					<img class="img-thumbnail img-preview" src=""/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-photoUpload" onclick="savePhoto()">提交</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 书签添加 and 书签修改 -->
	<div class="modal fade modal-bmManage" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">书签添加</h4>
				</div>
				<div class="modal-body">
					<form name="form-bmManage"  target="_self" id="form-bmManage" method="post" enctype="multipart/form-data" >
						<span>书签图片：</span><input name="file" type="file" id="input-bmManage-img" onchange="uploadBMImg()" accept="image/*" />
						<img class="img-thumbnail img-bmManage-preview" src=""/><br>

						<span>标题:</span>
						<input type="text" class="form-control input-bmManage-title"/>
						<span>链接:</span>
						<input type="text" class="form-control input-bmManage-link"/>

						
						<div class="input-bmManage-labels" style="">
							<div class="input-bmManage-labels-title">标签:</div>
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

	<!-- 通知详情模态框 -->
	<div class="modal fade modal-information" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</rapid:override> 

<rapid:override name="script">

	<script>
		$(document).ready(function (){
			checkNewInfomation();
		});

		//跳转到书签页
		function jumpBookMark(address){
			window.open(address);
		}

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

		//切换模块 显示不同内容
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			if($(this).text().substr(0, 4) == "收藏列表"){
				queryBookMarkListPage_User('', 1);
			}else if($(this).text().substr(0, 4) == "书签管理"){
				queryBookMarkListPage_Manage('', 1);
			}else if($(this).text().substr(0, 4) == "系统通知"){
				queryInformationListPage('', 1);
			}else if($(this).text().substr(0, 4) == "我的关注"){
				queryFocusUserListPage('', 1);
			}
		});

		//检查选择文件的后缀是否合法
		function checkSuffixAllow(filename){
			var suffix = filename.substr(filename.lastIndexOf('.') + 1);
			if(suffix != 'png' && suffix != 'jpg' && suffix != 'jpeg' && suffix != 'bmp' && suffix != 'gif'){
				return false;
			}else{
				return true;
			}
		}
	</script>
	
	<!-- 个人信息 -->
	<script>
		// 修改个人资料
		$('.user-btnEdit').click(function(){
			$('.modal-modifyInfo').modal('show');

			$('.input-description').val($('.user-description').children().text());
			$('.input-birthday').val($('.user-birthday').val());
			$('.input-sex').val($('.user-sex').val());

			$("body").css('padding-right','0px');
		});

		// 重置编辑资料模态框
		function resetModal(){
			$('.modal-modifyInfo input').val("");
			$('.modal-modifyInfo textarea').val("");
		}
		$('.modal-modifyInfo').on('hidden.bs.modal',resetModal);

		// 修改性别下拉菜单项 响应点击修改输入框值
		$('.dropdown-sex li a').click(function(){
			$('.input-sex').val($(this).text());
		});

		// 修改资料提交
		$('.user-btnSubmit').click(function(){
			description = $('.input-description').val();
			birthday = $('.input-birthday').val();
			sex = $('.input-sex').val();

			if(birthday == ''){
				birthday = null;
			}else if(description.length > 500){
				alert('个人说明长度不能超过500个字符');
				return ;
			}

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					description:description,
					birthday:birthday,
					sex:sex,
					userID:$('.user-ID').val()
				},
				url:"User_modifyInfo",
				success:function(data, status){
					if(data['result'] == true){
						alert('修改资料成功');
						window.location.reload();
					}else{
						alert('修改资料失败');
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		});

		//更换头像按钮
		$('.btn-changePhoto').click(function(){
			$('.modal-photoUpload').modal('show');
			$("body").css('padding-right','0px');
		});

		//文件输入框内容变化 上传图片 并显示预览
		function upload() {  
			if(!checkSuffixAllow($('#input-photo').val())){
				alert("图片文件只接受jpg,jpeg,png,gif,bmp等格式");
				$('#input-photo').val("");
				return ;
			}

		    formData = new FormData(document.getElementById("form-photo"));  
		    temp = document.getElementById("input-photo");
		    formData.append("file", temp.files[0]);

		    $.ajax({    
		        contentType:"multipart/form-data",  
		        url:"User_photoUpload",    
		        type:"POST",  
		        data:formData,
		        dataType:"json",
		        async:false,  
		        processData: false,  // 告诉jQuery不要去处理发送的数据  
		        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头  
		        success: function(data){  
		            if(data != null){
		            	if(data['result'] == true){
		            		$('.img-preview').attr("src", "img/user/" + data['filename']).show();
		            	}
		            }
		        },
		        error:function(xhr, textStatus, errorThrown){
		        	alert(textStatus + ":" + errorThrown);
		        }	
		    });  
		} 

		//保存头像
		function savePhoto() {  
			if($('#input-photo').val() == ''){
				alert("请选择一张图片");
				return ;
			}

		    formData = new FormData(document.getElementById("form-photo"));  
		    temp = document.getElementById("input-photo");
		    formData.append("file", temp.files[0]);
		    formData.append("userID", $('.user-ID').val());
		    formData.append("filename", $('.img-preview').attr("src").substr(9));

		    $.ajax({    
		        contentType:"multipart/form-data",  
		        url:"User_savePhoto",    
		        type:"POST",  
		        data:formData,
		        dataType:"json",
		        async:false,  
		        processData: false,  // 告诉jQuery不要去处理发送的数据  
		        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头  
		        success: function(data){  
		            if(data != null){
		            	if(data['result'] == true){
		            		alert("更换成功");
		            		
		            		clearPhotoModal();
		            		$('.user-photo').attr("src", $('.img-preview').attr("src"));
		            	}else if(data['result'] == false){
		            		alert("更换失败");
		            	}
		            }
		        },
		        error:function(xhr, textStatus, errorThrown){
		        	alert(textStatus + ":" + errorThrown);
		        }	
		    });  
		} 

		//重置头像修改模态框
		function clearPhotoModal(){
			$('.img-preview').hide();
			$('#input-photo').val("");
		    $('.modal-photoUpload').modal('hide');
		}
		$('.modal-photoUpload').on("hidden.bs.modal", clearPhotoModal);
	</script>

	<!-- 收藏列表 -->
	<script>
		// 分页按钮
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

		// 分页查询收藏书签列表
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
					userID:$('.user-ID').val()
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

		// 收藏列表搜索
		$('.btn-collectedList-search').click(function(){
			queryBookMarkListPage_User($('.input-collectList-word').val(), 1);
		});
	</script>
	
	<!-- 书签管理 -->
	<script>
		// 分页按钮
		$('.btn-firstPage2').click(function (){
			if($('.bookmark-nowPage2').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery2').val();
			var pageNum = 1;
			queryBookMarkListPage_Manage(word, pageNum);
		});
		$('.btn-prevPage2').click(function (){
			if($('.bookmark-nowPage2').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var word = $('.bookmark-lastQuery2').val();
			var pageNum = -1 + parseInt($('.bookmark-nowPage2').val());
			queryBookMarkListPage_Manage(word, pageNum);
		});
		$('.btn-nextPage2').click(function (){
			if($('.bookmark-nowPage2').val() == $('.bookmark-totalPage2').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery2').val();
			var pageNum = 1 + parseInt($('.bookmark-nowPage2').val());
			queryBookMarkListPage_Manage(word, pageNum);
		});
		$('.btn-lastPage2').click(function (){
			if($('.bookmark-nowPage2').val() == $('.bookmark-totalPage2').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.bookmark-lastQuery2').val();
			var pageNum = $('.bookmark-totalPage2').val();
			queryBookMarkListPage_Manage(word, pageNum);
		});

		// 分页查询书签管理列表
		function queryBookMarkListPage_Manage(word, pageNum){

			var pageSize = 8;
			var url = "BookMark_getBookMarkListPage_Manage";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
					userID:$('.user-ID').val()
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.bookmark-lastQuery2').val(word);
						$('.bookmark-totalPage2').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.bookmark-nowPage2').val(pageNum);
						$('.input-jumpPage2').text(pageNum);
						$('.span-totalPage2').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createBMManage(rows[i]['ID'], rows[i]['name'], rows[i]['summary'], rows[i]['link'], rows[i]['img']['name'], rows[i]['labels']);
							 // console.log(html);
							 // console.log(rows);
						}
						 $('.div-bookmark2').children(".row").first().html(html);
					}else{
						$('.bookmark-lastQuery2').val(word);
						$('.bookmark-totalPage2').val(1);
						$('.bookmark-nowPage2').val(1);
						$('.input-jumpPage2').text(1);
						$('.span-totalPage2').text(1);
						$('.div-bookmark2').children(".row").first().html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 书签管理 搜索
		$('.btn-manage-search').click(function(){
			queryBookMarkListPage_Manage($('.input-manage-word').val(), 1);
		});

		// 书签管理 选中单个书签
		$('.div-bookmark2').on('click', '.bm-manage', function(){
			$('.div-bookmark2 .bm-manage').removeClass('bm-manage-selected');
			$(this).addClass('bm-manage-selected');
		});

		// 显示添加书签模态框
		function goAddBM(){
			$('.modal-bmManage .modal-title').text("书签添加");
			$('.btn-bmManage-submit').attr('onclick', "addBookMark()");
			$('.modal-bmManage').modal('show');

			$("body").css('padding-right','0px');
		}

		// 双击快速修改
		$('.div-bookmark2').on('dblclick', '.bm-manage', goModifyBM);

		// 显示修改书签模态框
		function goModifyBM(){
			if($('.bm-manage-selected').length <= 0){
				alert('请先选择一个书签');
				return ;
			}

			$('.modal-bmManage .modal-title').text("书签修改");
			$('.modal-bmManage .input-bmManage-title').val($('.bm-manage-selected .bm-manage-title').text());
			$('.modal-bmManage .input-bmManage-link').val($('.bm-manage-selected .bm-manage-link').text());
			$('.modal-bmManage .input-bmManage-summary').val($('.bm-manage-selected .bm-manage-summary').text());

			$('.bm-manage-selected .bm-manage-labels span').each(function(){
				var temp = 	"<div class=\"input-bmManage-label\">"
						+		"<span>" + $(this).text() + "</span>"
						+		"<div class=\"btn-removeLabel\" style='float:right; font-size:24px'>&nbsp;&times;</div>"
						+ 	"</div>";
				$('.modal-bmManage .input-bmManage-labels .btn-addLabel').before(temp);
			});
			// alert($('.modal-bmManage .input-bmManage-labels span').text());

			$('.btn-bmManage-submit').attr('onclick', "modifyBookMark()");
			$('.modal-bmManage').modal('show');
			
			$("body").css('padding-right','0px');
		}

		// 删除标签
		$('.modal-bmManage .input-bmManage-labels').on('click', '.btn-removeLabel', function(){
			$(this).parent().remove();
		});

		// 移除书签
		function goRemoveBM(){
			if($('.bm-manage-selected').length <= 0){
				alert('请先选择一个书签');
				return ;
			}

			if(confirm('您确定要移除这个书签吗？')){
				$.ajax({
			        url:"BookMark_removeBookMark",    
			        type:"POST",  
			        data:{
			        	bookmarkID:$('.bm-manage-selected .bm-manage-ID').val()
			        },
			        dataType:"json",
			        async:false,
			        success: function(data){  
			            if(data != null){
			            	if(data['result'] == true){
			            		alert("移除成功");

			            		queryBookMarkListPage_Manage($('.bookmark-lastQuery2').val(), $('.bookmark-nowPage2').val());
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
		}

		// 重置书签模态框
		function clearBMManageModal(){
			$('.img-bmManage-preview').hide();
			$('#input-bmManage-img').val("");
			$('.input-bmManage-title').val("");
			$('.input-bmManage-link').val("");
			$('.input-bmManage-summary').val("");
			$('.modal-bmManage .input-bmManage-labels .input-bmManage-label').remove();

			$('.modal-bmManage').modal('hide');
		}
		$('.modal-bmManage').on("hidden.bs.modal", clearBMManageModal);

		// 上传书签图片
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
		        url:"BookMark_bookmarkImgUpload",    
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

		// 添加书签
		function addBookMark(){
			title = $('.input-bmManage-title').val();
			link = $('.input-bmManage-link').val();
			summary = $('.input-bmManage-summary').val();
			labels = [];
			$('.modal-bmManage .input-bmManage-label').each(function(){
				labels.push($(this).children('span').text());
			});

			if(title == '' || link == ''){
				alert("书签信息不完整");
				return ;
			}else if(title.length > 50){
				alert("书签标题不能超过50个字符");
				return ;
			}else if(link.length > 300){
				alert("书签链接不能超过300个字符，太长请使用短链接生成");
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
		    formData.append("userID", $('.user-ID').val());
		    formData.append("date", getDate_Ymd());
		    formData.append("labels", labels);

		    $.ajax({    
		        contentType:"multipart/form-data",  
		        url:"BookMark_addBookMark",    
		        type:"POST",  
		        data:formData,
		        dataType:"json",
		        async:false,  
		        processData: false,  // 告诉jQuery不要去处理发送的数据  
		        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头  
		        success: function(data){  
		            if(data != null){
		            	if(data['result'] == true){
		            		alert("添加成功");
		            		
		            		clearBMManageModal();

		            		queryBookMarkListPage_Manage($('.bookmark-lastQuery2').val(), $('.bookmark-nowPage2').val());
		            	}else if(data['result'] == false){
		            		alert("添加失败");
		            	}
		            }
		        },
		        error:function(xhr, textStatus, errorThrown){
		        	alert(textStatus + ":" + errorThrown);
		        }	
		    });  
		}

		// 修改书签
		function modifyBookMark(){
			title = $('.input-bmManage-title').val();
			link = $('.input-bmManage-link').val();
			summary = $('.input-bmManage-summary').val();
			bookmarkID = $('.bm-manage-selected .bm-manage-ID').val();
			labels = [];
			$('.modal-bmManage .input-bmManage-label').each(function(){
				labels.push($(this).children('span').text());
			});

			if(title == '' || link == ''){
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
		        url:"BookMark_modifyBookMark",    
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

							$('.bm-manage-selected .bm-manage-title').text(title);
							$('.bm-manage-selected .bm-manage-link').text(link)
							$('.bm-manage-selected .bm-manage-summary').text(summary);
							if($('.img-bmManage-preview').attr("src") != ''){
								$('.bm-manage-selected .bm-manage-img').attr("src", $('.img-bmManage-preview').attr("src"));
							}

							var html = "";
							for(var i = 0; i < labels.length; i++){
								html += "<span style=\"margin-right:10px;\">" + labels[i] + "</span>";
							}
							$('.bm-manage-selected .bm-manage-labels').html(html);
		            		
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

		// 显示标签输入框
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

		// 保存标签
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

		// 取消添加标签
		$('.modal-bmManage').on('click', '.btn-cancel', function(){
			$(this).parent().parent().remove();
			$('.modal-bmManage .btn-addLabel').show();
		});
	</script>

	<!-- 关注列表 -->
	<script>
		// 关注列表 分页按钮
		$('.btn-firstPage4').click(function (){
			if($('.focusUser-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.focusUser-lastQuery').val();
			var pageNum = 1;
			queryFocusUserListPage(word, pageNum);
		});
		$('.btn-prevPage4').click(function (){
			if($('.focusUser-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}

			var word = $('.focusUser-lastQuery').val();
			var pageNum = -1 + parseInt($('.focusUser-nowPage').val());
			queryFocusUserListPage(word, pageNum);
		});
		$('.btn-nextPage4').click(function (){
			if($('.focusUser-nowPage').val() == $('.focusUser-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.focusUser-lastQuery').val();
			var pageNum = 1 + parseInt($('.focusUser-nowPage').val());
			queryFocusUserListPage(word, pageNum);
		});
		$('.btn-lastPage4').click(function (){
			if($('.focusUser-nowPage').val() == $('.focusUser-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.focusUser-lastQuery').val();
			var pageNum = $('.focusUser-totalPage').val();
			queryFocusUserListPage(word, pageNum);
		});

		// 分页查询关注列表
		function queryFocusUserListPage(word, pageNum){

			var pageSize = 8;
			var url = "User_getFocusUserListPage";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
					fromUserID:$('.user-ID').val()
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.focusUser-lastQuery').val(word);
						$('.focusUser-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.focusUser-nowPage').val(pageNum);
						$('.input-jumpPage4').text(pageNum);
						$('.span-totalPage4').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createFocusUser(rows[i]['img']['name'], rows[i]['ID'], rows[i]['username'], rows[i]['description']);
						}
						 $('.focusUser-list').html(html);
					}else{
						$('.focusUser-lastQuery').val(word);
						$('.focusUser-totalPage').val(1);
						$('.focusUser-nowPage').val(1);
						$('.input-jumpPage4').text(1);
						$('.span-totalPage4').text(1);

						$('.focusUser-list').html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 关注列表搜索
		$('.btn-focusList-search').click(function(){
			queryFocusUserListPage($('.input-focusList-word').val(), 1);
		});

		//收藏按钮覆盖响应
		$('.focusUser-list').on('mouseover', '.btn-focusUser', function(){
			if($(this).text() == "已关注"){
				$(this).text('取消关注');
			}
		});
		$('.focusUser-list').on('mouseout', '.btn-focusUser', function(){
			if($(this).text() == "取消关注"){
				$(this).text('已关注');
			}
		});

		// 用户名点击跳转
		$('.focusUser-list').on('click', '.focusUser-name', function(){
			window.open("User_viewUser?ID=" + $(this).parents('.focusUser').children(".focusUser-userID").val());
		});

		// 关注用户
		$('.focusUser-list').on('click', '.btn-focusUser', function(){
			$theButton = $(this);
			//用户已登录
			if($('.user-ID').length !=  0){
				if($(this).text() == "关注"){
					
					$.ajax({
						type:'post',
						dataType:'json',
						data:{
							toUserID:$(this).parent().children(".focusUser-userID").val(),
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
							toUserID:$(this).parent().children(".focusUser-userID").val(),
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

	<!-- 系统通知 -->
	<script>
		// 检查是否有未读的系统通知
		function checkNewInfomation(){
			userID = $('.user-ID').val();

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					userID:userID
				},
				url:"Information_checkNewInformation",
				async:false,
				success:function(data, status){
					if(data != null && data['result'] != 0){
						$("a[href='#information'] span").text(data['result']);
					}else{
						$("a[href='#information'] span").text("");
					}
				},
				error:function(xhr, textStatus, errorThrown){
					alert(textStatus+ ":" + errorThrown) ;
				}
			});
		}

		// 通知列表 分页按钮
		$('.btn-firstPage3').click(function (){
			if($('.information-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.information-lastQuery').val();
			var pageNum = 1;
			queryInformationListPage(word, pageNum);
		});
		$('.btn-prevPage3').click(function (){
			if($('.information-nowPage').val() == 1){
				alert('已经是第一页了！');
				return ;
			}
			var word = $('.information-lastQuery').val();
			var pageNum = -1 + parseInt($('.information-nowPage').val());
			queryInformationListPage(word, pageNum);
		});
		$('.btn-nextPage3').click(function (){
			if($('.information-nowPage').val() == $('.information-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.information-lastQuery').val();
			var pageNum = 1 + parseInt($('.information-nowPage').val());
			queryInformationListPage(word, pageNum);
		});
		$('.btn-lastPage3').click(function (){
			if($('.information-nowPage').val() == $('.information-totalPage').val()){
				alert('已经是最后一页了！');
				return ;
			}
			var word = $('.information-lastQuery').val();
			var pageNum = $('.information-totalPage').val();
			queryInformationListPage(word, pageNum);
		});

		// 分页查询通知列表
		function queryInformationListPage(word, pageNum){

			var pageSize = 8;
			var url = "Information_queryInformationListPage";

			$.ajax({
				type:'post',
				dataType:'json',
				data:{
					word:word,
					pageNum:pageNum,
					pageSize:pageSize,
					toUserID:$('.user-ID').val()
				},
				async:false,
				url:url,
				success:function(data, status){
					if(data != null && data['total'] != 0){

						$('.information-lastQuery').val(word);
						$('.information-totalPage').val(parseInt((data['total'] + pageSize - 1) / pageSize));
						$('.information-nowPage').val(pageNum);
						$('.input-jumpPage3').text(pageNum);
						$('.span-totalPage3').text(parseInt((data['total'] + pageSize - 1) / pageSize));

						var rows = data['data'];
						var html = "";
						for(var i = 0; i < rows.length; i++){
							 html += createInformation(rows[i]);
						}
						 $('.div-information').children(".row").first().html(html);
					}else{
						$('.information-lastQuery').val(word);
						$('.information-totalPage').val(1);
						$('.information-nowPage').val(1);
						$('.input-jumpPage3').text(1);
						$('.span-totalPage3').text(1);
						$('.div-information').children(".row").first().html(createNullInfo());
					}
				},
				error:function (xhr, textStatus, errorThrown){
					alert(textStatus + ":" + errorThrown);
				}
			});
		}

		// 显示通知详情模态框
		$('.div-information').on('click', '.btn-checkInformation', function(){
			var $information = $(this).parent();
			var informationID = $information.children('input').val();
			var type = $information.children('.information-type').text();
			var isNew = $information.children('.badge').text() == ''?1:0;
			var content = $information.children('.information-content').html();

			$('.modal-information .modal-title').text(type);
			$('.modal-information .modal-body').html(content);
			$('.modal-information').modal('show');

			$("body").css('padding-right','0px');

			if(isNew == 0){
				$.ajax({
					type:'post',
					dataType:'json',
					data:{
						informationID:informationID
					},
					url:"Information_checkedInformation",
					async:false,
					success:function(data, status){
						if(data != null && data['result'] == true){
							$information.children('.badge').text('');
							checkNewInfomation();
						}
					},
					error:function(xhr, textStatus, errorThrown){
						alert(textStatus + ":" + errorThrown);
					}
				});
			}
		});
	</script>
</rapid:override> 

<%@ include file="base.jsp" %> 