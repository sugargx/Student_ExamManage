package stu.gx.dao.impl;


import java.util.List;


import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import stu.gx.bean.user;
import stu.gx.dao.UserDao;

/**
 * Servlet implementation class UserDaoImpl
 */
public class UserDaoImpl implements UserDao {

	public boolean add(user user) {
		String sql = "insert into user(username, password)values(?,?)";
		try {
			qr.update(sql, user.getUsername(), user.getPassword());

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	
	public boolean delete(String username) {
		String sql = "delete from user where username=? ";

		// System.out.println(sql);

		try {
			qr.update(sql, username);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

		return true;
	}

	
	public boolean update(user user) {
		String sql = "update  user set name=?,sex=?,identify=?,email=? where username=?";

		// System.out.println(sql);
		try {
			qr.update(sql, user.getName(),user.getSex(),user.getIdentify(),user.getEmail(),user.getUsername());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}



	public user getPassword(String username) {
		String sql = "select password from user where username=?  ";

		try {

			return qr.query(sql, new BeanHandler<user>(user.class), username);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}


	public List<user> getAllUser() {
		String sql = "select  * from user";

		// System.out.println(sql);

		try {
			List<user> list = qr.query(sql, new BeanListHandler<user>(user.class));

			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	//得到某个用户
	public user getUserbyUN(String username) {

		String sql = "select * from user where username=?  ";

		try {

			return qr.query(sql, new BeanHandler<user>(user.class), username);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	
	public user getUserbyID(int user_id) {
		String sql = "select * from user where user_id=?  ";

		try {

			return qr.query(sql, new BeanHandler<user>(user.class), user_id);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}


}
