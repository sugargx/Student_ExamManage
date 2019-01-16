package stu.gx.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import stu.gx.jdbc.C3P0Util;
import stu.gx.bean.user;

/**
 * 对user表进行增删改查
 */
public interface UserDao{
	
	DataSource ds = C3P0Util.getDataSource();	
	QueryRunner qr = new QueryRunner(ds);	

	public boolean add(user user) ;

	public boolean delete(String username) ;

	
	public boolean update(user user) ;

	
	//得到某个用户的密码
	public user getPassword(String username) ;
	
	//得到全部用户
	public List<user> getAllUser() ;
	
	//得到某个用户
	public user getUserbyUN(String username);
	
	public user getUserbyID(int user_id);
	
}
