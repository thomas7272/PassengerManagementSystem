package com.pms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.pms.model.GetPassengerDetailsModel;
import com.pms.model.*;

public class AddPassengerDao 
{
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
	
	public static int insertDetails(Connection con, PassengerDetailsModel pdm) throws SQLException 
	{ // TODO Auto-generated method stub  
		String query = "insert into PassengerDetails (PNR,PassengerName,age,Gender,TrainNumber,Origin,Destination,price) values (?,?,?,?,?,?,?,?)";
		
		PreparedStatement smnt = con.prepareStatement(query);
		smnt.setLong(1,pdm.getPnr()); 
		smnt.setString(2,pdm.getPassengerName());
		smnt.setInt(3,pdm.getAge());
		smnt.setString(4, pdm.getGender());
		smnt.setInt(5, pdm.getTrainNumber());
		smnt.setString(6, pdm.getOrigin());
		smnt.setString(7, pdm.getDestination());
		smnt.setInt(8, pdm.getPrice()); 
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
  
    }
	
	public static ArrayList<GetPassengerDetailsModel>  getPassengerDetails(Connection con) throws SQLException
    {
        ArrayList<GetPassengerDetailsModel> pdm = new ArrayList<>();
        Statement smnt = con.createStatement();
        String Query = "select * from PassengerDetails";
        ResultSet rs = smnt.executeQuery(Query);
        while(rs.next())
        {
        	pdm.add(new GetPassengerDetailsModel(rs.getLong(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getInt(8)));
            
        }
        return pdm;
    }
	
	public static int updatePassengerDetails(Connection con , GetPassengerDetailsModel gpdm) throws SQLException
	{
		String Query = "update PassengerDetails set PassengerName = ?,age = ?,Gender = ?,TrainNumber = ?,Origin = ?,Destination = ?,price = ? where PNR = ?";
		PreparedStatement smnt = con.prepareStatement(Query);
	
		smnt.setString(1, gpdm.getPassengerName());
		smnt.setInt(2,gpdm.getAge());
		smnt.setString(3, gpdm.getGender());
		smnt.setInt(4,gpdm.getTrainNumber());
		smnt.setString(5, gpdm.getOrigin());
		smnt.setString(6,gpdm.getDestination());
		smnt.setInt(7, gpdm.getPrice()); 
		smnt.setLong(8,gpdm.getPnr()); 
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
		
	}
	
	
	public static int deletePassengerDetails(Connection con,long pnr) throws SQLException
	{
		String Query = "delete from PassengerDetails where PNR=?";
		PreparedStatement smnt = con.prepareStatement(Query);
		smnt.setLong(1, pnr);
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
		
	}
	
	public static ResultSet retriveData(Connection con) throws SQLException
	{
		String Query = "select * from PassengerDetails ";
		Statement smnt = con.createStatement();
		ResultSet rs = smnt.executeQuery(Query);
		return rs;
	}

	 public static ResultSet searchPassengers(Connection con, String searchTerm) throws SQLException {
	        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM passengers WHERE PNR LIKE ? OR PassengerName LIKE ?");
	        pstmt.setString(1, "%" + searchTerm + "%");
	        pstmt.setString(2, "%" + searchTerm + "%");
	        return pstmt.executeQuery();
	    }
	
	  public static ResultSet searchData(Connection con,String x) throws
	  SQLException { String Query = "select * from PassengerDetails where PNR= ?";
	  PreparedStatement psmnt = con.prepareStatement(Query); 
	  long pnr = Long.parseLong(x);
	  psmnt.setLong(1,pnr); 
	  ResultSet rs =  psmnt.executeQuery(); 
	  return rs; }
	 
	public static int getTotalRecords(Connection con) throws SQLException
	{
	    PreparedStatement ps =
	    con.prepareStatement("SELECT COUNT(*) FROM PassengerDetails"); 
	    ResultSet rs =ps.executeQuery(); 
	    if(rs.next()) 
	    {
	    	return rs.getInt(1); 
	    }
	    return 0; 
	}
	
	 public static ResultSet getPassengersByPage(Connection con, int start, int recordsPerPage) throws SQLException
	 { 
		 PreparedStatement ps = con.prepareStatement("SELECT * FROM PassengerDetails LIMIT ? OFFSET ?");
		  ps.setInt(1, recordsPerPage); ps.setInt(2, start); return ps.executeQuery();
	  }
	
	
	
}

