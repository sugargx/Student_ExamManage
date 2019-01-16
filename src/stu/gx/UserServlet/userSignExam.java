package stu.gx.UserServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.exam;
import stu.gx.bean.signup;
import stu.gx.bean.user;
import stu.gx.dao.ExamDao;
import stu.gx.dao.SignUpDao;
import stu.gx.dao.UserDao;
import stu.gx.dao.impl.ExamDaoImpl;
import stu.gx.dao.impl.SignUpDaoImpl;
import stu.gx.dao.impl.UserDaoImpl;

/**
 * 考试报名
 */
public class userSignExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSignExam() {
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

		    UserDao Udao = new UserDaoImpl();

		    String username = request.getParameter("username");

			user usr = Udao.getUserbyUN(username);
			System.out.println("报名考试的用户为："+usr);
	
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String identify = request.getParameter("identify");
			String email = request.getParameter("email");
			
			usr.setName(name);
			usr.setSex(sex);
			usr.setEmail(email);
			usr.setIdentify(identify);
			
			Udao.update(usr);
			
			int exam_id = Integer.parseInt(request.getParameter("exam_id"));
			signup signup1 = new signup(usr.getUser_id(),exam_id);
//			signup1.setExam_id(exam_id);
//			signup1.setUser_id(usr.getUser_id());
			SignUpDao signD = new SignUpDaoImpl();
			boolean s = signD.add(signup1);
			
			//将考试报名总人数+1
			ExamDao examd = new ExamDaoImpl();
			exam exam1 = examd.getOneExam(exam_id);
			int num_new = exam1.getAll_num() + 1;
			examd.updateAllNum(exam_id, num_new);

			
				out.print("<script language='javascript'>alert('报名成功！关注邮箱通知关注报名审核结果！');window.location.href='userIndexPer.jsp';</script>");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
