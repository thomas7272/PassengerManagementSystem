package com.pms.action;
import com.pms.dao.*;
import com.pms.model.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import java.sql.*;



@WebServlet("/UpdatePassengerDetailsServlet")
public class UpdatePassengerDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out = res.getWriter();
		long PNR = Long.parseLong(req.getParameter("pnr"));
		String Passengername = req.getParameter("name");
		int age= Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String orgin = req.getParameter("origin");
		String Destination = req.getParameter("destination");
		int Trainnumber= Integer.parseInt(req.getParameter("trainNumber"));
		int Ticketprice = Integer.parseInt(req.getParameter("price"));
		
		
		
		try 
		{
			GetPassengerDetailsModel gpdm = new GetPassengerDetailsModel(PNR,Passengername, age, gender,Trainnumber, orgin,Destination,  Ticketprice);
			Connection  con = AddPassengerDao.establishConnection();
			if(con !=null)
			{
			
				int rowsEffected  = AddPassengerDao.updatePassengerDetails(con ,gpdm);
				
				if(rowsEffected > 0)
				{
					out.println("<script>");
					out.println("window.onload = function(){alert('Data Updated Successfully!');}");
			        out.println("</script>");
//			        res.sendRedirect("ViewPassengers.jsp");
			        RequestDispatcher rd = req.getRequestDispatcher("ViewPassenger.jsp");
			        rd.include(req, res);
				}
				else
				{
					out.println("<script>");
					out.println("window.onload = function(){alert('OOPs Insertion Failed!');}");
			        out.println("</script>");
//			        res.sendRedirect("ViewPassengers.jsp");
			        RequestDispatcher rd = req.getRequestDispatcher("ViewPassenger.jsp");
			        rd.include(req, res);
				}
				con.close();
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
