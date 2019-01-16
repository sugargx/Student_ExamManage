<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="stu.gx.dao.ExamDao" %>
<%@ page import="stu.gx.bean.exam" %>
<%@ page import="stu.gx.dao.impl.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="../css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../css/flat-admin.css">
  <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

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
								<li><a href="allexam.jsp">查看考试</a></li>
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
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">考试信息</div>
        <div class="card-body" style="padding: 0;">
          <table class="table">
          
            <%
                      	int exam_id = Integer.parseInt(request.getParameter("exam_id"));
                                 ExamDao examd = new ExamDaoImpl();
                                 exam e = examd.getOneExam(exam_id);
                      %>
         
            <tbody>
            <tr>
              <td class="col-md-3">考试号</td>
              <td><%=e.getExam_id()%></td>
            </tr>
            <tr>
              <td class="col-md-3">考试名称</td>
              <td><%=e.getExam_name() ==null ? ' ':e.getExam_name()%></td>
            </tr>
            <tr>
              <td class="col-md-3">报名开始时间</td>
              <td><%=e.getTime_begin().toString().substring(0, 19)   ==null ? ' ':e.getTime_begin().toString().substring(0, 19) %></td>
            </tr>
             <tr>
              <td class="col-md-3">报名结束时间</td>
              <td><%=e.getTime_end().toString().substring(0, 19)   ==null ? ' ':e.getTime_end().toString().substring(0, 19) %></td>
            </tr>
             <tr>
              <td class="col-md-3">考试时间</td>
              <td><%=e.getTime().toString().substring(0, 19)  ==null ? ' ':e.getTime().toString().substring(0, 19) %></td>
            </tr>
            <tr>
              <td class="col-md-3">考试简介</td>
              <td><%=e.getIntroduce() ==null ? ' ':e.getIntroduce()%></td>
            </tr>
            <tr>
              <td class="col-md-3">考试状态</td>
              <td>
                                  <%=e.getStatus() ==null ? ' ':e.getStatus()%>
                              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <input type="button" class="btn btn-success" onclick="history.go(-1)" value="返回"
               style="margin-left: 20px;">
      </div>
    </div>
    
      <footer class="app-footer">
        <div class="row">
          <div class="col-xs-12">
            <div class="footer-copyright">
              Copyright © 2018 PP
            </div>
          </div>
        </div>
      </footer>


    </div>

  </div>



  <script type="text/javascript" src="../js/vendor.js"></script>
  <script type="text/javascript" src="../js/app.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

  <!-- (Optional) Latest compiled and minified JavaScript translation files -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>


</body>

</html>
