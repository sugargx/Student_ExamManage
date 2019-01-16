package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.admin;
import stu.gx.bean.exam;
import stu.gx.dao.AdminDao;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.AdminDaoImpl;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class updateAdmin
 */
public class updateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
	   int admin_id = Integer.parseInt(request.getParameter("admin_id"));
	   String username = request.getParameter("username");
	
       String password = request.getParameter("password");
       int rank = Integer.parseInt(request.getParameter("rank"));
       
       AdminDao Edao = new AdminDaoImpl();
            //判断账号名是否重复
     		List<admin> admins  = Edao.getAllAdmins();
     		
     		boolean b = true;
     		for(admin el1 : admins) {
     			if(el1.getUsername().equals(username))
     			{
     				b = false;
     			}
     		}
     		
     		admin er = new admin(admin_id, username,password,rank);
     		System.out.println(er);
     		Edao.update(er);
       
       if(b==true) {
    	   out.print("<script language='javascript'>alert('修改成功！');window.location.href='/GradeMan/admin/showAdmin.jsp';</script>");
       }else {
    	   out.print("<script language='javascript'>alert('修改失败！账号名不能重复！');window.location.href='/GradeMan/admin/editAdmin.jsp';</script>");
       }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
