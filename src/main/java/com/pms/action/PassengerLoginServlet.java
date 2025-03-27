package com.pms.action;
import com.pms.dao.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;


@WebServlet("/PassengerLoginServlet")
public class PassengerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out = res.getWriter();
		Connection con = null;
		PreparedStatement smnt = null;
		ResultSet rs = null;
		String Email = req.getParameter("userId");
		String Password = req.getParameter("password");
		try
		{
			con =  LoginDao.establishConnection();
			if(con!=null)
			{  String Query = "select * from Passenger where Email = ? and Password = ?";
				smnt = con.prepareStatement(Query);
				smnt.setString(1,Email);
				smnt.setString(2,Password);
			    rs = smnt.executeQuery();
				
				if(rs != null && rs.next()) 
				{
					String Username = rs.getString(1);
					HttpSession session = req.getSession();
					session.setAttribute("username",Username);
					session.setAttribute("gmail", rs.getString(2));
					out.println("<script>");
					 out.println("window.onload = function(){alert('Login Successfully');}");
					 out.println("</script>");
					res.sendRedirect("Passenger_dashboard.jsp");
					
					
				}
				else
				{
					 out.println("<script>");
					 out.println("window.onload = function(){alert('Incorrect Credentials');}");
					 out.println("</script>");

					res.sendRedirect("PassengerIndex.jsp?error = Incorrect Credentials");
				}

			}
			
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}finally
		{
			try
			{
				if(rs!=null)
				{
					rs.close();
				}
				if(smnt!=null)
				{
					smnt.close();
				}
				if(con != null)
				{
					con.close();
				}
			}catch(SQLException e)
			{
				System.out.println(e);
			}
		}
		
		
	}

}
