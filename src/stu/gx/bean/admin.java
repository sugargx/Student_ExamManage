package stu.gx.bean;

public class admin implements java.io.Serializable{
	
	/**
	 * 管理员表
	 */
	private static final long serialVersionUID = 1L;
	private int admin_id;
	private String username;
	private String password;
	private int rank;
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public admin(int admin_id, String username, String password, int rank) {
		super();
		this.admin_id = admin_id;
		this.username = username;
		this.password = password;
		this.rank = rank;
	}
	
	public admin(String username, String password, int rank) {
		super();
		this.username = username;
		this.password = password;
		this.rank = rank;
	}
	public admin() {
		super();
	}
	@Override
	public String toString() {
		return "admin [admin_id=" + admin_id + ", username=" + username + ", password=" + password + ", rank=" + rank
				+ "]";
	}
	
}