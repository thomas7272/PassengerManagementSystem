package com.pms.action;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.pms.dao.*;

import java.io.*;




@WebServlet("/DeletePassengerDetailsServlet")
public class DeletePassengerDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		PrintWriter out = res.getWriter();
		long PNR = Long.parseLong(req.getParameter("pnr"));
		
		try {
			
			Connection con = AddPassengerDao.establishConnection();

			if(con !=null)
			{
			
				int rowsEffected=AddPassengerDao.deletePassengerDetails(con,PNR);
				
				if(rowsEffected > 0)
				{
					
					out.println("<script>");
					out.println("window.onload = function(){alert('Data Deleted Successfully!');}");
			        out.println("</script>");
//			        res.sendRedirect("ViewPassengers.jsp");
			        RequestDispatcher rd = req.getRequestDispatcher("ViewPassenger.jsp");
			        rd.include(req, res);
				}
				else
				{
					out.println("<script>");
					out.println("window.onload = function(){alert('OOPs Deletion Failed!');}");
			        out.println("</script>");
//			        res.sendRedirect("ViewPassengers.jsp");
			        RequestDispatcher rd = req.getRequestDispatcher("ViewPassenger.jsp");
			        rd.include(req, res);
				}
			}
			
		}catch(SQLException e) {
			
			System.out.println(e);
		}
	}

}
