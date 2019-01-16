package stu.gx.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import stu.gx.bean.signup;
import stu.gx.jdbc.C3P0Util;

public interface SignUpDao {
	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);

    public boolean add(signup signup);

	
	public boolean updateER(signup signup);
	
	public boolean updateS(signup signup);
	
	
	public boolean updateStatus(String status, int examcard_number);
	

	public List<signup> getSignup(int user_id);
	
	public List<signup> getPagesignup(int startIndex, int pageSize) ;
	
	
	public List<signup> getAllsignup() ;
	
	public List<signup> getSignupExam(int exam_id) ;
	
	public signup getExamUser(int user_id, int exam_id);
	
	public List<signup> getStatusExam(String status);
	
	public List<signup> getTop(int exam_id);
	
	public List<signup> getScore1(int exam_id);
	
	public List<signup> getScore2(int exam_id);
	
	public List<signup> getScore3(int exam_id);
	
	public List<signup> getScore4(int exam_id);
	
	public List<signup> getScore5(int exam_id);

	

	
}
