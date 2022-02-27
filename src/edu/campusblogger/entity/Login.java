package edu.campusblogger.entity;

public class Login {
	
	private int loginId;
	private String collegeId;
	private String password;
	
	public int getLoginId() {
		return loginId;
	}
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "Login [loginId=" + loginId + ", collegeId=" + collegeId + ", password=" + password + "]";
	}
	
	

	
	
}
