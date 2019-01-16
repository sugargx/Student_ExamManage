package stu.gx.AdminNextServlet;

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

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class AuditGo
 */
public class AuditGoNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditGoNext() {
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
		
	   int user_id = Integer.parseInt(request.getParameter("user_id"));
	   int exam_id = Integer.parseInt(request.getParameter("exam_id"));
	   
	   UserDao userd = new UserDaoImpl();
	   user u1 = userd.getUserbyID(user_id);
	   String email = u1.getEmail();
	   
	
       SignUpDao Sdao = new SignUpDaoImpl();
       signup s = Sdao.getExamUser(user_id, exam_id);

     	Sdao.updateStatus("通过", s.getExamcard_number());
     	
//     	将报名成功的人数+1
     	 ExamDao examd = new ExamDaoImpl(); 
     	 exam e1 = examd.getOneExam(exam_id);
     	 int num = e1.getSign_num();
     	 examd.updateNum(exam_id, num+1);
     
     	 
//     	 发邮件通知
         Properties props = new Properties();
         props.setProperty("mail.host", "smtp.163.com");
         props.setProperty("mail.smtp.auth", "true");

         Authenticator authenticator = new Authenticator() {
             @Override
             public PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication("gx15064655362@163.com","admin123");
             }
         };

         Session session = Session.getDefaultInstance(props, authenticator);

         Message message = new MimeMessage(session);
    
         try {
			message.setFrom(new InternetAddress("gx15064655362@163.com"));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
         try {
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         // 2.3 主题（标题）
         try {
			message.setSubject("考试报名审核通知");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         String name = u1.getName();
         // 2.4 正文
//         String str = name + "同学： <br/>" +
//                         "您好，您在本考试管理网站报名的考试：<br/>" + e1.getExam_name() +
//                         "审核结果为：" + "通过";
         
         String str = "同学您好，您在网站报名的考试报名审核结果为：通过！请近期时刻关注网站查询考场座号！点我到网站(〃'▽'〃)";
         //设置编码，防止发送的内容中文乱码。
         try {
			message.setContent(str, "text/html;charset=UTF-8");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

         //3发送消息
         try {
			Transport.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     	  
     	 
         out.print("<script language='javascript'>alert('审核修改成功并成功给用户发送邮件通知审核结果！');window.location.href='/GradeMan/adminNext/signExamStudentAll.jsp?exam_id="
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
