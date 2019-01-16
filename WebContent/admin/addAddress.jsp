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
				
					<li class=""><a href="adminIndex.jsp">
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
					
					<li class="dropdown active"><a href="room_address.jsp">
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
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3>请填写待增加的考场地点</h3>
						</div>
						<div class="card-body" style="padding: 30px 15%">

							<form class="form form-horizontal" method="post"
								action="/GradeMan/manageAddress" name="form1">
								<input type="hidden" value="launch" name="action" />

								<div class="form-group">
									<label class="col-md-3">地点名称<span style="color: red">*（不可重复）</span></label>
									<div class="col-md-9 col-sm-12">
										<input type="text" class="form-control" value=""
											name="address_name" id="address_name" placeholder="请输入考场地点名称"  required>
									</div>
								</div>

								<div class="form-footer">
									<div class="form-group">
										<div class="col-md-9 col-md-offset-3">
											<input type="submit" class="btn btn-primary" value="确定增加"
												onclick="return checkTime1(form1)"> <input
												type="button" class="btn btn-default" value="取消"
												onclick="history.go(-1)">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>



			

			<script type="text/javascript" src="../js/vendor.js"></script>
			<script type="text/javascript" src="../js/app.js"></script>
</body>

</html>
