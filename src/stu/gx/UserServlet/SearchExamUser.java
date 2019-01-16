package stu.gx.UserServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.exam;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class SearchExamUser
 */
public class SearchExamUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchExamUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String exam_name = new String(request.getParameter("exam_name").getBytes("iso-8859-1"),"UTF-8");//�����jsp�л�õ����뺺��Ϊ����-get��ʽ�ύ
		System.out.println(exam_name);
		
		ExamDao Edao = new ExamDaoImpl();
		exam oneExam = Edao.getOneExam(exam_name);
		
		System.out.println(oneExam);

		if(oneExam==null) {//���û�д˿���
			request.setAttribute("flag", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/oneexamUser.jsp");
			dispatcher.forward(request, response);
		}
		else {
			 request.setAttribute("exam_info", oneExam);
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/oneexamUser.jsp");
			 dispatcher.forward(request, response);	
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