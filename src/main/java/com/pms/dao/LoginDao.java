package com.pms.dao;
import java.sql.*;
import com.pms.model.*;
import java.util.*;
public class LoginDao 
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
    
    public static ArrayList<AdminLoginModel> getLoginData(Connection con) throws SQLException
    {
        ArrayList<AdminLoginModel> alm = new ArrayList<>();
        Statement smnt = con.createStatement();
        String Query = "select * from Login";
        ResultSet rs = smnt.executeQuery(Query);
        while(rs.next())
        {
            alm.add(new AdminLoginModel(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
            
        }
        return alm;
    }
    
    
	public static int insertLoginDetails(Connection conn, AdminLoginModel alm) throws SQLException 
	{ // TODO Auto-generated method stub  
		String query = "insert into Login(Email,Password,UserType,Status,UserName) values (?,?,?,?,?)";
		
		PreparedStatement smnt = conn.prepareStatement(query);
		
		smnt.setString(1,alm.getEmail());
		smnt.setString(2,alm.getPassword());
		smnt.setString(3,alm.getUserType());
		smnt.setString(4,alm.getStatus());
		smnt.setString(5,alm.getUserName());
		
		int rowsEffected = smnt.executeUpdate();
		return rowsEffected;
  
 }
	

}

