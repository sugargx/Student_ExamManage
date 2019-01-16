package stu.gx.dao.impl;

import java.util.List;

import stu.gx.bean.Page;
import stu.gx.bean.exam;
import stu.gx.bean.exam_room;
import stu.gx.bean.signup;
import stu.gx.dao.ExamDao;
import stu.gx.dao.ExamRoomDao;
import stu.gx.dao.PageDao;
import stu.gx.dao.SignUpDao;

/**
 * Servlet implementation class PageDaoImpl
 */
public class PageDaoImpl implements PageDao {


	public Page<exam> findAllexamWithPage(int pageNum, int pageSize) {
		ExamDao ed = new ExamDaoImpl();
		List<exam> allExam = ed.getAllExam();
		int totalRecord = allExam.size();
		
		Page<exam> pg = new Page<exam>(pageNum,pageSize,totalRecord);
		
		int startIndex = pg.getStartIndex();
		
		pg.setList(ed.getAll(startIndex, pageSize));
		
		return pg;
	}
	
	public Page<exam_room> findAllexam_roomWithPage(int pageNum, int pageSize) {
		ExamRoomDao ed = new ExamRoomDaoImpl();
		List<exam_room> allExam_room = ed.getAllexam_rooms();
		int totalRecord = allExam_room.size();
		
		Page<exam_room> pg = new Page<exam_room>(pageNum,pageSize,totalRecord);
		
		int startIndex = pg.getStartIndex();
		
		pg.setList(ed.getAll(startIndex, pageSize));
		
		return pg;
	}
	
	public Page<signup> findAllsignupWithPage(int pageNum, int pageSize) {
		SignUpDao signd = new SignUpDaoImpl();
		List<signup> allsignup = signd.getAllsignup();
		int totalRecord = allsignup.size();
		
		Page<signup> pg = new Page<signup>(pageNum,pageSize,totalRecord);
		
		int startIndex = pg.getStartIndex();
		
		pg.setList(signd.getPagesignup(startIndex, pageSize));
		
		return pg;
	}
	
	public Page<signup> findSpecialsignupWithPage(int pageNum, int pageSize, int exam_id) {
		SignUpDao signd = new SignUpDaoImpl();
		List<signup> allsignup = signd.getSignupExam(exam_id);
		int totalRecord = allsignup.size();
		
		Page<signup> pg = new Page<signup>(pageNum,pageSize,totalRecord);
		
		int startIndex = pg.getStartIndex();
		
		pg.setList(signd.getPagesignup(startIndex, pageSize));
		
		return pg;
	}

	
}
