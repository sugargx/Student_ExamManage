package stu.gx.AdminNextServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.exam;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class updateExam
 */
public class updateExamNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateExamNext() {
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
		System.out.println("111111");
		System.out.println(request.getParameter("exam_id"));
		
		int exam_id = Integer.parseInt(request.getParameter("exam_id"));
		System.out.println(exam_id);
		String exam_name = request.getParameter("exam_name");
		System.out.println(exam_name);
		Date time_begin = null;
		Date time_end = null;
		Date time = null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			
			time_begin = df.parse(request.getParameter("time_begin").replace('T', ' '));
			System.out.println(time_begin);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
       try {
			
			time_end = df.parse(request.getParameter("time_end").replace('T', ' '));
			System.out.println(time_end);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       try {
			
			time = df.parse(request.getParameter("time").replace('T', ' '));
			System.out.println(time);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       String introduce = request.getParameter("introduce");
       System.out.println(introduce);
       String status = request.getParameter("exam_status");
       System.out.println(status);
       
       ExamDao Edao = new ExamDaoImpl();
       exam er = new exam(exam_id, exam_name,time_begin,time_end,time,introduce,status);
       System.out.println(er);
       
       if(Edao.update(er)) {
    	   out.print("<script language='javascript'>alert('修改成功！');window.location.href='/GradeMan/adminNext/editexam.jsp';</script>");
       }else {
    	   out.print("<script language='javascript'>alert('修改失败！');window.location.href='/GradeMan/adminNext/editexam_detail.jsp';</script>");
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
