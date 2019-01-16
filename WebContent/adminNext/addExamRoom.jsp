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
	function check(form) {
		if (form.exam_room_name.value == "") {
			alert("请输入考场名称!");
			form.exam_room_name.focus();
			return false;
		}
		if (form.exam_room_num.value == "") {
			alert("请输入考场容量!");
			form.exam_room_num.focus();
			return false;
		}
		if (form.exam_room_address.value == "") {
			alert("请输入考场地址!");
			form.exam_room_address.focus();
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


					<li class="dropdown active"><a href="addExamRoom.jsp">
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
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3>请填写考场信息</h3>
						</div>
						<div class="card-body" style="padding: 30px 15%">

							<form class="form form-horizontal" method="post"
								action="/GradeMan/addRoomNext" name="form1">
								<input type="hidden" value="launch" name="action" />

								<div class="form-group" style="margin-bottom: 20px">
									<label class="col-md-2">考试名称<span style="color: red">*</span></label>
									<%
										ExamDao exd = new ExamDaoImpl();
										List<exam> exams = exd.getStatusExam("报名结束待考试");
										
										String username = (String) session.getAttribute("admin");
										AdminDao admind = new AdminDaoImpl();
										admin admin = admind.getAdminId(username);
										int admin_id = admin.getAdmin_id();
										List<exam> exam2 = exd.getAllAdmin(admin_id);
										
										exams.retainAll(exam2);
									%>
									<div class="col-md-8 col-sm-12">
										<select class="form-control" name="exam_name">

											<%
												for (exam e1 : exams) {
											%>

											<option value=<%=e1.getExam_id()%>><%=e1.getExam_name()%></option>

											<%
												}
											%>

										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2">考场名称<span style="color: red">*</span></label>
									<div class="col-md-8 col-sm-12">
										<input type="text" class="form-control" value=""
											name="exam_room_name" id="exam_room_name" placeholder="如：135">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2">考场容量<span style="color: red">*</span></label>
									<div class="col-md-8 col-sm-12">
										<input type="number" class="form-control" value=""
											name="exam_room_num" id="exam_room_num" placeholder="">
									</div>
								</div>

								<div class="form-group" style="padding-bottom:20px">
									<label class="col-md-2">考场地点<span style="color: red">*</span></label>
									<%
									     AddressDao add = new AddressDaoImpl();
									     List<address> ads = add.getAllAddress();
									    
									%>
									<div class="col-md-8 col-sm-12">
									     <select class="form-control" name="exam_room_address">
									     
									        <%for(address a1:ads){%>
 
                                            <option value=<%=a1.getAddress_name() %>><%=a1.getAddress_name() %></option>
 
                                            <%}%>
									       
									     </select>
									</div>
								</div>





								<div class="form-footer">
									<div class="form-group">
										<div class="col-md-9 col-md-offset-3">
											<input type="submit" class="btn btn-primary" value="确定发布"
												onclick="return check(form1)"> <input type="button"
												class="btn btn-default" value="取消" onclick="history.go(-1)">
										</div>
									</div>
								</div>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>
</body>
</html>