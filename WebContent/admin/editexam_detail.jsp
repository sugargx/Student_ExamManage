<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<style type="text/css">
th::after {
	content: "" !important;
}
</style>

<script>
function CompareDate(d1, d2) {
	return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g,
			"\/"))));
}
function checkTime1(form) {

	var myDate = new Date();
	var nowtime = myDate.toLocaleString('chinese', {
		hour12 : false
	});
	var nowtimeStyle = nowtime.replace('/', '-');
	var nowtimeStyle1 = nowtimeStyle.replace('/', '-');//本地时间

	var exam_name = form.exam_name.value;

	var time_begin = form.time_begin.value;
	var time_end = form.time_end.value;
	var time = form.time.value;

	var hh = time.replace('T', ' ');//考试时间
	var bb = time_begin.replace('T', ' ');//报名开始时间
	var ee = time_end.replace('T', ' ');//报名结束时间

	var status = form.exam_status.value;

	if (exam_name.length == 0) {
		alert("请填写考试名称!");
		form.exam_name.focus();
		return false;
	}
	if (time_begin.length == 0) {
		alert("请填写报名开始时间!");
		form.time_begin.focus();
		return false;
	}
	if (time_end.length == 0) {
		alert("请填写报名结束时间!");
		form.time_end.focus();
		return false;
	}
	if (time.length == 0) {
		alert("请填写考试时间!");
		form.time.focus();
		return false;
	}
	if (status.length == 0) {
		alert("请选择考试状态!");
		form.time.focus();
		return false;
	}

	if (CompareDate(nowtimeStyle1, hh)) {//考试时间不得早于本地时间
		alert("考试时间不能早于目前北京时间!");
		form.time.focus();
		return false;
	} 
	if (CompareDate(nowtimeStyle1, bb)) {//报名开始时间不得早于本地时间
		alert("报名开始时间不能早于目前北京时间!");
		form.time_begin.focus();
		return false;
	} 
	if (CompareDate(nowtimeStyle1, ee)) {//报名结束时间不得早于本地时间
		alert("报名结束时间不能早于目前北京时间!");
		form.time_end.focus();
		return false;
	}

	if (CompareDate(bb, ee)) {
		alert("报名结束时间不能早于报名开始时间!");
		form.time_end.focus();
		return false;
	} 
	if (CompareDate(ee, hh)) {
		alert("考试时间不能早于报名结束时间!");
		form.time.focus();
		return false;
	}

}
</script>
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
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3>修改考试</h3>
						</div>
						<div class="card-body">

							<%
								int exam_id = Integer.parseInt(request.getParameter("exam_id"));
								ExamDao examd = new ExamDaoImpl();
								exam e = examd.getOneExam(exam_id);
							%>

							<form action="/GradeMan/updateExam?exam_id=<%=exam_id%>"
								method="post" name="form2">
								<div class="form-group">
									<label>考试号</label> <input type="text" class="form-control"
										name="exam_id" id="exam_id" disabled="disabled"
										value="<%=e.getExam_id()%>">
								</div>
								<div class="form-group">
									<label>考试名称</label> <input type="text" class="form-control"
										name="exam_name" id="exam_name"
										value="<%=e.getExam_name() == null ? ' ' : e.getExam_name()%>">
								</div>
								<div class="form-group">
									<label>报名开始时间</label> <input type="datetime-local"
										class="form-control" name="time_begin" id="time_begin"
										value="<%=e.getTime_begin().toString().replace(' ', 'T').substring(0, 19) == null ? ' '
					: e.getTime_begin().toString().replace(' ', 'T').substring(0, 19)%>">
								</div>
								<div class="form-group">
									<label>报名结束时间</label> <input type="datetime-local"
										class="form-control" name="time_end" id="time_end"
										value="<%=e.getTime_end().toString().replace(' ', 'T').substring(0, 19) == null ? ' '
					: e.getTime_end().toString().replace(' ', 'T').substring(0, 19)%>">
								</div>
								<div class="form-group">
									<label>考试时间</label> <input type="datetime-local"
										class="form-control" name="time" id="time"
										value="<%=e.getTime().toString().replace(' ', 'T').substring(0, 19) == null ? ' '
					: e.getTime().toString().replace(' ', 'T').substring(0, 19)%>">
								</div>
								<div class="form-group">
									<label>考试简介</label>
									<textarea class="form-control" name="introduce" id="introduce"><%=e.getIntroduce() == null ? ' ' : e.getIntroduce()%></textarea>
								</div>
								<div class="form-group">
									<label>考试状态</label> 
									<label> <input name="exam_status"
										type="radio" value="报名未开始"
										<%=e.getStatus().equals("报名未开始") ? "checked" : ""%>>报名未开始
									</label> 
									<label> <input name="exam_status"
										type="radio" value="报名进行中"
										<%=e.getStatus().equals("报名进行中") ? "checked" : ""%>>报名进行中
									</label> <label><input name="exam_status" type="radio"
										value="报名结束待考试"
										<%=e.getStatus().equals("报名结束待考试") ? "checked" : ""%>>报名结束待考试
									</label> <label><input name="exam_status" type="radio"
										value="考试结束" <%=e.getStatus().equals("考试结束") ? "checked" : ""%>>考试结束
									</label>
								</div>
								<input type="submit" class="btn btn-primary" value="更新"
									style="margin-top: 20px" onclick="return checkTime1(form2)">

								<input type="button" class="btn btn-default" value="返回"
									style="margin-top: 20px; margin-left: 20px; border: 2px solid #e7e7e7;"
									onclick="history.go(-1)">

							</form>

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
