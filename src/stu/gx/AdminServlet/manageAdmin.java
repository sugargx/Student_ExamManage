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
 * Servlet implementation class manageAdmin
 */
public class manageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageAdmin() {
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
		
		String name = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		int rank = Integer.parseInt(request.getParameter("rank"));
	
		AdminDao Edao = new AdminDaoImpl();
		
		//判断账号名是否重复
		List<admin> admins  = Edao.getAllAdmins();
		
		boolean b = true;
		for(admin el1 : admins) {
			if(el1.getUsername().equals(name))
			{
				b = false;
			}
		}
		
		admin er = new admin(name,password,rank);
		
		if(b) {
			Edao.add(er);
			out.print("<script language='javascript'>alert('添加成功！');window.location.href='/GradeMan/admin/showAdmin.jsp';</script>");
		}
		else {
			out.print("<script language='javascript'>alert('添加失败！该账号名已存在！请重新填写账号名');window.location.href='/GradeMan/admin/manageAdmin.jsp';</script>");
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
