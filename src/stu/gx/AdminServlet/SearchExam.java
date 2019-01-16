package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.exam;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class SearchExam
 */
public class SearchExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchExam() {
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
		int exam_id = Integer.parseInt(request.getParameter("exam_id"));
		
		ExamDao Edao = new ExamDaoImpl();
		exam oneExam = Edao.getOneExam(exam_id);

		
		if(oneExam==null) {//如果没有此考试
			exam_id = 0;
			out.print("<script language='javascript'>window.location.href='/GradeMan/admin/searchOneExam.jsp?exam_id="+exam_id+"';</script>");
//			RequestDispatcher dispatcher = request.getRequestDispatcher(".jsp");
//			dispatcher.forward(request, response);
		}
		else {
			out.print("<script language='javascript'>window.location.href='/GradeMan/admin/searchOneExam.jsp?exam_id="+exam_id+"';</script>");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/searchOneExam.jsp");
//			dispatcher.forward(request, response);
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
