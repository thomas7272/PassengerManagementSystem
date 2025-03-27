package com.pms.model;

public class CreatePassengerModel {
	
 private String fullName;
 private String email;
 private String password;
 private String confirmPassword;
 private long phone;
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getConfirmPassword() {
	return confirmPassword;
}
public void setConfirmPassword(String confirmPassword) {
	this.confirmPassword = confirmPassword;
}
public long getPhone() {
	return phone;
}
public void setPhone(long phone) {
	this.phone = phone;
}
public CreatePassengerModel(String fullName, String email, String password, String confirmPassword, long phone) {
	super();
	this.fullName = fullName;
	this.email = email;
	this.password = password;
	this.confirmPassword = confirmPassword;
	this.phone = phone;
}
 
}
