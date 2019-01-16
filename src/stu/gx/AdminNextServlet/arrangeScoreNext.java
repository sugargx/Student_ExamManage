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
 * Servlet implementation class arrangeScore
 */
public class arrangeScoreNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public arrangeScoreNext() {
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

		double score = Double.parseDouble(request.getParameter("score"));

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int exam_id = Integer.parseInt(request.getParameter("exam_id"));
		signup signup1 = new signup();
		signup1.setExam_id(exam_id);
		signup1.setScore(score);
		signup1.setUser_id(user_id);
		SignUpDao signD = new SignUpDaoImpl();
		signD.updateS(signup1);

			out.print("<script language='javascript'>alert('成绩更新成功！');window.location.href='/GradeMan/adminNext/StudentScore.jsp?exam_id="
					+ exam_id + "';</script>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
