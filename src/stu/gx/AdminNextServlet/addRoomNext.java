package stu.gx.AdminNextServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.*;
import stu.gx.dao.*;
import stu.gx.dao.impl.*;
import stu.gx.dao.ExamRoomDao;
import stu.gx.dao.impl.ExamRoomDaoImpl;

/**
 * 增加考场
 */
public class addRoomNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRoomNext() {
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

		String exam_room_name = request.getParameter("exam_room_name");
		int exam_room_num = Integer.parseInt(request.getParameter("exam_room_num"));
		String exam_room_address = request.getParameter("exam_room_address");
		
		ExamRoomDao Edao = new ExamRoomDaoImpl();

			List<exam_room> el = Edao.getAllexam_rooms();
			boolean b = true;
			for (exam_room el1 : el) {
				if (el1.getRoom_name().equals(exam_room_name)) {
					b = false;
				}
			}
			if (b) {
//				根据选的考试名称得到考试号
				int exam_id = Integer.parseInt(request.getParameter("exam_name"));
				exam_room er = new exam_room(exam_id, exam_room_name, exam_room_address, exam_room_num);
				Edao.add(er);
				out.print(
						"<script language='javascript'>alert('添加成功！');window.location.href='/GradeMan/adminNext/manageExamRoom.jsp';</script>");
			} else {
				out.print(
						"<script language='javascript'>alert('添加失败！该考场名已存在！请重新填写考场名！');window.location.href='/GradeMan/adminNext/addExamRoom.jsp';</script>");
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
