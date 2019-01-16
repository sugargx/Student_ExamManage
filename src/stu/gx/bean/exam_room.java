package stu.gx.bean;

public class exam_room implements java.io.Serializable{
	
	/**
	 * ¿¼³¡±í
	 */
	private static final long serialVersionUID = 1L;
	private int exam_id;
	private int room_id;
	private String room_name;
	private String room_address;
	private int exam_room_num;
	
	@Override
	public String toString() {
		return "exam_room [exam_id=" + exam_id + ", room_id=" + room_id + ", room_name=" + room_name + ", room_address="
				+ room_address + ", exam_room_num=" + exam_room_num + "]";
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

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_address() {
		return room_address;
	}

	public void setRoom_address(String room_address) {
		this.room_address = room_address;
	}

	public int getExam_room_num() {
		return exam_room_num;
	}

	public void setExam_room_num(int exam_room_num) {
		this.exam_room_num = exam_room_num;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public exam_room(int room_id, int exam_id, String room_name, String room_address, int exam_room_num) {
		super();
		this.room_id = room_id;
		this.exam_id = exam_id;
		this.room_name = room_name;
		this.room_address = room_address;
		this.exam_room_num = exam_room_num;
	}
	
	

	public exam_room(int exam_id, String room_name, String room_address, int exam_room_num) {
		super();
		this.exam_id = exam_id;
		this.room_name = room_name;
		this.room_address = room_address;
		this.exam_room_num = exam_room_num;
	}

	public exam_room() {
		super();
	}
	
	
	
}