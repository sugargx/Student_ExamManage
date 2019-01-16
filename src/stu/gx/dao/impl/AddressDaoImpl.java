package stu.gx.dao.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import stu.gx.bean.address;
import stu.gx.dao.AddressDao;

public class AddressDaoImpl implements AddressDao {

	public boolean add(address address) {
		String sql = "insert into address(address_name)values(?)";
		try {
			qr.update(sql, address.getAddress_name());

		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	public boolean delete(int address_id) {
		String sql = "delete from address where address_id=? ";

		try {
			qr.update(sql, address_id);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

		return true;
	}


	public boolean update(address address) {
		String sql = "update  address set address_name=? where address_id=?";

		try {
			qr.update(sql, address.getAddress_name(), address.getAddress_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {

		}

		return false;
	}


	public List<address> getAllAddress() {
		String sql = "select  * from address";

		// System.out.println(sql);

		try {
			List<address> list = qr.query(sql, new BeanListHandler<address>(address.class));
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}


	public address getAddress(int address_id) {
		String sql = "select * from address where address_id=?  ";

		try {

			return qr.query(sql, new BeanHandler<address>(address.class), address_id);
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

}
