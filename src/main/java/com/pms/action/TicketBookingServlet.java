package com.pms.action;
import com.pms.model.*;
import com.pms.dao.*;
import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/TicketBookingServlet")
public class TicketBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession(false);
		String gmail = (String) session.getAttribute("gmail");
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		int trainnumber = Integer.parseInt(req.getParameter("trainnumber"));
		String trainname = req.getParameter("trainname");
		String origin = req.getParameter("origin");
		String destination = req.getParameter("destination");
		int ticketPrice = Integer.parseInt(req.getParameter("ticketPrice"));
		BookingDetailsModel bdm = new BookingDetailsModel(gmail,name,age,gender,trainnumber,trainname, origin, destination, ticketPrice);
		Connection con = null;
		try
		{
			con = TrainDetailsDao.getconnection();
			int rowsEffected = TrainDetailsDao.insertBookingDetails(con, bdm);
			if(rowsEffected >0)
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('Ticket Booked Successfully!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("ViewBookings.jsp");
		        rd.include(req, res);
			}
			else
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('OOps Ticket Not Booked!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("BookTickets.jsp");
		        rd.include(req, res);
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		finally
		{
			
			try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		
		
		
		
	}

}
