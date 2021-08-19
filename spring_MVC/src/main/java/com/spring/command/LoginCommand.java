package com.spring.command;

//DB와 상관없이 사용자로부터 넘어오는 데이터만 고려하여 만듦(변수명만 유의)
public class LoginCommand {

	private String id;
	private String pwd;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
