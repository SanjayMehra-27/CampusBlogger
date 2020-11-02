package edu.campusblogger.entity;

import javax.servlet.http.Part;

public class Student {

	private int id;
	private String firstname;
	private String lastname;
	private String email;
	private String phonenumber;
	private String collegeId;
	private String branch;
	private String password;
	private String profesion;
	private String photo;
	private Part filepart;
	
	
	public Part getFilepart() {
		return filepart;
	}
	public void setFilepart(Part filepart) {
		this.filepart = filepart;
	}
	public String getProfesion() {
		return profesion;
	}
	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}
	public int getId() {
		return id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", " + (firstname != null ? "firstname=" + firstname + ", " : "")
				+ (lastname != null ? "lastname=" + lastname + ", " : "")
				+ (email != null ? "email=" + email + ", " : "")
				+ (phonenumber != null ? "phonenumber=" + phonenumber + ", " : "")
				+ (collegeId != null ? "collegeId=" + collegeId + ", " : "")
				+ (branch != null ? "branch=" + branch + ", " : "")
				+ (password != null ? "password=" + password + ", " : "")
				+ (profesion != null ? "profesion=" + profesion + ", " : "")
				+ (photo != null ? "photo=" + photo + ", " : "") + (filepart != null ? "filepart=" + filepart : "")
				+ "]";
	}
	
	
	
	
	
	
	
}
