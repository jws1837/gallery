package model;

import java.io.Serializable;

public class CustomerDTO implements Serializable {
	private String cus_id;
	private String cus_pw;
	private String cus_name;
	private String cus_tel;
	private String cus_email;
	public CustomerDTO() {
		super();
	}
	public CustomerDTO(String cus_id, String cus_pw, String cus_name, String cus_tel, String cus_email) {
		super();
		this.cus_id = cus_id;
		this.cus_pw = cus_pw;
		this.cus_name = cus_name;
		this.cus_tel = cus_tel;
		this.cus_email = cus_email;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pw() {
		return cus_pw;
	}
	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_tel() {
		return cus_tel;
	}
	public void setCus_tel(String cus_tel) {
		this.cus_tel = cus_tel;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	@Override
	public String toString() {
		return "CustomerDTO [cus_id=" + cus_id + ", cus_pw=" + cus_pw + ", cus_name=" + cus_name + ", cus_tel="
				+ cus_tel + ", cus_email=" + cus_email + "]";
	}
	
	
}