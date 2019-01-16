<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="stu.gx.dao.impl.*"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.ExamDao"%>
<%@ page import="stu.gx.bean.exam"%>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

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

					<li class=""><a href="adminIndex.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">首页</div>
					</a></li>

					<li class="dropdown active"><a href="launchExam.jsp">
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
						</div></li>

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
					</a></li>

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
			<div class="row">

				<div class="col-lg-6 col-md-6 col-sm-6 ">
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="true">
							考试状态筛选考试 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li><a href="signNo.jsp">报名未开始</a></li>

							<li role="separator" class="divider"></li>
							<li><a href="signNing.jsp">报名进行中</a></li>

							<li role="separator" class="divider"></li>
							<li><a href="signEnd.jsp">报名结束待考试</a></li>

							<li role="separator" class="divider"></li>
							<li><a href="examEnd.jsp">考试结束</a></li>
						</ul>
					</div>
				</div>

				<!-- 搜索 -->
				<div class="col-lg-6 col-md-6 col-sm-6 city_type">
					<form method="get" action="/GradeMan/SearchExam"
						style="display: flex;">

						<input type="text" class="form-control" id="exam_id"
							placeholder="请输入考试号查询" name="exam_id"
							style="background-color: rgb(255, 255, 255); margin-bottom: 0px;" />

						<input class="btn btn-primary btn-sm" type="submit" name="sub"
							value="查询" style="margin-left: 30px;" />
					</form>
				</div>


				<div class="col-md-12 col-sm-12">
					<div class="card">
						<div class="card-header">
							<h3>全部考试列表</h3>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<th>考试号</th>
									<th>考试名称</th>
									<th>考试时间</th>
									<th>考试状态</th>
									<th>报名人数</th>
									<th>审核通过人数</th>
									<th>操作</th>

								</thead>
								<tbody>
								<%
						
									int exam_id = Integer.parseInt(request.getParameter("exam_id"));
									ExamDao Edao = new ExamDaoImpl();
									exam exam1 = Edao.getOneExam(exam_id);
									if(exam_id == 0){
										out.println("<script>alert(\"暂无此考试！\")</script>");
									}
									else{
									%>
									<tr>
												<td><%=exam1.getExam_id() %></td>

												<td><%=exam1.getExam_name() %></td>

												<td><%=exam1.getTime().toString().substring(0, 19) %> </td>

												<td><%=exam1.getStatus() %></td>
												<td><%=exam1.getAll_num() %></td>
												<td><%=exam1.getSign_num() %></td>


												<td>
													<form action="detailexam.jsp?exam_id=<%=exam_id %>"
														method="post" style="display: inline">

														<input type="submit" class="btn btn-primary btn-xs"
															value="查看">
													</form>

													<form
														action="editexam_detail.jsp?exam_id=<%=exam_id %>"
														method="post" style="display: inline">


														<input type="submit" class="btn btn-success btn-xs"
															value="编辑">

													</form>

													<form
														action="/GradeMan/delExam?exam_id=<%=exam_id %>"
														method="post" style="display: inline">
														<input type="submit" class="btn btn-warning btn-xs"
															onclick="return confirm('您确定要删除吗？')" value="删除">
													</form>
												</td>
										
									</tr>
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
