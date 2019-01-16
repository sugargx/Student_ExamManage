package stu.gx.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import stu.gx.bean.exam;
import stu.gx.dao.ExamDao;

/**
 * Servlet implementation class ExamDaoImpl
 */
public class ExamDaoImpl implements ExamDao {

	
	public boolean add(exam exam) {
		String sql = "insert into exam(exam_name, time_begin, time_end, time, introduce, status, admin_id)values(?,?,?,?,?,?, ?)";
		try {
			qr.update(sql, exam.getExam_name(), exam.getTime_begin(), exam.getTime_end(), exam.getTime(),
					exam.getIntroduce(), exam.getStatus(), exam.getAdmin_id());

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	
	public boolean delete(int exam_id) {
		String sql = "delete from exam where exam_id=? ";

		try {
			qr.update(sql, exam_id);

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

		return true;
	}

	
	public boolean update(exam exam) {
		String sql = "update  exam set  exam_name = ?, time = ?, time_begin = ?, time_end = ?, introduce = ?, status = ? where exam_id=?";

		// System.out.println(sql);
		try {
			qr.update(sql, exam.getExam_name(), exam.getTime(), exam.getTime_begin(), exam.getTime_end(),
					exam.getIntroduce(), exam.getStatus(), exam.getExam_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}

	public boolean updateNum(int exam_id, int num) {
		String sql = "update exam set sign_num = ? where exam_id = ?";
		try {
			qr.update(sql, num, exam_id);
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}
	
	public boolean updateAllNum(int exam_id, int num) {
		String sql = "update exam set all_num = ? where exam_id = ?";
		try {
			qr.update(sql, num, exam_id);
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}


	public List<exam> getAllExam() {
		String sql = "select * from exam order by exam_id desc";

		// System.out.println(sql);

		try {
			List<exam> list = qr.query(sql, new BeanListHandler<exam>(exam.class));

			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

	}
	
	public List<exam>  getAllAdmin(int admin_id) {
		String sql = "select * from exam where admin_id = ?";

		// System.out.println(sql);

		try {
			List<exam> list = qr.query(sql, new BeanListHandler<exam>(exam.class), admin_id);

			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

	}



	public exam getOneExam(int exam_id) {
		String sql = "select * from exam where exam_id=?  ";

		try {

			exam u = qr.query(sql, new BeanHandler<exam>(exam.class), exam_id);
			return u;
//			6、释放占用的资源

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	
	public exam getOneExam(String exam_name) {
		String sql = "select * from exam where exam_name=?  ";

		try {

			exam u = qr.query(sql, new BeanHandler<exam>(exam.class), exam_name);
			return u;

		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	
	public List<exam> getAll(int startIndex, int pageSize) {
		String sql = "select * from exam limit ?,?";

		try {
			List<exam> list = qr.query(sql, new BeanListHandler<exam>(exam.class), startIndex, startIndex + pageSize);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	
	public List<exam> getStatusExam(String status) {
		String sql = "select * from exam where status = ?";

		try {
			List<exam> list = qr.query(sql, new BeanListHandler<exam>(exam.class), status);

			return list;

		} catch (Exception e) {
			throw new RuntimeException(e);

		}

	}


}
