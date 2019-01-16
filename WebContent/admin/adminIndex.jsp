<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="stu.gx.jdbc.*"%>
<%@ page import="stu.gx.dao.ExamDao"%>
<%@ page import="stu.gx.bean.exam"%>
<%@ page import="stu.gx.dao.impl.*"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/vendor.css">
<link rel="stylesheet" type="text/css" href="../css/flat-admin.css">
<link rel="stylesheet" type="text/css"
	href="../css/font-awesome.min.css">

<style type="text/css">
th::after {
	content: "" !important;
}
</style>
</head>

<body>
	<div class="app app-default">
		<aside class="app-sidebar" id="sidebar" style="height: auto">
			<div class="sidebar-header">
				<a class="sidebar-brand" href="index.html"><span
					class="highlight">学生考试管理</span>系统</a>
				<!-- 返回网站首页 -->
				<button type="button" class="sidebar-toggle">
					<i class="fa fa-times"></i>
				</button>
			</div>
			<div class="sidebar-menu">
				<ul class="sidebar-nav">
				
					<li class="active"><a href="adminIndex.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">首页</div>
					        </a>
					</li>
					
					<li class="dropdown"><a href="launchExam.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">考试</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="launchExam.jsp">发布考试</a></li>
								<li><a href="editexam.jsp">管理考试</a></li>
							</ul>
						</div>
					</li>
					
					
					<li class="dropdown"><a href="addExamRoom.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">考场</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="addExamRoom.jsp">增加考场</a></li>
								<li><a href="manageExamRoom.jsp">管理考场</a></li>
								<li><a href="arrangeExamRoom.jsp">分配考场</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown"><a href="arrangeScore.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">成绩</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="arrangeScore.jsp">更新成绩</a></li>
								<li><a href="analyzeScore.jsp">分析成绩</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown"><a href="signAudit.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">报名审核</div>
					</a></li>
					
					
					<li class="dropdown"><a href="manageAdmin.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">管理员管理</div>
					</a>
					<div class="dropdown-menu">
							<ul>
								<li><a href="manageAdmin.jsp">添加管理员</a></li>
								<li><a href="showAdmin.jsp">管理管理员</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown"><a href="room_address.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">考场地点管理</div>
					</a>
					</li>
					
					<li class="dropdown"><a href="userall.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">查看用户</div>
					</a></li>
					
					
					
					
				</ul>
			</div>
			<div class="sidebar-footer">
				<ul class="menu">
					<li><a href="/" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-cogs" aria-hidden="true"></i>
					</a></li>
					<li><a href="#"><span
							class="flag-icon flag-icon-th flag-icon-squared"></span></a></li>
				</ul>
			</div>
		</aside>

		<script type="text/ng-template" id="sidebar-dropdown.tpl.html">
      <div class="dropdown-background">
        <div class="bg"></div>
      </div>
      <div class="dropdown-container">
      </div>
    </script>

		<div class="app-container">

			<nav class="navbar navbar-default" id="navbar">
				<div class="container-fluid">
					<div class="navbar-collapse collapse in">
						<ul class="nav navbar-nav navbar-mobile">
							<li>
								<button type="button" class="sidebar-toggle">
									<i class="fa fa-bars"></i>
								</button>
							</li>
							<li class="logo"><a class="navbar-brand" href="#"><span
									class="highlight">学生考试管理</span> 系统</a></li>
							<li>
								<button type="button" class="navbar-toggle">
									<img class="profile-img" src="../images/people.png">
								</button>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-left">
							<li class="navbar-brand"><img src="../images/logo.jpg"
								width="200px"></li>
							<li class="navbar-title">欢迎您超级管理员</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown profile"><a
								href="/html/pages/profile.html" class="dropdown-toggle"
								data-toggle="dropdown"> <img class="profile-img"
									src="../images/people.png">
									<div class="title">您好</div>
							</a>
								<div class="dropdown-menu">
									<div class="profile-info">
										<h4 class="username">管理员您好</h4>
									</div>
									<ul class="action">
										<li><a href="/GradeMan/adminCheckLogout"> 退出 </a></li>
									</ul>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- 主体部分 -->

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

            <!-- 管理员总数 -->
			<%
				AdminDao admind = new AdminDaoImpl();
				List<admin> admins = admind.getAllAdmins();

				int admin_num = 0;
				for (admin a1 : admins) {
					admin_num++;
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


			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<a class="card card-banner card-green-light" href="userall.jsp">
						<div class="card-body">
							<i class="icon fa fa-user-plus fa-4x"></i>
							<div class="content">
								<div class="title">总用户</div>
								<div class="value">
									<span class="sign"><%=num_user%>个</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<a class="card card-banner card-green-light" href="showAdmin.jsp">
						<div class="card-body">
							<i class="icon fa fa-users fa-4x"></i>
							<div class="content">
								<div class="title">管理员数</div>
								<div class="value">
									<span class="sign"><%=admin_num%>个</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				

				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<a class="card card-banner card-green-light" href="allexam.jsp">
						<div class="card-body">
							<i class="icon fa fa-bank fa-4x"></i>
							<div class="content">
								<div class="title">发布考试数</div>
								<div class="value">
									<span class="sign"><%=num_exam%>个</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<a class="card card-banner card-green-light" href="">
						<div class="card-body">
							<i class="icon fa fa-bank fa-4x"></i>
							<div class="content">
								<div class="title">报名人数</div>
								<div class="value">
									<span class="sign"><%=sign_num%>个</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				
				
			</div>


			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="section">
						<div class="section-title">管理员管理考试流程</div>
						<div class="section-body">
							<div class="step">
								<ul class="nav nav-tabs nav-justified" role="tablist">
									<li role="step"><a href="#step1" id="step1-tab" role="tab"
										data-toggle="tab" aria-controls="home" aria-expanded="true">
											<div class="icon fa  fa-bookmark"></div>
											<div class="heading">
												<div class="title">发布考试</div>
												<div class="description">Launch Exam</div>
											</div>
									</a></li>
									<li role="step" class="active"><a href="#step2" role="tab"
										id="step2-tab" data-toggle="tab" aria-controls="profile">
											<div class="icon fa fa-eye"></div>
											<div class="heading">
												<div class="title">审核学生报名</div>
												<div class="description">Auditng SignUp</div>
											</div>
									</a></li>
									<li role="step"><a href="#step3" role="tab" id="step3-tab"
										data-toggle="tab" aria-controls="profile">
											<div class="icon fa fa-check"></div>
											<div class="heading">
												<div class="title">分配考场</div>
												<div class="description">Distribution Examination Room</div>
											</div>
									</a></li>
									<li role="step"><a href="#step4" role="tab" id="step4-tab"
										data-toggle="tab" aria-controls="profile">
											<div class="icon fa fa-edit "></div>
											<div class="heading">
												<div class="title">录入成绩</div>
												<div class="description">Entry results</div>
											</div>
									</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane" id="step1">
										<b>步骤一</b> : 在考试之前，发布一个考试，输入考试基本信息。
									</div>
									<div role="tabpanel" class="tab-pane active" id="step2">
										<b>步骤二</b> : 在考试报名中或报名结束但未考试状态时，对报名考试的学生进行报名审核。审核结果发送至学生邮箱。
									</div>
									<div role="tabpanel" class="tab-pane" id="step3">
										<b>步骤三</b> : 在报名结束后，对报名结束的考试中报名审核成功的学生进行考场、座号的分配。
									</div>
									<div role="tabpanel" class="tab-pane" id="step4">
										<b>步骤四</b> : 在考试结束后，对考试的学生进行成绩的录入并分析整体成绩。
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>


			<script type="text/javascript" src="../js/vendor.js"></script>
			<script type="text/javascript" src="../js/app.js"></script>
</body>

</html>
