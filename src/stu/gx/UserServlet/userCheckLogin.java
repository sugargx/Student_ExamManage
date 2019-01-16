package stu.gx.UserServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stu.gx.bean.user;
import stu.gx.dao.UserDao;
import stu.gx.dao.impl.UserDaoImpl;

/**
 * Servlet implementation class userCheckLogin
 */
public class userCheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCheckLogin() {
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
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");//是否选择记住密码
		
		String usernamee;
		System.out.println("用户输入的用户名为：" + username);
		System.out.println("用户输入的密码为：" +password);
		System.out.println(remember);
		
		UserDao user = new UserDaoImpl();
		List<user> allUsers = user.getAllUser();
		
		boolean flag = false;
		
		for(user user1 : allUsers) {
			usernamee = user1.getUsername();
			System.out.println("name:" + usernamee);
			if(username.equals(usernamee)) {
				flag = true;
				break;
			}
		}
		    
		   if(flag == true) {//输入的用户名存在
			user pass = user.getPassword(username);
			String password2 = pass.getPassword();
			System.out.println("pass:" + password2);
			
			if(password.equals(password2)) {
				//判断是否选择了记住密码
				if(remember.equals("true"))
				{
					Cookie ck1 = new  Cookie("username", username);
					System.out.println("记住用户的账号：" + username);
					ck1.setMaxAge(1000);	
					response.addCookie(ck1);
					Cookie ck2 = new  Cookie("password", password);
					System.out.println("记住用户的密码：" + password);
					ck2.setMaxAge(1000);	
					response.addCookie(ck2);
				}
				else//取消记住用户名密码
				{
					Cookie ck1 = new  Cookie("username", "");
					ck1.setMaxAge(0);	
					response.addCookie(ck1);
					Cookie ck2 = new  Cookie("password", "");
					ck2.setMaxAge(0);	
					response.addCookie(ck2);
				}
				
				//将用户登录信息保存在session中
	            HttpSession session = request.getSession();
	            session.setAttribute("loginName", username);
	            
				
				out.write("1");//登录成功
			}
			else if(password.equals("")){
				out.write("4");//密码为空
			}
			else {
				out.write("3");//密码错误
			}
		  }
		
		else if(flag == false)//用户名不存在
		{
			
		    if(username.equals("")) {//用户名未输入
					out.write("-1");
			}else {//用户名输入不存在
				out.write("2");
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
