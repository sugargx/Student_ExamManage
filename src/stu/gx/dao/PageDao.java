package stu.gx.dao;

import stu.gx.bean.Page;
import stu.gx.bean.exam;
import stu.gx.bean.exam_room;
import stu.gx.bean.signup;

public interface PageDao{
//	全部考试
	public Page<exam> findAllexamWithPage(int pageNum,int pageSize);
//	全部考场
	public Page<exam_room> findAllexam_roomWithPage(int pageNum,int pageSize);
//	全部报名
	public Page<signup> findAllsignupWithPage(int pageNum,int pageSize);
	
//	每个考试id报名的人
	public Page<signup> findSpecialsignupWithPage(int pageNum,int pageSize, int exam_id);
}