<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

		xhr.open("POST", "/GradeMan/userCheckLogin?username=" + username
				+ "&password=" + password);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		var username = txtUserName.value;
		xhr.send("username=" + username + "password=" + password);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				//真正的处理
				if (xhr.status == 200 || xhr.status == 304) {
					//服务器正确返回
					var data = xhr.responseText;//服务器返回的数据
					if (data == "1")//登录成功，跳转到主页
					{
						document.getElementById("divcheck").innerHTML = "登录成功";
						//response.setHeader("refresh", "0;url=adminIndex.jsp");
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

						<!-- Logo -->
						<div id="logo" class="pull-left">
							<a href="index.html"><img src="images/logo.jpg" alt=""></a>
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

								<li><a class="current" href="userIndexPer.jsp">首页</a></li>

								<li><a href="about.jsp">关于系统</a></li>


								<li><a href="contact.jsp">联系我们</a></li>
								<%
									String loginName = (String) session.getAttribute("loginName");
								    UserDao userd = new UserDaoImpl();
								    user u1 = userd.getUserbyUN(loginName);
								    int user_id = u1.getUser_id();
								%>
								<li><a href="allexamUser.jsp?name=<%=loginName%>">考试报名</a></li>

								<li><a href="person.jsp?user_id=<%=user_id %>&name=<%=loginName%>">个人中心</a></li>

							</ul>
						</nav>

						<div class="clearfix"></div>
						<!-- Main Navigation / End -->

					</div>
					<!-- Left Side Content / End -->

					<div class="right-side">
						<div class="header-widget">
							<a href="/GradeMan/userCheckLogout" class="sign-in"><i
								class="sl sl-icon-login"></i>欢迎您！ 点击退出！</a>
						</div>
					</div>

				</div>
			</div>
			<!-- Header / End -->

		</header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->



		<!-- Slider
================================================== -->

		<!-- Revolution Slider -->
		<div id="rev_slider_4_1_wrapper"
			class="rev_slider_wrapper fullwidthbanner-container"
			data-alias="classicslider1"
			style="margin: 0px auto; background-color: transparent; padding: 0px; margin-top: 0px; margin-bottom: 0px;">

			<!-- 5.0.7 auto mode -->
			<div id="rev_slider_4_1" class="rev_slider home fullwidthabanner"
				style="display: none;" data-version="5.0.7">
				<ul>

					<!-- Slide  -->
					<li data-index="rs-1" data-transition="fade"
						data-slotamount="default" data-easein="Power4.easeInOut"
						data-easeout="Power4.easeInOut" data-masterspeed="1000"
						data-rotate="0" data-fstransition="fade" data-fsmasterspeed="800"
						data-fsslotamount="7" data-saveperformance="off">
						<!-- Background --> <img src="images/slider1.jpg" alt=""
						data-bgposition="center center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
						data-no-retina data-kenburns="on" data-duration="12000"
						data-ease="Linear.easeNone" data-scalestart="100"
						data-scaleend="100" data-rotatestart="0" data-rotateend="0"
						data-offsetstart="0 0" data-offsetend="0 0"> <!-- Caption-->
						<div
							class="tp-caption centered custom-caption-2 tp-shape tp-shapewrapper tp-resizeme rs-parallaxlevel-0"
							id="slide-2-layer-2"
							data-x="['center','center','center','center']"
							data-hoffset="['0']"
							data-y="['middle','middle','middle','middle']"
							data-voffset="['0']" data-width="['640','640', 640','420','320']"
							data-height="auto" data-whitespace="nowrap"
							data-transform_idle="o:1;"
							data-transform_in="y:0;opacity:0;s:1000;e:Power2.easeOutExpo;s:400;e:Power2.easeOutExpo"
							data-transform_out=""
							data-mask_in="x:0px;y:[20%];s:inherit;e:inherit;"
							data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
							data-start="1000" data-responsive_offset="on">

							<!-- Caption Content -->
							<div class="R_title margin-bottom-15" id="slide-2-layer-1"
								data-x="['left','center','center','center']"
								data-hoffset="['0','0','40','0']"
								data-y="['middle','middle','middle','middle']"
								data-voffset="['-40','-40','-20','-80']"
								data-fontsize="['42','36', '32','36','22']"
								data-lineheight="['70','60','60','45','35']"
								data-width="['640','640', 640','420','320']" data-height="none"
								data-whitespace="normal" data-transform_idle="o:1;"
								data-transform_in="y:-50px;sX:2;sY:2;opacity:0;s:1000;e:Power4.easeOut;"
								data-transform_out="opacity:0;s:300;" data-start="600"
								data-splitin="none" data-splitout="none" data-basealign="slide"
								data-responsive_offset="off" data-responsive="off"
								style="z-index: 6; color: #fff; letter-spacing: 0px; font-weight: 600;">
								认真备考，文明考试</div>

							<div class="caption-text">文明考风，诚信考试。</div>
						</div>

					</li>

					<!-- Slide  -->
					<li data-index="rs-2" data-transition="fade"
						data-slotamount="default" data-easein="Power4.easeInOut"
						data-easeout="Power4.easeInOut" data-masterspeed="1000"
						data-rotate="0" data-fstransition="fade" data-fsmasterspeed="800"
						data-fsslotamount="7" data-saveperformance="off">
						<!-- Background --> <img src="images/slider2.jpg" alt=""
						data-bgposition="center center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
						data-no-retina data-kenburns="on" data-duration="12000"
						data-ease="Linear.easeNone" data-scalestart="100"
						data-scaleend="112" data-rotatestart="0" data-rotateend="0"
						data-offsetstart="0 0" data-offsetend="0 0"> <!-- Caption-->
						<div
							class="tp-caption centered custom-caption-2 tp-shape tp-shapewrapper tp-resizeme rs-parallaxlevel-0"
							id="slide-2-layer-2"
							data-x="['center','center','center','center']"
							data-hoffset="['0']"
							data-y="['middle','middle','middle','middle']"
							data-voffset="['0']" data-width="['640','640', 640','420','320']"
							data-height="auto" data-whitespace="nowrap"
							data-transform_idle="o:1;"
							data-transform_in="y:0;opacity:0;s:1000;e:Power2.easeOutExpo;s:400;e:Power2.easeOutExpo"
							data-transform_out=""
							data-mask_in="x:0px;y:[20%];s:inherit;e:inherit;"
							data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
							data-start="1000" data-responsive_offset="on">

							<!-- Caption Content -->
							<div class="R_title margin-bottom-15" id="slide-2-layer-3"
								data-x="['center','center','center','center']"
								data-hoffset="['0','0','0','0']"
								data-y="['middle','middle','middle','middle']"
								data-voffset="['-40','-40','-20','-80']"
								data-fontsize="['42','36', '32','36','22']"
								data-lineheight="['70','60','60','45','35']"
								data-width="['640','640', 640','420','320']" data-height="none"
								data-whitespace="normal" data-transform_idle="o:1;"
								data-transform_in="y:-50px;sX:2;sY:2;opacity:0;s:1000;e:Power4.easeOut;"
								data-transform_out="opacity:0;s:300;" data-start="600"
								data-splitin="none" data-splitout="none" data-basealign="slide"
								data-responsive_offset="off" data-responsive="off"
								style="z-index: 6; color: #fff; letter-spacing: 0px; font-weight: 600;">身份信息不容忽视</div>

							<div class="caption-text">沉着冷静，周密思考，认真严谨，仔细答卷。</div>
						</div>

					</li>

				</ul>
				<div class="tp-static-layers"></div>

			</div>
		</div>
		<!-- Revolution Slider / End -->


		<!-- Content
================================================== -->
		<!-- Service Begin-->
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<h3 class="headline centered margin-top-80">
						报名流程 <span class="margin-top-25">Application Procedure</span>
					</h3>
				</div>
			</div>

			<div class="row icons-container">
				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2 with-line">
						<i class="fa fa-registered"></i>
						<h3>注册系统</h3>
						<p></p>
					</div>
				</div>

				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2 with-line">
						<i class="fa fa-sign-in"></i>
						<h3>登录系统</h3>
						<p></p>
					</div>
				</div>

				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2">
						<i class="fa fa-bookmark"></i>
						<h3>查找考试</h3>
						<p></p>
					</div>
				</div>
			</div>

			<div class="row icons-container">
				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2 with-line">
						<i class="fa fa-star-half-o"></i>
						<h3>填写报名信息</h3>
						<p></p>
					</div>
				</div>

				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2 with-line">
						<i class="fa fa-eye"></i>
						<h3>等待报名审核</h3>
						<p></p>
					</div>
				</div>

				<!-- Stage -->
				<div class="col-md-4">
					<div class="icon-box-2">
						<i class="fa fa-mortar-board "></i>
						<h3>考试查询成绩</h3>
						<p></p>
					</div>
				</div>
			</div>
		</div>
		<!-- Service / End -->


		<section
			class="fullwidth margin-top-65 padding-top-75 padding-bottom-70"
			data-background-color="#f8f8f8">

			<div class="container">
				<div class="row">

					<div class="col-md-12">
						<h3 class="headline centered margin-bottom-45">
							选择考试 <span class="margin-top-25">Examinations</span>
						</h3>
					</div>

					<div class="col-md-12">
						<div class="simple-slick-carousel dots-nav">

							<%
								ExamDao examd = new ExamDaoImpl();
							    List<exam> exmas = examd.getStatusExam("报名中");
							    for(exam e1:exmas){
							    	
							%>
							<!-- News Item -->
							<div class="carousel-item">
								<a href="index_newLater.html" class="listing-item-container">
									<div class="listing-item">
										<img src="images/exam1.png" alt="">
										<div class="listing-item-content">
											<h3><%=e1.getExam_name() %></h3>
											<span><%=e1.getIntroduce() %></span>
										</div>
									</div>
								</a>
							</div>
							<!-- News Item / End -->
							<%
							    }
							%>
						</div>

					</div>

					<div class="col-md-12 centered-content">
						<a href="allexamUser.jsp" class="button border margin-top-10">查看更多</a>
					</div>

				</div>
		</section>
		<!-- Fullwidth Section / End -->


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
																1200, 992, 768,
																480 ],
														visibilityLevels : [
																1200, 992, 768,
																480 ],
														gridwidth : [ 1180,
																1024, 778, 480 ],
														gridheight : [ 640,
																500, 400, 300 ],
														lazyType : "none",
														parallax : {
															type : "mouse",
															origo : "slidercenter",
															speed : 2000,
															levels : [ 2, 3, 4,
																	5, 6, 7,
																	12, 16, 10,
																	25, 47, 48,
																	49, 50, 51,
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
