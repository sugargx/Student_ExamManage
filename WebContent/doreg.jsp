<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="stu.gx.dao.impl.*" %>
<%@ page import="stu.gx.bean.*"   %> 
<%@ page import="stu.gx.dao.*"   %> 
<%@ page import="stu.gx.jdbc.*"   %>
<!-- 取消隐含的session --> 
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String username=request.getParameter("username");
	String password=request.getParameter("password1");
	
	String code = request.getParameter("code");//获得输入的验证码
	
	HttpSession session = request.getSession();
	
	String code2 = (String)session.getAttribute("code");//取得输出到浏览器的验证码
	
	//验证码错误
	if(!code.equals(code2))
	{
		out.write("<script> alert('错误的验证码，注册失败！请重新注册！'); window.location.href='userIndex.jsp'</script>");
		
		return;
	}
	
	System.out.println(username);

	UserDao dao = new  UserDaoImpl();	
	
	user user = new user();
	
	user.setUsername(username);
	user.setPassword(password);
	boolean b = dao.add(user);
	if(b)
	{
		out.write("<script>alert('注册成功！请登录！'); window.location='userIndex.jsp' </script>");
		//response.setHeader("Refresh", "2;URL=userIndex.jsp");
	}
	else
	{
		out.write("<script>alert('注册失败！请重新注册！'); window.location='userIndex.jsp' </script>");
		//response.setHeader("Refresh", "2;URL=userIndex.jsp");
	}
%>
</body>
</html>