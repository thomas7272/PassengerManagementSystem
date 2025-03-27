package com.pms.action;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.pms.dao.CreatePassengerDao;
import com.pms.model.CreatePassengerModel;


@WebServlet("/CreatePassengerServlet")
public class CreatePassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		
		String 	fullName = req.getParameter("userName");
		
		String email = req.getParameter("email");
		String password= req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		long phone= Long.parseLong(req.getParameter("phone"));
		CreatePassengerModel cpm = new CreatePassengerModel(fullName,email,password,confirmPassword,phone);
		try
		{
			PrintWriter out = res.getWriter();
			Connection con = CreatePassengerDao.establishConnection();
			int rowsEffected = CreatePassengerDao.insertDetails( con, cpm);
			if(rowsEffected >0)
			{
				
				out.println("<script>");
				out.println("window.onload = function(){alert('Insertion Successful!');}");
		        out.println("</script>");
		        RequestDispatcher rd = req.getRequestDispatcher("createAccount.jsp");
		        rd.include(req, res);
				
			}
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		
	}

}
