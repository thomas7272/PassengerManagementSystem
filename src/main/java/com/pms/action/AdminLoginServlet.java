package com.pms.action;
import com.pms.dao.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
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
			{  String Query = "select * from Login where Email = ? and Password = ?";
				smnt = con.prepareStatement(Query);
				smnt.setString(1,Email);
				smnt.setString(2,Password);
			    rs = smnt.executeQuery();
				
				if(rs != null && rs.next()) 
				{
					String Username = rs.getString(5);
					String status = rs.getString(4);
					
					if(status.equalsIgnoreCase("Active"))
					{
						
					    HttpSession session = req.getSession();
					    session.setAttribute("username",Username);
					    out.println("<script>");
						 out.println("window.onload = function(){alert('Login Successfully');}");
						 out.println("</script>");
					    res.sendRedirect("dashboard.jsp");
					
					}
					else
					{
						
						 out.println("<script>");
						 out.println("window.onload = function(){alert('Admin is Inactive');}");
						 out.println("</script>");
					     res.sendRedirect("Index.jsp?error = InActive Admin"); 
						
					}
				}
				else
				{
					 out.println("<script>");
					out.println("window.onload = function(){alert('Invalid Credentials');}");
					out.println("</script>");
					 res.sendRedirect("Index.jsp?error = Invalid Credentials"); 
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
