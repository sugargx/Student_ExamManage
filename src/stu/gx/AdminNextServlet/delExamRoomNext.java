package stu.gx.AdminNextServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.exam_room;
import stu.gx.dao.ExamRoomDao;
import stu.gx.dao.impl.ExamRoomDaoImpl;

/**
 * Servlet implementation class delExamRoom
 */
public class delExamRoomNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delExamRoomNext() {
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
	
		ExamRoomDao Edao = new ExamRoomDaoImpl();
		List<exam_room> el = Edao.getAllexam_rooms();
		boolean b = false;
		for(exam_room el1 : el) {
			if(el1.getRoom_id()==room_id)
			{
				b = true;
			}
		}
		
		Edao.delete(room_id);
		
		 
		
		if(b) {
			
				out.print("<script language='javascript'>alert('É¾³ý³É¹¦£¡');window.location.href='/GradeMan/adminNext/adminIndex.jsp';</script>");
	       
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
