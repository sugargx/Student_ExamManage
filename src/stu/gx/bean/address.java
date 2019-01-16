package stu.gx.bean;

public class address implements java.io.Serializable{
	private int address_id;
	private String address_name;
	public address(String address_name) {
		super();
		this.address_name = address_name;
	}
	
	public address(int address_id, String address_name) {
		super();
		this.address_id = address_id;
		this.address_name = address_name;
	}

	public address() {
		super();
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	@Override
	public String toString() {
		return "address [address_id=" + address_id + ", address_name=" + address_name + "]";
	}
	
}