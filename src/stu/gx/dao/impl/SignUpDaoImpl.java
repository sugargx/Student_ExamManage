package stu.gx.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.Test;

import stu.gx.bean.exam;
import stu.gx.bean.signup;
import stu.gx.dao.SignUpDao;

/**
 * Servlet implementation class SignUpDaoImpl
 */
public class SignUpDaoImpl implements SignUpDao {

	 
	public boolean add(signup signup) {
		String sql = "insert into signup(user_id,exam_id) values(?,?)";
		try {
			qr.update(sql, signup.getUser_id(),signup.getExam_id());

		} catch (Exception e) {
			return false;
		}

		return true;
	}

	public boolean updateRoom(signup signup) {
		String sql = "update user set room_id=? where examcard_number=?";

		// System.out.println(sql);
		try {
			qr.update(sql, signup.getRoom_id(), signup.getExamcard_number());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}
	
	public boolean updateStatus(String status, int examcard_number) {
		String sql = "update signup set status=? where examcard_number=?";

		try {
			qr.update(sql, status, examcard_number);
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}
	
	public signup getExamUser(int user_id, int exam_id) {
		String sql = "select * from signup where exam_id=? and user_id = ?";
	
		try {
			signup u = qr.query(sql, new BeanHandler<signup>(signup.class),exam_id, user_id);
			return u;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	

	public List<signup> getSignup(int user_id) {
		String sql = "select * from signup where user_id=?";

		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),user_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public boolean updateER(signup signup) {
		String sql = "update  signup set room_id=?,seat_num=? where user_id=? and exam_id=?";

		// System.out.println(sql);
		try {
			qr.update(sql, signup.getRoom_id(),signup.getSeat_num(),signup.getUser_id(), signup.getExam_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}

	public List<signup> getPagesignup(int startIndex, int pageSize) {
		String sql = "select * from signup limit ?,?";

		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class), startIndex, pageSize);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getAllsignup() {
		String sql = "select * from signup";

		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class));
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getSignupExam(int exam_id) {
		String sql = "select * from signup where exam_id=?";

		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	
	public List<signup> getStatusExam(String status) {
		String sql = "select * from signup where status=?";

		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),status);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public boolean updateS(signup signup) {
		String sql = "update  signup set score=? where user_id=? and exam_id=?";

		// System.out.println(sql);
		try {
			qr.update(sql, signup.getScore(),signup.getUser_id(), signup.getExam_id());
			return true;

		} catch (Exception e) {
			// throw new RuntimeException(e);
		} finally {
			// JdbcUtil.release(rs, stmt, conn);
		}

		return false;
	}

	public List<signup> getTop(int exam_id) {
		String sql = "select * from signup where exam_id=? order by score desc limit 10 ";
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getScore1(int exam_id) {
		String sql = "select * from signup where exam_id=? and score between 90 and 100";
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getScore2(int exam_id) {
		String sql = "select * from signup where exam_id=? and score between 80 and 90";
	
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getScore3(int exam_id) {
		String sql = "select * from signup where exam_id=? and score between 70 and 80";
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getScore4(int exam_id) {
		String sql = "select * from signup where exam_id=? and score between 60 and 70";
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}

	public List<signup> getScore5(int exam_id) {
		String sql = "select * from signup where exam_id=? and score < 60";
		try {
			List<signup> list = qr.query(sql, new BeanListHandler<signup>(signup.class),exam_id);
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);

		}
	}
	@Test
	public void Test() {
		signup signup1 = new signup(2,2);
//		signup1.setExam_id(exam_id);
//		signup1.setUser_id(usr.getUser_id());
		SignUpDao signD = new SignUpDaoImpl();
		signD.add(signup1);
	}

}
