package stu.gx.bean;

import java.util.Date;
public class exam implements java.io.Serializable{
	
	/**
	 * øº ‘±Ì 
	 */
	private static final long serialVersionUID = 1L;
	private int exam_id;
	private String exam_name;

	private Date time_begin;
	private Date time_end;
	private Date time;
	private String introduce;
	private String status;
	private int all_num;
	private int sign_num;
	private int admin_id;
	
	
	
	public exam(String exam_name, Date time_begin, Date time_end, Date time, String introduce,
			String status, int all_num, int sign_num, int admin_id) {
		super();
		this.exam_name = exam_name;
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
		this.status = status;
		this.all_num = all_num;
		this.sign_num = sign_num;
		this.admin_id = admin_id;
	}


	public int getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}


	public int getAll_num() {
		return all_num;
	}


	public exam(int exam_id, String exam_name, Date time_begin, Date time_end, Date time, String introduce,
			String status, int all_num, int sign_num) {
		super();
		this.exam_id = exam_id;
		this.exam_name = exam_name;
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
		this.status = status;
		this.all_num = all_num;
		this.sign_num = sign_num;
	}


	public void setAll_num(int all_num) {
		this.all_num = all_num;
	}


	public int getSign_num() {
		return sign_num;
	}


	public void setSign_num(int sign_num) {
		this.sign_num = sign_num;
	}


	public int getExam_id() {
		return exam_id;
	}


	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}


	public String getExam_name() {
		return exam_name;
	}


	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}


	


	public Date getTime_begin() {
		return time_begin;
	}


	public void setTime_begin(Date time_begin) {
		this.time_begin = time_begin;
	}


	@Override
	public String toString() {
		return "exam [exam_id=" + exam_id + ", exam_name=" + exam_name + ", time=" + time + ", time_begin=" + time_begin
				+ ", time_end=" + time_end + ", introduce=" + introduce + ", status=" + status + "]";
	}


	public Date getTime_end() {
		return time_end;
	}


	public void setTime_end(Date time_end) {
		this.time_end = time_end;
	}
	public Date getTime() {
		return time;
	}


	public void setTime(Date time) {
		this.time = time;
	}

	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public exam(int exam_id, String exam_name, Date time_begin, Date time_end,Date time,  String introduce,
			String status) {
		super();
		this.exam_id = exam_id;
		this.exam_name = exam_name;
		
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
		this.status = status;
	}

	
	public exam(String exam_name, Date time_begin, Date time_end,  Date time,String introduce,
			String status) {
		super();
		this.exam_name = exam_name;
		
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
		this.status = status;
	}
	
	


	public exam(int exam_id, String exam_name, Date time_begin, Date time_end, Date time, String introduce,
			String status, int sign_num) {
		super();
		this.exam_id = exam_id;
		this.exam_name = exam_name;
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
		this.status = status;
		this.sign_num = sign_num;
	}


	public exam() {
		super();
		// TODO Auto-generated constructor stub
	}


	public exam(String exam_name,  Date time_begin, Date time_end,Date time, String introduce) {
		super();
		this.exam_name = exam_name;
		
		this.time_begin = time_begin;
		this.time_end = time_end;
		this.time = time;
		this.introduce = introduce;
	}
}
