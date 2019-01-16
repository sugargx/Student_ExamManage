package stu.gx.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import stu.gx.bean.address;
import stu.gx.jdbc.C3P0Util;

public interface AddressDao {
	DataSource ds = C3P0Util.getDataSource();	
	QueryRunner qr = new QueryRunner(ds);
	
	public boolean add(address address);

	public boolean delete(int address_id) ;

	public boolean update(address address) ;

	//查询表内全部信息
	public List<address> getAllAddress() ;
	
	public address getAddress(int address_id);

}
