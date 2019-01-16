package stu.gx.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import stu.gx.bean.*;
import stu.gx.jdbc.C3P0Util;

/**
 *  Exam_room表增删改查
 */
public interface ExamRoomDao{
	DataSource ds = C3P0Util.getDataSource();	
	QueryRunner qr = new QueryRunner(ds);
	
	public boolean add(exam_room exam_room) ;

	public boolean delete(int room_id);

	public boolean update(exam_room exam_room);

	//根据考场号查询考场信息
	public exam_room getRoomInfo(int room_id);
	
	//根据考试号查询考场信息
	public List<exam_room> getRoomInfobyEI(int exam_id);
	
	//查询表内全部信息
	public List<exam_room> getAllexam_rooms() ;
	
	//查询表内从某一行到某一行的信息
	public List<exam_room> getAll(int startIndex, int pageSize);

}
