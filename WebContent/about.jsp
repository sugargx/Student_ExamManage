<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="stu.gx.dao.impl.*"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="stu.gx.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/green.css" id="colors">
<link
	href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap-grid.css"
	rel="stylesheet" type="text/css">
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/icons.css" type="text/css">
<link rel="stylesheet" href="css/plugins/revolutionslider.css"
	type="text/css">
<link rel="stylesheet" href="css/animate.css" type="text/css">
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet">

</head>
<script>
	function chklogin(txtUserName) {
		var xhr = createXmlHttpRequest();

		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var remember = document.getElementsByName('remember')[0].checked;//判断是否选择记住密码

		xhr.open("POST", "/GradeMan/userCheckLogin?username=" + username
				+ "&password=" + password + "&remember=" + remember);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		var username = txtUserName.value;
		xhr.send("username=" + username + "password=" + password + "remember"
				+ remember);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				//真正的处理
				if (xhr.status == 200 || xhr.status == 304) {
					//服务器正确返回
					var data = xhr.responseText;//服务器返回的数据
					if (data == "1")//登录成功，跳转到主页
					{
						//document.getElementById("divcheck").innerHTML="登录成功";
						//response.setHeader("refresh", "0;url=adminIndex.jsp");					
						var url = "userIndexPer.jsp";
						window.location.assign(url);

					} else if (data == '2')//登录失败，用户名不存在
					{
						document.getElementById("divcheck").innerHTML = "用户名不存在，请重新登录！";

					} else if (data == '3') {//登录失败，密码错误
						document.getElementById("divcheck").innerHTML = "密码错误，请重新输入！";
					} else if (data == '4') {//登录失败，密码未输入
						document.getElementById("divcheck").innerHTML = "密码为空，请输入密码！";
					} else if (data == '-1') {//登录失败，用户名未输入
						document.getElementById("divcheck").innerHTML = "用户名为空，请输入用户名！";
					}

				}
			}
		}
	}
	function createXmlHttpRequest() {
		var xmlHttp;
		try { //Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try { //Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		return xmlHttp;
	}

	//注册时验证用户名
	function chkusername(txtUserName) {

		var xhr = createXmlHttpRequest();

		xhr.open("POST", "/GradeMan/userCheckRes?time=" + new Date().getTime());
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		var username = txtUserName.value;
		xhr.send("username=" + username);

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				//真正的处理
				if (xhr.status == 200 || xhr.status == 304) {
					//服务器正确返回
					var data = xhr.responseText;//服务器返回的数据

					if (data == "1") {
						document.getElementById("error").innerHTML = " ";
						document.getElementById("regi").disabled = false;
					} else if (data == '-1') {
						document.getElementById("error").innerHTML = "用户名已被占用";
						document.getElementById("regi").disabled = true;
					} else if (username.trim().length == 0) {
						document.getElementById("error").innerHTML = "用户名不能为空";
					}
					//把返回的数据写到div中

				}
			}
		}
	}
	//注册时验证输入的两次密码是否一致
	function chkpass(txtUserName) {

		var xhr = createXmlHttpRequest();
		var password1 = document.getElementById("password1").value;
		var password2 = document.getElementById("password2").value;

		xhr.open("POST", "/GradeMan/userCheckResPass?password1=" + password1
				+ "&password2=" + password2);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("password1=" + password1 + "password2=" + password2);

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				//真正的处理
				if (xhr.status == 200 || xhr.status == 304) {
					//服务器正确返回
					var data = xhr.responseText;//服务器返回的数据

					if (data == "1") {
						document.getElementById("showpass").innerHTML = "";
					} else if (data == '-1') {
						document.getElementById("showpass").innerHTML = "两次密码输入不一致";
					} else if (data == '2') {
						document.getElementById("showpass").innerHTML = "密码不能为空";
					}
					//把返回的数据写到div中

				}
			}
		}
	}
	//验证第一个密码是否为空
	function chkpassFirst(txtUserName) {

		var xhr = createXmlHttpRequest();

		var password1 = document.getElementById("password1").value;
		if (password1.trim().length == 0) {
			document.getElementById("show1").innerHTML = "请输入密码，密码不能为空";

		} else if (password1.trim().length < 6) {
			document.getElementById("show1").innerHTML = "密码不能少于六位数";
			document.getElementById("regi").disabled = true;
		} else {
			document.getElementById("show1").innerHTML = " ";
			document.getElementById("regi").disabled = false;
		}
	}

	function check(form) {
		if (form.username.value == "") {
			alert("请输入用户名!");
			form.username.focus();
			return false;
		}
		if (form.password1.value == "") {
			alert("请输入密码!");
			form.password1.focus();
			return false;
		}

		if (form.password1.value != form.password2.value) {
			alert("两次密码输入不一致!");
			form.password2.focus();
			return false;
		}

	}
</script>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header Container
================================================== -->
		<header id="header-container">

			<!-- Header -->
			<div id="header">
				<div class="container">

					<!-- Left Side Content Begin-->
					<div class="left-side">

						<div id="logo" class="pull-left">
							<a href="#"><img src="images/logo.jpg" alt=""></a>
						</div>

						<!-- Mobile Navigation-->
						<div class="mmenu-trigger">
							<button class="hamburger hamburger&#45;&#45;collapse"
								type="button">
								<span class="hamburger-box"> <span
									class="hamburger-inner"></span>
								</span>
							</button>
						</div>


						<!-- Main Navigation Begin-->
						<nav id="navigation" class="style-1">
							<ul id="responsive">

								<li><a href="userIndex.jsp">首页</a></li>

								<li><a class="current" href="about.jsp">关于系统</a></li>


								<li><a href="contact.jsp">联系我们</a></li>

								<li><a href="" onclick="alert('请先登录！');">考试报名</a></li>

							</ul>
						</nav>

						<div class="clearfix"></div>
						<!-- Main Navigation / End -->

					</div>
					<!-- Left Side Content / End -->

					<div class="right-side">
						<div class="header-widget">
							<a href="#sign-in-dialog" class="sign-in popup-with-zoom-anim"><i
								class="sl sl-icon-login"></i>登录</a>
						</div>
					</div>

					<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">

						<div class="small-dialog-header">
							<h3>登录</h3>
						</div>

						<!--Tabs -->
						<div class="sign-in-form style-1">

							<ul class="tabs-nav">
								<li class=""><a href="#tab1">登录</a></li>
								<li><a href="#tab2">注册</a></li>
							</ul>

							<div class="tabs-container alt">

								<!-- Login -->
								<div class="tab-content" id="tab1" style="display: none;">

									<%
										String username = "";
										String password = "";
										Cookie[] c = request.getCookies();
										if (c != null) {
											for (int i = 0; i < c.length; i++) {
												if ("username".equals(c[i].getName())) {
													username = c[i].getValue();
												} else if ("password".equals(c[i].getName())) {
													password = c[i].getValue();
												}
											}
										} else {
											username = " ";
											password = " ";
										}
									%>

									<p class="form-row form-row-wide">
										<label for="username">用户名: <i class="im im-icon-Male"></i>
											<input type="text" class="input-text" name="username"
											id="username" value="<%=username%>" />
										</label>
									</p>

									<p class="form-row form-row-wide">
										<label for="password">密码: <i class="im im-icon-Lock-2"></i>
											<input class="input-text" type="password" name="password"
											id="password" value="<%=password%>" />
										</label>

										<!-- <span class="lost_password">
										<a href="#" >忘记密码?</a>
									</span> -->

									</p>
									<p id="divcheck" style="color: #000"></p>

									<div class="form-row">
										<button type="submit" class="button border margin-top-5"
											name="login" value="登录" onclick="chklogin(this)">登录</button>
										<div class="checkboxes margin-top-10">
											<input id="remember-me" type="checkbox" name="remember">
											<label for="remember-me">记住我</label>
										</div>
									</div>


								</div>

								<!-- 注册-->
								<div class="tab-content" id="tab2" style="display: none;">

									<form method="post" class="register" action="doreg.jsp"
										name="form">

										<p class="form-row form-row-wide">
											<label for="username2">用户名: <span id="error"
												style="color: red"></span> <i class="im im-icon-Male"></i> <input
												type="text" class="input-text" name="username" id="username"
												onblur="chkusername(this)" value="" placeholder="请输入用户名" />
											</label>
										</p>

										<p class="form-row form-row-wide">
											<label for="password1">密码: <span id="show1"
												style="color: red"></span> <i class="im im-icon-Lock-2"></i>
												<input class="input-text" type="password" name="password1"
												id="password1" onblur="chkpassFirst(this)" value=""
												placeholder="密码位数不能少于六位" />
											</label>
										</p>

										<p class="form-row form-row-wide">
											<label for="password2">确认密码: <span id="showpass"
												style="color: red"></span> <i class="im im-icon-Lock-2"></i>
												<input class="input-text" type="password" name="password2"
												id="password2" onblur="chkpass(this)" value=""
												placeholder="密码位数不能少于六位" />
											</label>
										</p>


										<p>
											<label for="core"> 验证码： <input type="text"
												name="code" id="code" /><img src="/GradeMan/ImageServlet" /><br />
										</p>

										<button type="submit" class="button border fw margin-top-10"
											id="regi" name="register" value="Register"
											onclick="return check(form)">注册</button>

									</form>
								</div>

							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- Header / End -->

		</header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->


		<!-- Titlebar
        ================================================== -->
		<div id="titlebar" class="gradient">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<h2>关于我们</h2>
						<span>我们是学生考试管理系统</span>

						<!-- Breadcrumbs -->
						<nav id="breadcrumbs" class="clearfix">
							<ul>
								<li><a href="userIndexPer.jsp">首页</a></li>
								<li>关于我们</li>
							</ul>
						</nav>

					</div>

				</div>
			</div>
		</div>


		<div class="container">

			<div class="row">
				<div class="col-md-6 col-sm-12">
					<img src="images/slider1.jpg" style="width: 600px; height: 400px;">
				</div>
				<div class="col-md-6 col-sm-12 about">
					<div class="about">
						<h2>学生考试管理系统</h2>
						<p style="text-indent: 2em; line-height: 30px;">本系统是对用户的考试报名及考试成绩进行综合管理的一个系统，且本系统可复制性高，适用于多种场景。
							系统管理员通过系统发布新的考试，在考试开始和截止报名时间段中，用户通过系统自行报名参加考试的名称，系统为报名考试的每个用户生成一个唯一的准考证号，准考证号决定了其所在考场和录入成绩时的唯一性。
							用户报名成功后，用户在系统内生成本人的准考证，准考证上除了考试相关信息和学生相关信息外，还附有本用户的考场信息和座号，考场信息由管理员进行增加、删除、修改和查看。在用户考试结束后，管理员通过系统进行增加用户成绩、修改成绩、删除成绩、查看成绩，用户可通过系统输入准考证号等必须信息进行本人考试成绩的查询，管理员还可对用户的成绩进行统计分析。
						</p>
					</div>
				</div>
			</div>
			<br> <br> <br>

			<!--
  #count
  ========================== -->

			<section id="count">
				<div class="container">
					<div class="row">
						<div class="counter-section clearfix">

							<!-- 用户总数 -->
							<%
								UserDao users = new UserDaoImpl();
								List<user> list = users.getAllUser();

								int num_user = 0;
								for (user user : list) {
									num_user++;
								}
							%>
							<!-- 考试总数 -->
							<%
								ExamDao exams = new ExamDaoImpl();
								List<exam> list2 = exams.getAllExam();

								int num_exam = 0;
								for (exam exam : list2) {
									num_exam++;
								}
							%>
							<!-- 所有考试报名总人数 -->
							<%
								SignUpDao signd = new SignUpDaoImpl();
								List<signup> signs = signd.getAllsignup();

								int sign_num = 0;
								for (signup s1 : signs) {
									sign_num++;
								}
							%>
							<!-- 管理员总数 -->
							<%
								AdminDao admind = new AdminDaoImpl();
								List<admin> admins = admind.getAllAdmins();

								int admin_num = 0;
								for (admin a1 : admins) {
									admin_num++;
								}
							%>

							<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
								data-wow-delay="0.5s">
								<div class="fact-item text-center">
									<div class="fact-icon">
										<i class="im im-icon-Trophy"></i>
									</div>
									<span data-to="120"><%=num_exam%></span>
									<p>考试数量</p>
								</div>
							</div>

							<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
								data-wow-delay="0.8s">
								<div class="fact-item text-center">
									<div class="fact-icon">
										<i class="im im-icon-Trophy"></i>
									</div>
									<span data-to="120"><%=num_user%></span>
									<p>用户数量</p>
								</div>
							</div>

							<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
								data-wow-delay="1.1s">
								<div class="fact-item text-center last">
									<div class="fact-icon">
										<i class="im im-icon-Trophy"></i>
									</div>
									<span data-to="2500"><%=sign_num%></span>
									<p>报名人数</p>
								</div>
							</div>

							<div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft"
								data-wow-delay="1.3s">
								<div class="fact-item text-center last">
									<div class="fact-icon">
										<i class="im im-icon-Trophy"></i>
									</div>
									<span data-to="40"><%=admin_num%></span>
									<p>管理员数量</p>
								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
			<!--




		
		
		

		<!-- Copyright -->
			<div class="row">
				<div class="col-md-12">
					<div class="copyrights">© 2018 pp Rights Reserved.</div>
				</div>
			</div>

			<!-- Back To Top Button -->
			<div id="backtotop">
				<a href="#"></a>

			</div>

			<!-- Wrapper / End -->


			<!-- Scripts
================================================== -->
			<script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>
			<script type="text/javascript" src="js/mmenu.min.js"></script>
			<script type="text/javascript" src="js/chosen.min.js"></script>
			<script type="text/javascript" src="js/slick.min.js"></script>
			<script type="text/javascript" src="js/rangeslider.min.js"></script>
			<script type="text/javascript" src="js/magnific-popup.min.js"></script>
			<script type="text/javascript" src="js/waypoints.min.js"></script>
			<script type="text/javascript" src="js/counterup.min.js"></script>
			<script type="text/javascript" src="js/jquery-ui.min.js"></script>
			<script type="text/javascript" src="js/tooltips.min.js"></script>
			<script type="text/javascript" src="js/custom.js"></script>



			<!-- REVOLUTION SLIDER SCRIPT -->
			<script type="text/javascript" src="js/themepunch.tools.min.js"></script>
			<script type="text/javascript" src="js/themepunch.revolution.min.js"></script>

			<script type="text/javascript">
				var tpj = jQuery;
				var revapi4;
				tpj(document)
						.ready(
								function() {
									if (tpj("#rev_slider_4_1").revolution == undefined) {
										revslider_showDoubleJqueryError("#rev_slider_4_1");
									} else {
										revapi4 = tpj("#rev_slider_4_1")
												.show()
												.revolution(
														{
															sliderType : "standard",
															jsFileLocation : "scripts/",
															sliderLayout : "auto",
															dottedOverlay : "none",
															delay : 9000,
															navigation : {
																keyboardNavigation : "off",
																keyboard_direction : "horizontal",
																mouseScrollNavigation : "off",
																onHoverStop : "on",
																touch : {
																	touchenabled : "on",
																	swipe_threshold : 75,
																	swipe_min_touches : 1,
																	swipe_direction : "horizontal",
																	drag_block_vertical : false
																},
																arrows : {
																	style : "zeus",
																	enable : true,
																	hide_onmobile : true,
																	hide_under : 600,
																	hide_onleave : true,
																	hide_delay : 200,
																	hide_delay_mobile : 1200,
																	tmp : '<div class="tp-title-wrap"></div>',
																	left : {
																		h_align : "left",
																		v_align : "center",
																		h_offset : 40,
																		v_offset : 0
																	},
																	right : {
																		h_align : "right",
																		v_align : "center",
																		h_offset : 40,
																		v_offset : 0
																	}
																},
																bullets : {
																	enable : false,
																	hide_onmobile : true,
																	hide_under : 600,
																	style : "hermes",
																	hide_onleave : true,
																	hide_delay : 200,
																	hide_delay_mobile : 1200,
																	direction : "horizontal",
																	h_align : "center",
																	v_align : "bottom",
																	h_offset : 0,
																	v_offset : 32,
																	space : 5,
																	tmp : ''
																}
															},
															viewPort : {
																enable : true,
																outof : "pause",
																visible_area : "80%"
															},
															responsiveLevels : [
																	1200, 992,
																	768, 480 ],
															visibilityLevels : [
																	1200, 992,
																	768, 480 ],
															gridwidth : [ 1180,
																	1024, 778,
																	480 ],
															gridheight : [ 640,
																	500, 400,
																	300 ],
															lazyType : "none",
															parallax : {
																type : "mouse",
																origo : "slidercenter",
																speed : 2000,
																levels : [ 2,
																		3, 4,
																		5, 6,
																		7, 12,
																		16, 10,
																		25, 47,
																		48, 49,
																		50, 51,
																		55 ],
																type : "mouse",
															},
															shadow : 0,
															spinner : "off",
															stopLoop : "off",
															stopAfterLoops : -1,
															stopAtSlide : -1,
															shuffle : "off",
															autoHeight : "off",
															hideThumbsOnMobile : "off",
															hideSliderAtLimit : 0,
															hideCaptionAtLimit : 0,
															hideAllCaptionAtLilmit : 0,
															debugMode : false,
															fallbacks : {
																simplifyAll : "off",
																nextSlideOnWindowFocus : "off",
																disableFocusListener : false,
															}
														});
									}
								}); /*ready*/

				//	var img = $('.team_people');
				//	for(var i=0;i<img.length;i++)
				//	{
				//		$(img[i]).mouseover(function(){
				//			console.log(i);
				//		});
				//	}
			</script>


			<!-- SLIDER REVOLUTION 5.0 EXTENSIONS
	(Load Extensions only on Local File Systems !
	The following part can be removed on Server for On Demand Loading) -->
			<script type="text/javascript"
				src="js/extensions/revolution.extension.actions.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.carousel.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.kenburn.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.layeranimation.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.migration.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.navigation.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.parallax.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.slideanims.min.js"></script>
			<script type="text/javascript"
				src="js/extensions/revolution.extension.video.min.js"></script>
</body>
</html>
