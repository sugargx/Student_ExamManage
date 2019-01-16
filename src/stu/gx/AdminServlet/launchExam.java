package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.*;
import stu.gx.dao.AdminDao;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.AdminDaoImpl;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class launchExam
 */
public class launchExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public launchExam() {
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
		
		String adminname = request.getParameter("adminname");
		
		String status = request.getParameter("exam_status");
	
		AdminDao admind = new AdminDaoImpl();
		admin a1 = admind.getAdminId(adminname);
		int admin_id = a1.getAdmin_id();

		ExamDao Edao = new ExamDaoImpl();
		
		//判断考试名字是否重复
		List<exam> exams  = Edao.getAllExam();
		boolean b = true;
		for(exam el1 : exams) {
			if(el1.getExam_name().equals(exam_name))
			{
				b = false;
			}
		}
		
		int sign_num = 0;
		int all_num = 0;
		
		exam er = new exam(exam_name,time_begin,time_end,time,introduce,status, all_num, sign_num, admin_id);
		System.out.println(er);

		
		if(b) {
			Edao.add(er);
			out.print("<script language='javascript'>alert('发布成功！');window.location.href='/GradeMan/admin/editexam.jsp';</script>");
		}
		else {
			out.print("<script language='javascript'>alert('添加失败！该考场名字已存在！请重新填写考试名');window.location.href='/GradeMan/admin/launchExam.jsp';</script>");
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
