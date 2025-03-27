package com.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.pms.model.*;

public class TrainDetailsDao 
{

	public static Connection getconnection() throws SQLException
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
	
	public static ResultSet retriveTrainData(Connection con) throws SQLException
	{
		String Query = "select * from TrainDetails";
		Statement smnt = con.createStatement();
		ResultSet rs = smnt.executeQuery(Query);
		return rs;
	}
	
	public static int insertBookingDetails(Connection con, BookingDetailsModel bdm) throws SQLException 
	{ // TODO Auto-generated method stub  
		String query = "insert into BookingDetails(pnr,gmailid,name,age,gender,trainnumber, trainname, origin, destination, ticketPrice) values (?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement smnt = con.prepareStatement(query);
		smnt.setLong(1,bdm.getPnr()); 
		smnt.setString(2,bdm.getGmailid());
		smnt.setString(3,bdm.getName());
		smnt.setInt(4, bdm.getAge());
		smnt.setString(5, bdm.getGender());
		smnt.setInt(6, bdm.getTrainnumber());
		smnt.setString(7,bdm.getTrainname());
		smnt.setString(8,bdm.getOrigin());
		smnt.setString(9,bdm.getDestination());
		smnt.setInt(10, bdm.getTicketPrice()); 
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
  
    }
	
	public static ResultSet SessionssBookings(Connection con,String gmail) throws SQLException 
	{
		
		String Query = "select * from BookingDetails where gmailid = ?";
		PreparedStatement smnt = con.prepareStatement(Query);
		smnt = con.prepareStatement(Query);
		smnt.setString(1,gmail);
	    ResultSet rs = smnt.executeQuery();
	    return rs;
	}
	public static int cancelBooking(Connection con,long pnr) throws SQLException 
	{
		String query = "delete from BookingDetails where pnr = ?";
		PreparedStatement smnt = con.prepareStatement(query);
		 smnt.setLong(1,pnr); 
		 int rowsEffected = smnt.executeUpdate();
		 return rowsEffected;
	}
	
	 public static ResultSet getPassengersByPages(Connection con, int start, int recordsPerPage) throws SQLException
	 { 
		 PreparedStatement ps = con.prepareStatement("SELECT * FROM BookingDetails LIMIT ? OFFSET ?");
		  ps.setInt(1, recordsPerPage); ps.setInt(2, start); return ps.executeQuery();
	  }
	 
	 public static int getTotalRecord(Connection con) throws SQLException
		{
		    PreparedStatement ps =
		    con.prepareStatement("SELECT COUNT(*) FROM BookingDetails"); 
		    ResultSet rs =ps.executeQuery(); 
		    if(rs.next()) 
		    {
		    	return rs.getInt(1); 
		    }
		    return 0; 
		}
	
}
