<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.impl.*" %>
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

</head>

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
								<li><a class="current" href="allexamUser.jsp?name=<%=loginName%>">考试报名</a></li>

								<li><a href="person.jsp?user_id=<%= user_id %>&name=<%=loginName%>">个人中心</a></li>
							</ul>
						</nav>

						<div class="clearfix"></div>
						<!-- Main Navigation / End -->

					</div>
					<!-- Left Side Content / End -->

					
			<div class="right-side">
				<div class="header-widget">
					<a href="/GradeMan/userCheckLogout" class="sign-in"><i class="sl sl-icon-login"></i>欢迎您！点击退出</a>
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

						<h2>考试报名</h2>
						<span>今年系统中所有的考试</span>

						<!-- Breadcrumbs -->
						<nav id="breadcrumbs" class="clearfix">
							<ul>
								<li><a href="userIndexPer.jsp">首页</a></li>
								<li>考试报名</li>
							</ul>
						</nav>

					</div>

				</div>
			</div>
		</div>
		<!-- Content
================================================== -->
		<div class="container">
			<div class="row">

                <div class="col-md-6">
                   <div class="main-search-input gray-style margin-top-0 margin-bottom-10">

					<div class="main-search-input-item" style="border-right: none;">
						<select data-placeholder="All Categories" class="chosen-select" onchange="window.open(options[selectedIndex].value,'_blank')">
							<option value="allexamUser.jsp">考试状态</option>
							<option value="signNo.jsp">报名未开始</option>
							<option value="signNing.jsp">报名进行中</option>
							<option value="signEnd.jsp">报名结束待考试</option>
							<option value="examEnd.jsp">考试结束</option>
						</select>
					</div>

				</div>
                
                </div>
				<!-- Search -->
				<div class="col-md-6">
					<form action="/GradeMan/SearchExamUser">
						<div
							class="main-search-input gray-style margin-top-0 margin-bottom-10">

							<div class="main-search-input-item">
								<input type="text" placeholder="请填写考试名称" value="" name="exam_name"/>
							</div>

							<button class="button">查找考试</button>
						</div>
					</form>

				</div>
				<!-- Search Section / End -->

				<br> <br> <br> <br> <br> <br>

				<div class="row">

					<%
						ExamDao exam = new ExamDaoImpl();

									List<exam> list = exam.getAllExam();

									for (exam exam1 : list) {
					%>


					<div class="col-lg-6 col-md-12 people_show" style="padding-bottom: 40px;!important">
						<div class="avatar">
							<img src="images/place_detail1.jpg" alt="" style="margin-left: 20px;">
						</div>
						<div class="comment-content">
							<div class="arrow-comment"></div>
							<div class="comment-by">
								<strong><%=exam1.getExam_name()%></strong>
							</div>
							<div class="">
								<strong>考试时间：<%=exam1.getTime().toString().substring(0, 19) == null ? ' '
						: exam1.getTime().toString().substring(0, 19)%></strong>
							</div>
							<div class="comment-by">
								<strong>考试状态：<%=exam1.getStatus() %></strong>
							</div>
							<p><%=exam1.getIntroduce()%></p>

							
							<%
				              String username = (String)session.getAttribute("loginName");
				            %>
				    
							<form
								action="detailexamUser.jsp?exam_id=<%=exam1.getExam_id()%>&username=<%=username %>"
								method="post" style="display: inline">

								<button type="submit" class="btn btn-success button border margin-top-10" value="查看" style="font-weight:500">
									<i class="sl sl-icon-plus"></i>查看
								</button>
								
							</form>
						</div>
					</div>





					<%
						}
					%>







				</div>

				<!-- Pagination -->
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12">
						<!-- Pagination -->
						<div class="pagination-container margin-top-20 margin-bottom-40">
							<nav class="pagination" style="padding-left: 470px">
								<ul>
									<li><a href="#" class="current-page">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!-- Pagination / End -->

			</div>

		</div>
	</div>

	<!-- Copyright -->
	<div class="row">
		<div class="col-md-12">
			<div class="copyrights">© 2018 pp.</div>
		</div>
	</div>
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


</body>
</html>
