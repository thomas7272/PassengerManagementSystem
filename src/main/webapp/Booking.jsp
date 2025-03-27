<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*"%>
<%
   HttpSession ses = request.getSession(false);
   
   if(ses == null || session.getAttribute("username") == null )
   {
	   response.sendRedirect("PassengerIndex.jsp");
	   return;
   } 
   String username = (String) session.getAttribute("username");
   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragme", "no-cache");
   response.setDateHeader("Expires",0);
   
%> 
<%
	int trainnumber = Integer.parseInt(request.getParameter("trainnumber"));
	String trainname = request.getParameter("trainname");
	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	int ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));



 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Passenger</title>
    <link rel="stylesheet" href="dashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>
<body>
<div id="sidebar">
		<div class="sidebar-header">
			<h2>Travel Agent</h2>
			<h4><%= username %></h4>
		</div>
        <nav>
            <a href="dashboard.jsp" id="home"><i class="fas fa-home"></i>Home</a>
            <a href="BookTickets.jsp" class="active" id="bookTickets"><i class="fas fa-ticket-alt"></i>Book Tickets</a>
            <a href="ViewBookings.jsp" id="viewBookings"><i class="fas fa-users"></i> View Bookings</a>
            <a href="PassengerLogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
	</div>
	<% %>
	<div id="content">
    <form id="editPassengerForm" action="TicketBookingServlet" method="post">

    <h2>Edit Passenger</h2>
        
        <label for="editName">Name:</label>
        <input type="text" id="editName" name="name" required>
        <label for="editAge">Age:</label>
        <input type="number" id="editAge" name="age" required>
        <label for="editGender">Gender:</label>
         <select name="gender">
	    		<option value="Male">Male</option>
	    		<option value="Female">Female</option>
	    		<option value="Other">Other</option>
		</select>
		<label for="editPNR">TrainNumber:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editPNR" name="trainnumber" value="<%= trainnumber %>" readonly>
        <label for="editPNR">TrainName:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editTrainNumber" name="trainname" value="<%= trainname %>" readonly>
        <label for="editOrigin">Origin:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editOrigin" name="origin" value="<%= origin %>" readonly>
        <label for="editDestination">Destination:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editdestination" name="destination" value="<%= destination %>" readonly>
        <label for="editticketPrice">TicketPrice:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editticketPrice" name="ticketPrice" value="<%= ticketPrice %>" readonly>
        
        
        <button type="submit" class="btn">Book Ticket</button>
    </form>
    </div>
</body>
</html>
