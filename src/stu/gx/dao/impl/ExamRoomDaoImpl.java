package stu.gx.dao.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import stu.gx.bean.*;
import stu.gx.dao.ExamRoomDao;

/**
 * Servlet implementation class ExamRoomDaoImpl
 */
public class ExamRoomDaoImpl implements ExamRoomDao {

	public boolean add(exam_room exam_room) {

		String sql = "insert into exam_room(exam_id,room_name,room_address, exam_room_num) values(?,?,?,?)";

		try {
			qr.update(sql, exam_room.getExam_id(), exam_room.getRoom_name(),exam_room.getRoom_address(),
					exam_room.getExam_room_num());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
//				C3P0Util.release(rs, stmt, conn);

		}

		return true;
	}

	public boolean delete(int room_id) {
		// TODO Auto-generated method stub

		String sql = "delete from exam_room where room_id=? ";

		try {
			qr.update(sql, room_id);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

		return true;

	}

	public boolean update(exam_room exam_room) {

		String sql = "update exam_room set exam_id=?,room_name=?,exam_room_num=?,room_address=? where room_id=?";

		try {
			qr.update(sql, exam_room.getExam_id(), exam_room.getRoom_name(), exam_room.getExam_room_num(), exam_room.getRoom_address(),
					exam_room.getRoom_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {

		}

		return false;
	}

	public exam_room getRoomInfo(int room_id) {

		String sql = "select * from exam_room where room_id=?  ";

		try {

			return qr.query(sql, new BeanHandler<exam_room>(exam_room.class), room_id);
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<exam_room> getAllexam_rooms() {
		String sql = "select * from exam_room";

		// System.out.println(sql);

		try {
			List<exam_room> list = qr.query(sql, new BeanListHandler<exam_room>(exam_room.class));
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<exam_room> getAll(int startIndex, int pageSize) {
		String sql = "select * from exam_room limit ?,?";

		try {
			List<exam_room> list = qr.query(sql, new BeanListHandler<exam_room>(exam_room.class), startIndex, pageSize);
			System.out.println("111");
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<exam_room> getRoomInfobyEI(int exam_id) {
		String sql = "select * from exam_room where exam_id=?";

		try {
			List<exam_room> list = qr.query(sql, new BeanListHandler<exam_room>(exam_room.class), exam_id);
			System.out.println("111");
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
}