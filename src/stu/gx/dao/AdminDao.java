package stu.gx.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import stu.gx.bean.admin;
import stu.gx.jdbc.C3P0Util;

  /**
  *  admin表增删改查
  */
public interface AdminDao {
	DataSource ds = C3P0Util.getDataSource();	
	QueryRunner qr = new QueryRunner(ds);
	
	public boolean add(admin admin);

	public boolean delete(int admin_id) ;

	
	public boolean update(admin admin) ;

	//根据用户名查询密码
	public admin getPassword(String username) ;
	
	public admin getAdminId(String username);
	
	//查询表内全部信息
	public List<admin> getAllAdmins() ;
	
	public admin getAdmin(int admin_id);

}
