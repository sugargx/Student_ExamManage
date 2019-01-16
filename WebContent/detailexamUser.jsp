<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="stu.gx.dao.impl.*"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="stu.gx.bean.*"%>

<%@ page import="java.util.List"%>
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
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<script>
	function check(form) {
		if (form.name.value == "") {
			alert("请输入姓名!");
			form.name.focus();
			return false;
		} else if (form.identify.value == "") {
			alert("请输入身份证号!");
			form.identify.focus();
			return false;
		} else if (form.email.value == "") {
			alert("请输入邮箱!");
			form.email.focus();
			return false;
		} else
			return true;

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

								<li><a href="userIndexPer.jsp">首页</a></li>

								<li><a href="about.jsp">关于系统</a></li>



								<li><a href="contact.jsp">联系我们</a></li>
								<%
									String loginName = (String) session.getAttribute("loginName");
									UserDao userd = new UserDaoImpl();
									user u1 = userd.getUserbyUN(loginName);
									int user_id = u1.getUser_id();
								%>
								<li><a class="current"
									href="allexamUser.jsp?name=<%=loginName%>">考试报名</a></li>

								<li><a
									href="person.jsp?user_id=<%=user_id%>&name=<%=loginName%>">个人中心</a></li>
							</ul>
						</nav>

						<div class="clearfix"></div>
						<!-- Main Navigation / End -->

					</div>
					<!-- Left Side Content / End -->

					<div class="right-side">
						<div class="header-widget">
							<a href="/GradeMan/userCheckLogout" class="sign-in"><i
								class="sl sl-icon-login"></i>欢迎您！点击退出</a>
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

						<h2>考试详情</h2>
						<span>仔细阅读考试详情</span>

						<!-- Breadcrumbs -->
						<nav id="breadcrumbs">
							<ul>
								<li><a href="userIndexPer.jsp">首页</a></li>
								<li><a href="allexamUser.jsp">考试报名</a></li>
								<li>考试详情</li>
							</ul>
						</nav>

					</div>
				</div>
			</div>
		</div>

		<!-- Content
    ================================================== -->
		<div class="container">

			<!-- Blog Posts -->
			<div class="blog-page">
				<div class="row">

					<div class="col-lg-2 col-md-2"></div>


					<!-- Post Content -->
					<div class="col-lg-8 col-md-8 padding-right-30">


						<!-- Blog Post -->
						<div class="blog-post single-post">



							<!-- Content -->
							<div class="post-content">

								<%
									int exam_id = Integer.parseInt(request.getParameter("exam_id"));
									ExamDao examd = new ExamDaoImpl();
									exam e = examd.getOneExam(exam_id);
								%>




								<h3><%=e.getExam_name()%></h3>

								<ul class="post-meta">
									<li>考试开始报名时间：<%=e.getTime_begin().toString().substring(0, 19) == null ? ' '
					: e.getTime_begin().toString().substring(0, 19)%> -考试结束报名时间：<%=e.getTime_end().toString().substring(0, 19) == null ? ' '
					: e.getTime_end().toString().substring(0, 19)%></li>
								</ul>

								<p>
									考试时间：<%=e.getTime().toString().substring(0, 19) == null ? ' ' : e.getTime().toString().substring(0, 19)%></p>

								<p>
									考试状态：<%=e.getStatus()%></p>

								<p>
									已报名人数：<%=e.getAll_num()%></p>

								<div class="post-quote">
									<span class="icon"></span>
									<blockquote>
										考试简介：<%=e.getIntroduce()%></blockquote>
								</div>


								<div class="clearfix"></div>

								<%
									SignUpDao signD = new SignUpDaoImpl();
									List<signup> allsignup = signD.getAllsignup();
									signup s1 = null;
								%>

								<%
									if (e.getStatus().equals("报名进行中")) {

										int flag1 = 1;
										for (signup su1 : allsignup) {
											if (su1.getExam_id() == e.getExam_id() && su1.getUser_id() == user_id) {
												flag1 = 0;
												break;
											}
										}

										if (flag1 == 0) {
								%>

								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									style="font-weight: 500" disabled>您已报名该考试，请等报名结束后下载准考证</button>

								<%
									} else {
								%>

								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									data-toggle="modal" data-target="#myModal"
									style="font-weight: 500">报名考试</button>

								<%
									}

									}
								%>


								<%
									if (e.getStatus().equals("报名未开始")) {
								%>
								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									data-toggle="modal" data-target="#myModal"
									style="font-weight: 500" disabled>敬请等待报名开始</button>

								<%
									}
								%>


								<%
									if (e.getStatus().equals("报名结束待考试")) {
										int flag2 = 1;
										for (signup su1 : allsignup) {
											if (su1.getExam_id() == e.getExam_id() && su1.getUser_id() == user_id) {
												flag2 = 0;
												break;
											}
										}

										if (flag2 == 0) {
								%>
								<a href="examCard.jsp?user_id=<%=user_id%>&exam_id=<%=exam_id%>">
									<button
										class="btn button btn-primary btn-lg button border margin-top-10"
										style="font-weight: 500">查看准考证</button>
								</a>

								<%
									} else {
								%>
								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									data-toggle="modal" data-target="#myModal"
									style="font-weight: 500" disabled>报名已结束</button>

								<%
									}

									}
								%>

								<%
									if (e.getStatus().equals("考试结束")) {
										int flag3 = 1;

										for (signup su1 : allsignup) {
											if (su1.getExam_id() == e.getExam_id() && su1.getUser_id() == user_id) {
												s1 = su1;
												flag3 = 0;
												break;
											}
										}

										if (flag3 == 0) {
								%>
								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									data-toggle="modal" data-target="#myScore"
									style="font-weight: 500">查看成绩</button>


								<%
									} else {
								%>
								<button
									class="btn button btn-primary btn-lg button border margin-top-10"
									data-toggle="modal" data-target="#myModal"
									style="font-weight: 500" disabled>考试已结束无法报名</button>

								<%
									}

									}
								%>


								<!-- 获取url传入的考试id和用户名 -->
								<%
									String examid = request.getParameter("exam_id");
									String username = request.getParameter("username");
								%>

								<!-- 填写报名信息 -->
								<form
									action="/GradeMan/userSignExam?exam_id=<%=examid%>&username=<%=username%>"
									name="forminfo" method="post">
									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">
														请填写报名信息 <span style="color: red; font-size: 15px">*为必填项</span>
													</h4>
												</div>
												<div class="modal-body" style="text-algin: center;">

													<form method="post" class="register"
														action="/GradeMan/userSignExam?exam_id=<%=e.getExam_id()%>&exam_name=<%=e.getExam_name()%>"
														name="form">
														<p class="form-row form-row-wide">
															<label for="username" style="display: block;">姓名:
																<span style="color: red">*</span> <i
																class="im im-icon-Male"></i> <input type="text"
																class="input-text" name="name" id="name" value="" />
															</label>
														</p>

														<p class="form-row form-row-wide">
															<label for="sex" style="display: block;">性别: <i
																class="im im-icon-Male"></i> <label><input
																	name="sex" type="radio" value="男" checked />男 </label> <label><input
																	name="sex" type="radio" value="女" />女 </label>
															</label>
														</p>

														<p class="form-row form-row-wide">

															<label for="identify" style="display: block">身份证号:
																<span style="color: red">*</span> <i
																class="im im-icon-Lock-2"></i> <input class="input-text"
																type="text" name="identify" id="identify" value="" />
															</label>
														</p>

														<p class="form-row form-row-wide">

															<label for="email" style="display: block">邮箱: <span
																style="color: red">*</span> <i class="im im-icon-Lock-2"></i>
																<input class="input-text" type="email" name="email"
																id="email" value="" />
															</label>
														</p>

													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">关闭</button>
													<button type="submit" class="btn btn-primary"
														onclick="return check(form)">提交更改</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->


									</div>

								</form>


								<!-- 查看成绩 -->
								<div class="modal fade" id="myScore" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="myModalLabel">成绩为：</h4>
											</div>
											<div class="modal-body" style="text-algin: center;">
												<%
													if (s1 != null) {
												%>
												<%=s1.getScore()%>
												<%
													}
												%>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">确认</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div>
								<!-- Blog Post / End -->

							</div>
							<!-- Blog Post / End -->

						</div>
						<!-- Content / End -->



					</div>

					<div class="col-lg-2 col-md-2"></div>


				</div>


				<!-- Copyright -->
				<div class="row">
					<div class="col-md-12">
						<div class="copyrights">© 2018 pp.</div>
					</div>
				</div>

			</div>

		</div>
		<!-- Footer / End -->

		<!-- Back To Top Button -->
		<div id="backtotop">
			<a href="#"></a>
		</div>

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
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script
		src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>