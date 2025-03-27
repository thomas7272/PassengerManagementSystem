package com.pms.action;
import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pms.dao.TrainDetailsDao;

@WebServlet("/CancelAdminservlet")
public class CancelAdminservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		long pnr = Long.parseLong(req.getParameter("pnr"));
		try {
			
			Connection con = TrainDetailsDao.getconnection();
			int rowsEffected = TrainDetailsDao.cancelBooking(con,pnr);
			if(rowsEffected > 0)
			{
				
				out.println("<script>");
				out.println("window.onload = function(){alert('Data Deleted Successfully!');}");
		        out.println("</script>");
//		        res.sendRedirect("ViewPassengers.jsp");
		        RequestDispatcher rd = req.getRequestDispatcher("ViewPassengerBookings.jsp");
		        rd.include(req, res);
			}
			else
			{
				out.println("<script>");
				out.println("window.onload = function(){alert('OOPs Deletion Failed!');}");
		        out.println("</script>");
//		        res.sendRedirect("ViewPassengers.jsp");
		        RequestDispatcher rd = req.getRequestDispatcher("ViewPassengerBookings.jsp");
		        rd.include(req, res);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
