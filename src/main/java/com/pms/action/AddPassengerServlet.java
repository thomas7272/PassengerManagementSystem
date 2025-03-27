package com.pms.action;
import com.pms.dao.*;
import com.pms.model.*;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.*;



@WebServlet("/AddPassengerServlet")
public class AddPassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();	
		
		String Passengername = req.getParameter("name");
		int age= Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String orgin = req.getParameter("origin");
		String Destination = req.getParameter("destination");
		int Trainnumber= Integer.parseInt(req.getParameter("trainNumber"));
		int Ticketprice = Integer.parseInt(req.getParameter("price"));
		
		
		Connection  con=null;
		try
		{
			res.setContentType("text/html");
			  con = AddPassengerDao.establishConnection();
			if(con != null)
			{
				
			PassengerDetailsModel pdm = new PassengerDetailsModel(Passengername,age,gender,Trainnumber,orgin,Destination,Ticketprice);
			int rowsEffected =  AddPassengerDao.insertDetails(con, pdm);
			
			if(rowsEffected > 0)
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('Data Inserted Successfully!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("ViewPassenger.jsp");
		        rd.include(req, res);
		        
		        
//		        res.sendRedirect("ViewPassengers.jsp");
			}else
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('OOPs Insertion Failed!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("AddPassenger.jsp");
		        rd.include(req, res);
//		        res.sendRedirect("AddPassenger.jsp");
		        
			}
			
			
			
			}
			else
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('Connection Failed!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("AddPassenger.jsp");
		        rd.include(req, res);
//		        res.sendRedirect("AddPassenger.jsp");
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}finally {
			try {
				con.close();;
			}catch(SQLException e) {
				System.out.println(e);
			}
		}
		
		
	}
	

}
