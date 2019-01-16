<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="stu.gx.jdbc.*"%>
<%@ page import="stu.gx.dao.ExamDao"%>
<%@ page import="stu.gx.bean.exam"%>
<%@ page import="stu.gx.dao.impl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

					<li class=""><a href="adminNextIndex.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">首页</div>
					</a></li>

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
						</div></li>


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
						</div></li>

					<li class="dropdown active"><a href="arrangeScore.jsp">
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
						</div></li>

					<li class="dropdown"><a href="signAudit.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">报名审核</div>
					</a></li>


				
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
							<li class="navbar-title">欢迎您管理员</li>
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

			<div class="row">

				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<h3>报名此考试审核通过的全部学生</h3>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<th>准考证号</th>
									<th>考试名称</th>
									<th>考试时间</th>
									<th>姓名</th>
									<th>成绩</th>
								</thead>
								<tbody>
									<%
										int exam_id = Integer.parseInt(request.getParameter("exam_id"));

										SignUpDao signd = new SignUpDaoImpl();
										List<signup> signs = signd.getSignupExam(exam_id);
										for (signup signup1 : signs) {
											if (signup1.getStatus().equals("通过")) {
									%>

									<tr>
										<%
											ExamDao examd = new ExamDaoImpl();
													exam exam1 = examd.getOneExam(exam_id);
										%>
										<td><%=signup1.getExamcard_number()%></td>
										<td><%=exam1.getExam_name()%></td>
										<td><%=exam1.getTime().toString().substring(0, 19) == null ? ' '
							: exam1.getTime().toString().substring(0, 19)%></td>

										<%
											UserDao userd = new UserDaoImpl();
													user user1 = userd.getUserbyID(signup1.getUser_id());
										%>

										<td><%=user1.getName()%></td>

										<td><%=signup1.getScore() == -1 ? "待录入成绩" : signup1.getScore()%></td>

										<td>
											<form
												action="/GradeMan/arrangeScoreNext?exam_id=<%=exam_id%>&user_id=<%=signup1.getUser_id()%>"
												method="post">
												<div class="col-md-6">
													<input type="number" class="form-control"
														value="<%=signup1.getScore()%>" name="score" id="score"
														placeholder="">
												</div>
												<div class="col-md-6">
													<input type="submit" class="btn btn-primary" value="更新成绩">

												</div>

											</form>
										</td>

									</tr>


									<%
										}
									%>

									<%
										}
									%>
								
							</table>


						</div>





					</div>
				</div>
			</div>




			<footer class="app-footer">
				<div class="row">
					<div class="col-xs-12">
						<div class="footer-copyright">Copyright © 2018 PP</div>
					</div>
				</div>
			</footer>


		</div>

	</div>



	<script type="text/javascript" src="../js/vendor.js"></script>
	<script type="text/javascript" src="../js/app.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>


</body>

</html>




</body>
</html>