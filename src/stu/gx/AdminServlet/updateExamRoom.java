package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.*;
import stu.gx.dao.ExamRoomDao;
import stu.gx.dao.impl.ExamRoomDaoImpl;

/**
 * Servlet implementation class updateExamRoom
 */
public class updateExamRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateExamRoom() {
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
		
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		System.out.println(room_id);
		
		String room_name = request.getParameter("exam_room_name");
		
		int exam_id = Integer.parseInt(request.getParameter("exam_name"));
		int exam_room_num = Integer.parseInt(request.getParameter("exam_room_num"));
		String exam_room_address = request.getParameter("exam_room_address");
		
		
		exam_room er = new exam_room(room_id, exam_id, room_name, exam_room_address, exam_room_num);
		System.out.println(er);
		
		ExamRoomDao Edao = new ExamRoomDaoImpl();
		boolean x = Edao.update(er);

		out.print("<script language='javascript'>alert('ÐÞ¸Ä³É¹¦£¡');window.location.href='/GradeMan/admin/manageExamRoom.jsp';</script>");

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
