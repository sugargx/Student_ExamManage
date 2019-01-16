package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import stu.gx.bean.admin;
import stu.gx.dao.AdminDao;
import stu.gx.dao.impl.AdminDaoImpl;

/**
 * Servlet implementation class adminCheckLogin
 */
public class adminCheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminCheckLogin() {
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
		String passwordd;
		System.out.println("管理员输入的用户名为：" + username);
		System.out.println("管理员输入的密码为：" +password);
		
		AdminDao admin = new AdminDaoImpl();
		List<admin> allAdmins = admin.getAllAdmins();
		
		boolean flag = false;
		
		for(admin admin1 : allAdmins) {
			usernamee = admin1.getUsername();
		    passwordd = admin1.getPassword();
			System.out.println("name:" + usernamee);
			System.out.println("pass:" + passwordd);
			if(username.equals(usernamee)) {
				flag = true;
				break;
			}
		}
		//System.out.println("flag:" + flag);
		    
		   if(flag == true) {//输入的用户名存在
			admin pass = admin.getPassword(username);
			String password2 = pass.getPassword();
			
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
				
				System.out.println("管理员用户名：" + username);
				
				AdminDao admind = new AdminDaoImpl();
				admin admin1 = admind.getAdminId(username);
				int rank = admin1.getRank();
				System.out.println(rank);
				
				HttpSession  session= request.getSession();
		        //将数据存储到session中
				session.setAttribute("admin", username);
				session.setAttribute("admin_id", admin1.getAdmin_id());
				session.setAttribute("rank", rank);

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
