package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.dao.AdminDao;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.AdminDaoImpl;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class delAdmin
 */
public class delAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delAdmin() {
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
		AdminDao Edao = new AdminDaoImpl();
		Edao.delete(admin_id);
		
		out.print("<script language='javascript'>alert('É¾³ý³É¹¦£¡');window.location.href='/GradeMan/admin/showAdmin.jsp';</script>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
