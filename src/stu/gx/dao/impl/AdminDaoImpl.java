package stu.gx.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import stu.gx.bean.admin;
import stu.gx.dao.AdminDao;

/**
 * admin表的增删改查方法的实现
 */
public class AdminDaoImpl implements AdminDao {

	public boolean add(admin admin) {
		String sql = "insert into admin(username, password, rank)values(?,?,?)";
		try {
			qr.update(sql, admin.getUsername(), admin.getPassword(), admin.getRank());

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	
	public boolean delete(int admin_id) {
		String sql = "delete from admin where admin_id=? ";

		try {
			qr.update(sql, admin_id);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

		return true;
	}


	public boolean update(admin admin) {
		String sql = "update  admin set username=?, password=?, rank = ? where admin_id=?";

		try {
			qr.update(sql, admin.getUsername(), admin.getPassword(), admin.getRank(), admin.getAdmin_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {

		}

		return false;
	}


	public admin getPassword(String username) {

		String sql = "select password from admin where username=?  ";

		try {

			return qr.query(sql, new BeanHandler<admin>(admin.class), username);
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	
	
	public admin getAdminId(String username) {

		String sql = "select * from admin where username=?  ";

		try {

			return qr.query(sql, new BeanHandler<admin>(admin.class), username);
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	


	public List<admin> getAllAdmins() {
		String sql = "select  * from admin";

		// System.out.println(sql);

		try {
			List<admin> list = qr.query(sql, new BeanListHandler<admin>(admin.class));
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	
	public admin getAdmin(int admin_id) {
		String sql = "select * from admin where admin_id=?  ";

		try {

			return qr.query(sql, new BeanHandler<admin>(admin.class), admin_id);
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

}
