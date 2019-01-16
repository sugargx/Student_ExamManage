package stu.gx.AdminNextServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.signup;
import stu.gx.dao.SignUpDao;
import stu.gx.dao.impl.SignUpDaoImpl;

/**
 * Servlet implementation class arrangeExam_room
 */
public class arrangeExam_roomNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public arrangeExam_roomNext() {
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

		int room_id = Integer.parseInt(request.getParameter("exam_room"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int exam_id = Integer.parseInt(request.getParameter("exam_id"));
		signup signup1 = new signup();
		signup1.setExam_id(exam_id);
		signup1.setRoom_id(room_id);
		
		SignUpDao supd = new SignUpDaoImpl();
//		所有报名此考试的用户
		List<signup> as = supd.getSignupExam(exam_id);
		int numr = 0;
		for (signup si : as) {
			if (room_id == si.getRoom_id()) {
				numr++;
			}
		}
		signup1.setSeat_num(numr+1);
		signup1.setUser_id(user_id);
		SignUpDao signD = new SignUpDaoImpl();
		signD.updateER(signup1);
        
		out.print("<script language='javascript'>alert('分配成功！');window.location.href='/GradeMan/adminNext/signStudentAll.jsp?exam_id="+exam_id+"';</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
