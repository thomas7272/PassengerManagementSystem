package com.pms.action;
import java.util.*;

import java.sql.*;
import com.pms.dao.LoginDao;
import com.pms.model.AdminLoginModel;

public class AdminRegistration {
  public static void main(String args[]) {
	  
	  Scanner sc =new Scanner(System.in);
	  
	  try {
		  Connection con = LoginDao.establishConnection();
		  ArrayList<AdminLoginModel> alm = LoginDao.getLoginData(con);
		  ArrayList<String> emails =new ArrayList<>();
		  for(AdminLoginModel a : alm)
		  {
			  emails.add(a.getEmail());
		  }
		  if(con!=null) {
			  System.out.println("Connection established");
		  }
	 
	  
	 
	  

	  
	  System.out.println("Please Enter Admin Details for Registration");
	  Boolean check = true;
	  while(check) { 
	  System.out.println("Enter email");
	  String email=sc.nextLine();
	  
	  try {
		  if(email.contains("@"))
		  {  check=false;
			  if(emails.contains(email))
			  {check=true;
				  throw new EmailExistException("User Already Exist");
			  }else {
				  System.out.println("Enter password");
				  String password=sc.nextLine();
				  System.out.println("Enter usertype");
				  String userType=sc.nextLine();
				  System.out.println("Enter status as either Active or Inactive");
				  String status=sc.nextLine();
				  System.out.println("Enter UserName");
				  String userName = sc.nextLine();
				  AdminLoginModel al = new AdminLoginModel(email,password,userType,status,userName);
				  int rowsEffected = LoginDao.insertLoginDetails(con, al);
				  if(rowsEffected>0) {
					  System.out.println("Data inserted successfully");
				  }else {
					  System.out.println("Data not insertion failed."); 
				  }
				  
			  }
			  
		  }else{
			  throw new EmailFormatException("Enter a Valid Email");
			  
		  }
		  
			  
		  
		  
	  }catch(EmailFormatException e) {
		  
		  System.out.println(e);
	  }catch(EmailExistException e) {
		  System.out.println(e);
	  }
	  }
	  }catch(SQLException e) {
	  System.out.println("Database connection failed");
//		  System.out.println(e);
	  }
	  
	  
  }
}

class EmailFormatException extends Exception{
	public EmailFormatException(String message) {
		super(message);
	}
}
class EmailExistException extends Exception{
	public EmailExistException(String message) {
		super(message);
	}
}