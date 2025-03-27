package com.pms.action;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PassengerLogoutServlet")
public class PassengerLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("html/text");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession(false);
		if(session!=null)
		{
			session.setAttribute("username",null);
			session.invalidate();
		}

        res.sendRedirect("Home.jsp");
		out.println("<script>");
		out.println("window.onload = function(){alert('Logged Out Sucessfully');}");
        out.println("</script>");
        
		
		
	}

}
