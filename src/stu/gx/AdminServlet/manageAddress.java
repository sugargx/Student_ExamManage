package stu.gx.AdminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import stu.gx.bean.address;
import stu.gx.bean.admin;
import stu.gx.bean.exam;
import stu.gx.dao.AddressDao;
import stu.gx.dao.AdminDao;
import stu.gx.dao.ExamDao;
import stu.gx.dao.impl.AddressDaoImpl;
import stu.gx.dao.impl.AdminDaoImpl;
import stu.gx.dao.impl.ExamDaoImpl;

/**
 * Servlet implementation class manageAdmin
 */
public class manageAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manageAddress() {
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
		
		String name = request.getParameter("address_name");
		
		AddressDao Adao = new AddressDaoImpl();
		
		//判断名是否重复
		List<address> addresss  = Adao.getAllAddress();
		
		boolean b = true;
		for(address el1 : addresss) {
			if(el1.getAddress_name().equals(name))
			{
				b = false;
			}
		}
		
		address er = new address(name);
		
		if(b) {
			Adao.add(er);
			out.print("<script language='javascript'>alert('添加成功！');window.location.href='/GradeMan/admin/room_address.jsp';</script>");
		}
		else {
			out.print("<script language='javascript'>alert('添加失败！该考场地点已存在！请重新填写');window.location.href='/GradeMan/admin/addAddress.jsp';</script>");
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
