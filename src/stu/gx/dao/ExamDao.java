package stu.gx.dao;

import java.util.List;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import stu.gx.bean.exam;
import stu.gx.jdbc.C3P0Util;

/**
 * Servlet implementation class examDao
 */
public interface ExamDao {

	DataSource ds = C3P0Util.getDataSource();
	QueryRunner qr = new QueryRunner(ds);

	public boolean add(exam exam);

	public boolean delete(int exam_id);

	public boolean update(exam exam);

	// 查所有考试
	public List<exam> getAllExam();

	// 查一个特定id的考试信息
	public exam getOneExam(int exam_id);

	public exam getOneExam(String exam_name);
	
	//根据考试的状态来筛选考试
	public List<exam> getStatusExam(String status);

	// 查询表内从某一行到某一行的信息。对于分页来使用
	public List<exam> getAll(int startIndex, int pageSize);
	
	//更新报名成功总人数
	public boolean updateNum(int exam_id, int num);
	
	//更新报名总人数
	public boolean updateAllNum(int exam_id, int num);
	
	//根据管理员id找到所有他发布的考试
	public List<exam> getAllAdmin(int admin_id);

}
