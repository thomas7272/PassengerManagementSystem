<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*"%>
<%
   HttpSession ses = request.getSession(false);
   
   if(ses == null || session.getAttribute("username") == null )
   {
	   response.sendRedirect("Index.jsp");
	   return;
   } 
   String username = (String) session.getAttribute("username");
   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragme", "no-cache");
   response.setDateHeader("Expires",0);
   
%>
<%
	long pnr = Long.parseLong(request.getParameter("pnr"));
	String PassengerName = request.getParameter("PassengerName");
	int age = Integer.parseInt(request.getParameter("age"));
	String Gender = request.getParameter("Gender");
	int TrainNumber = Integer.parseInt(request.getParameter("TrainNumber"));
	String Origin = request.getParameter("Origin");
	String Destination = request.getParameter("Destination");
	int price = Integer.parseInt(request.getParameter("price"));



 %>-->
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
			<a href="AddPassenger.jsp" id="addPassenger"><i class="fas fa-user-plus"></i>Add Passenger</a> 
			<a href="ViewPassenger.jsp" id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a> 
			<a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a>
			 <a href="ViewPassengerBookings.jsp" id="searchPassenger"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a>   
			<a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
			
			<a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
		</nav>
	</div>
	<% %>
	<div id="content">
    <form id="editPassengerForm" action="UpdatePassengerDetailsServlet" method="post">

    <h2>Edit Passenger</h2>
        <label for="editPNR">PNR:</label>
        <input style="background-color: #d3d3d3; cursor:not-allowed;" type="text" id="editPNR" name="pnr" value="<%= pnr %>" readonly>
        <label for="editName">Name:</label>
        <input type="text" id="editName" name="name" value="<%= PassengerName %>" required>
        <label for="editAge">Age:</label>
        <input type="number" id="editAge" name="age" value="<%= age %>" required>
        <label for="editGender">Gender:</label>
         <select name="gender">
	    		<option value="Male" <%= (Gender != null && "Male".equals(Gender)) ? "selected" : "" %>>Male</option>
	    		<option value="Female" <%= (Gender != null && "Female".equals(Gender)) ? "selected" : "" %>>Female</option>
	    		<option value="Other" <%= (Gender != null && "Other".equals(Gender)) ? "selected" : "" %>>Other</option>
		</select>
        <label for="editOrigin">Origin:</label>
        <input type="text" id="editOrigin" name="origin" value="<%= Origin %>" required>
        <label for="editDestination">Destination:</label>
        <input type="text" id="editDestination" name="destination" value="<%= Destination %>" required>
        <label for="editTrainNumber">Train Number:</label>
        <input type="text" id="editTrainNumber" name="trainNumber" value="<%= TrainNumber %>" required> 
        <label for="editPrice">Price:</label>
        <input type="number" id="editPrice" name="price" value="<%= price %>" required>
        
        <button type="submit" class="btn">Update Passenger</button>
    </form>
    </div>
</body>
</html>
