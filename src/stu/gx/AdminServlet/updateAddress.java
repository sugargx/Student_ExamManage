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
 * Servlet implementation class updateAdmin
 */
public class updateAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAddress() {
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
		
	   int address_id = Integer.parseInt(request.getParameter("address_id"));
	   String name = request.getParameter("address_name");
	
       AddressDao Edao = new AddressDaoImpl();
            //判断名是否重复
     		List<address> addresss  = Edao.getAllAddress();
     		
     		boolean b = true;
     		for(address el1 : addresss) {
     			if(el1.getAddress_name().equals(name))
     			{
     				b = false;
     			}
     		}
     		
     		address er = new address(address_id, name);
     		Edao.update(er);
       
       if(b==true) {
    	   out.print("<script language='javascript'>alert('修改成功！');window.location.href='/GradeMan/admin/room_address.jsp';</script>");
       }else {
    	   out.print("<script language='javascript'>alert('修改失败！考场地点不能重复！');window.location.href='/GradeMan/admin/editAddress?address_id="+address_id+".jsp';</script>");
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
