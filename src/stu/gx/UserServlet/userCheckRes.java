package stu.gx.UserServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.user;
import stu.gx.dao.UserDao;
import stu.gx.dao.impl.UserDaoImpl;

/**
 * Servlet implementation class userCheckRes
 */
public class userCheckRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCheckRes() {
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

		String username = request.getParameter("username");
		System.out.println(username);
		String usernamee;
		UserDao user = new UserDaoImpl();
		List<user> allUsers = user.getAllUser();
		
		boolean flag = true;
		
		for(user user1 : allUsers) {
			usernamee = user1.getUsername();
			System.out.println("name:" + usernamee);
			if(username.equals(usernamee)) {
				flag = false;
				break;
			}
		}
		if(flag == false) {//用户名已被占用
			out.write("-1");
		}
		else {
			if(username.equals(""))//输入的用户名未空
			{
				out.write("2");
			}
			else {//用户名可用
				out.write("1");
			}
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
