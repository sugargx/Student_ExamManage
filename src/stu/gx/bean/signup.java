package stu.gx.bean;

import java.sql.Date;

public class signup implements java.io.Serializable{
	
	/**
	 * ¿¼ÊÔ±¨Ãû±í
	 */
	private static final long serialVersionUID = 1L;
	private int user_id;
	private int examcard_number;
	private int exam_id;
	private int room_id;
	private int seat_num;
	private double score;
	private String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getExamcard_number() {
		return examcard_number;
	}
	public void setExamcard_number(int examcard_number) {
		this.examcard_number = examcard_number;
	}
	public int getExam_id() {
		return exam_id;
	}
	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "signup [user_id=" + user_id + ", examcard_number=" + examcard_number + ", exam_id=" + exam_id
				+ ", room_id=" + room_id + ", seat_num=" + seat_num + ", score=" + score + ", status=" + status + "]";
	}
	public signup(int user_id, int examcard_number, int exam_id, int room_id, int seat_num, double score) {
		super();
		this.user_id = user_id;
		this.examcard_number = examcard_number;
		this.exam_id = exam_id;
		this.room_id = room_id;
		this.seat_num = seat_num;
		this.score = score;
	}
	
	public signup(int user_id, int examcard_number, int exam_id, int room_id, int seat_num, double score,
			String status) {
		super();
		this.user_id = user_id;
		this.examcard_number = examcard_number;
		this.exam_id = exam_id;
		this.room_id = room_id;
		this.seat_num = seat_num;
		this.score = score;
		this.status = status;
	}
	public signup() {
		super();
	}
	public signup(int user_id, int exam_id) {
		super();
		this.user_id = user_id;
		this.exam_id = exam_id;
	}
	
}