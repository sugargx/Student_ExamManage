package stu.gx.bean;

public class user implements java.io.Serializable{
	
	/**
	 * ”√ªß±Ì
	 */
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String identify;
	private String sex;
	
	@Override
	public String toString() {
		return "user [userid=" + user_id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", email=" + email + ", identify=" + identify + "]";
	}
	
	
	
	public user(int userid, String username, String password, String name, String email, String identify, String sex) {
		super();
		this.user_id = userid;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.identify = identify;
		this.sex = sex;
	}
	

	public user() {
		super();
	}

	

	public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
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



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getIdentify() {
		return identify;
	}



	public void setIdentify(String identify) {
		this.identify = identify;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}