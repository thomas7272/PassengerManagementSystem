package com.pms.action;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
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
		out.println("<script>");
		out.println("window.onload = function(){alert('Logged Out Sucessfully');}");
        out.println("</script>");
        res.sendRedirect("Home.jsp");
        
		
		
	}

}
