package com.example.demo.member;


public class Member {
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_nickname;
	private String user_email;
	private String user_tel;
	private String user_addr;
	private String user_birth;
	private int user_type;

	

	public Member() {
		super();
	}

	public Member(String user_id, String user_pwd, String user_name, String user_nickname, String user_email,
			String user_tel, String user_addr, String user_birth, int user_type) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_addr = user_addr;
		this.user_birth = user_birth;
		this.user_type = user_type;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "Member [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name=" + user_name + ", user_nickname="
				+ user_nickname + ", user_email=" + user_email + ", user_tel=" + user_tel + ", user_addr=" + user_addr
				+ ", user_birth=" + user_birth + ", user_type=" + user_type + "]";
	}

	

}
