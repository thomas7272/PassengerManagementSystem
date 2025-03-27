package com.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.pms.model.*;
public class CreatePassengerDao {
	
	
	public static Connection establishConnection() throws SQLException
    {
        try
        {
        	Class.forName("org.sqlite.JDBC");
            Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\2785129\\MySQLiteDB");
            if(con!=null)
            {
                return con;
            }
        
        }
        catch(ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        return null;
    }
	
	public static int insertDetails(Connection con, CreatePassengerModel cpm) throws SQLException 
	{  
		String query = "insert into Passenger(FullName,Email,Password,ConfirmPassword,Phone) values (?,?,?,?,?)";
		
		PreparedStatement smnt = con.prepareStatement(query);
		smnt.setString(1,cpm.getFullName()); 
		smnt.setString(2,cpm.getEmail());
		smnt.setString(3,cpm.getPassword());
		smnt.setString(4, cpm.getConfirmPassword());
		smnt.setLong(5, cpm.getPhone());
		
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
  
 }

}
