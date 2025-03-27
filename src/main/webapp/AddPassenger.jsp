<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Passenger</title>
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
            <a href="dashboard.jsp"  id="home"><i class="fas fa-home"></i>Home</a> 
            <a href="AddPassenger.jsp" id="addPassenger" class="active" ><i class="fas fa-user-plus"></i>Add Passenger</a> 
            <a href="ViewPassenger.jsp" id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a>
            <a href="ViewPassengerBookings.jsp" id="searchPassenger"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a>  
            <a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a> 
            <a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
	</div>
	<div id="main">
	<header>	<h2 style="color:black;">Add New Passenger</h2></header>
<div id="content">

	<form id="addPassengerForm" action="AddPassengerServlet" method="post">

<!-- 		<input type="text" id="pnr" name="pnr" placeholder="PNR Number"required> -->
	    <input type="text" id="name" name="name"placeholder="Passenger Name" required>
	    <input type="number" id="age" name="age" placeholder="Age" required min="18" title="Age must be above 18"> 
	    <select id="gender"
			name="gender" required>
			<option value="">Select Gender</option>
			<option value="Male">Male</option>
			<option value="Female">Female</option>
			<option value="Other">Other</option>
		</select> 
		<input type="text" id="trainNumber" name="trainNumber" placeholder="Train Number" required maxlength="6" pattern="\d{6}" title="Train Number must be exactly 6 digits">
	    <input type="text" id="origin" name="origin" placeholder="Origin" required>
		<input type="text" id="destination" name="destination"placeholder="Destination"  required> 
		<input type="number" id="price" name="price" placeholder="Ticket Price" required min="50">

		<button type="submit" class="btn">Add Passenger</button>
	</form>
</div>
</div>
<script>
    const origin = document.getElementById("origin");
    const destination = document.getElementById("destination");

    function validatePassword() {
        if (origin.value == destination.value) {
            confirmPassword.setCustomValidity("origin and destination should not be same!");
        } else {
            confirmPassword.setCustomValidity("");
        }
    }

    origin.addEventListener("change", validatePassword);
    destination.addEventListener("keyup", validatePassword);

    </script>
</body>
</html>


 