<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生成绩管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/vendor.css">
<link rel="stylesheet" type="text/css" href="../css/flat-admin.css">
<link
	href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet">
<script type="text/javascript" src="../js/vendor.js"></script>
<script type="text/javascript" src="../js/app.js"></script>
</head>

<script>
	function chklogin(txtUserName) {
		var xhr = createXmlHttpRequest();

		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var remember = document.getElementsByName('remember')[0].checked;//判断是否选择记住密码

		xhr.open("POST", "/GradeMan/adminCheckLogin?username=" + username
				+ "&password=" + password + "&remember=" + remember);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		var username = txtUserName.value;
		xhr.send("username=" + username + "password=" + password + "remember"
				+ remember);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				//真正的处理
				if (xhr.status == 200 || xhr.status == 304) {
					//服务器正确返回
					var data = xhr.responseText;//服务器返回的数据
					if (data == "1")//登录成功，跳转到主页
					{
						var rank="<%=session.getAttribute("rank")%>"; 
						alert(rank);
						if(rank == 0){
							window.location.href = "adminIndex.jsp";
						}
						else{
							window.location.href = "/GradeMan/adminNext/adminNextIndex.jsp";
						}
						
						//response.setHeader("refresh", "0;url=adminIndex.jsp");
					} else if (data == '2')//登录失败，用户名不存在
					{
						document.getElementById("divcheck").innerHTML = "用户名不存在，请重新输入！";
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
	<div class="app app-default">

		<div class="app-container app-login">
			<div class="flex-center">
				<div class="app-header"></div>
				<div class="app-body">
					<div class="loader-container text-center">
						<div class="icon">
							<div class="sk-folding-cube">
								<div class="sk-cube1 sk-cube"></div>
								<div class="sk-cube2 sk-cube"></div>
								<div class="sk-cube4 sk-cube"></div>
								<div class="sk-cube3 sk-cube"></div>
							</div>
						</div>
						<div class="title">成绩管理管理员登录界面</div>
					</div>
					<div class="app-block">
						<div class="app-form" style="width: 350px">
							<div class="form-header">
								<div class="app-brand">
									<span class="highlight">学生成绩</span> 管理系统
								</div>
							</div>

							<%
								String username = "";
								String password = "";
								Cookie[] c = request.getCookies();
								if (c != null) {
									for (int i = 0; i < c.length; i++) {
										if ("username".equals(c[i].getName())) {
											username = c[i].getValue();
										} else if ("password".equals(c[i].getName())) {
											password = c[i].getValue();
										}
									}
								} else {
									username = " ";
									password = " ";
								}
							%>

							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1"> <i
									class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
									name="username" class="form-control username" id="username"
									autocomplete="off" value="<%=username%>" placeholder="账号"
									aria-describedby="basic-addon1">
							</div>
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon2"> <i
									class="fa fa-key" aria-hidden="true"></i></span> <input
									type="password" name="password" class="form-control password"
									id="password" autocomplete="off" value="<%=password%>"
									placeholder="密码" aria-describedby="basic-addon2">
							</div>
							
							<p id="divcheck" style="color: red"></p>
							

							<!-- 记住密码 -->
							<input type='checkbox' name='remember' style="vertical-align: text-top;"/>记住我

							<div class="text-center">
								<button type="submit" class="btn btn-success btn-submit"
									value="" onclick="chklogin(this)">登录</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>