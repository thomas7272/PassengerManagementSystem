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
    <title>Create Account</title>
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
			<a href="AddPassenger.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Add Passenger</a> 
			<a href="ViewPassenger.jsp" id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a> 
			<a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a> 
			<a href="ViewPassengerBookings.jsp" id="searchPassenger"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a> 
			<a href="createAccount.jsp" class="active" id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
			
			<a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
		</nav>
	</div>
    <div class="container">
        <div class="login-box">
            <h2>Create Account</h2>
            <form action="CreatePassengerServlet" method="post">
<!--                 <div class="input-group">
                    <input type="text" id="userId" name="userId" required minlength="8" pattern="[A-Za-z0-9]{8,}" title="User ID should be minimum 8 alphanumeric characters">
                    <label for="userId">User ID <i class="fas fa-user"></i></label>
                </div> -->
                <div class="input-group">
                    <input type="text" id="userName" name="userName" required>
                    <label for="userName">Full Name <i class="fas fa-user"></i></label>
                </div>
                <div class="input-group">
                    <input type="email" id="email" name="email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
           title="Enter a valid email address (e.g., user@example.com)" required>
                    <label for="email">Email <i class="fas fa-envelope"></i></label>
                </div>
                <div class="input-group">
                    <input type="password" id="password" name="password" required minlength="8">
                    <label for="password">Password <i class="fas fa-lock"></i></label>
                </div>
                <div class="input-group">
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <label for="confirmPassword">Confirm Password <i class="fas fa-lock"></i></label>
                </div>
                <div class="input-group">
                    <input type="tel" id="phone" name="phone" required pattern="[6-9][0-9]{9}" title="Enter a valid phone number">
                    <label for="phone">Phone <i class="fas fa-phone"></i></label>
                </div>
                <button type="submit" class="btn">Register</button>
            </form>
          <!--   <p  style="text-align: center;" >Already have an account? <a href="Index.jsp" style="color: #03a9f4;">Sign in</a></p> -->
        </div>
    </div>
    <script>
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmPassword");

    function validatePassword() {
        if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("Passwords do not match!");
        } else {
            confirmPassword.setCustomValidity("");
        }
    }

    password.addEventListener("change", validatePassword);
    confirmPassword.addEventListener("keyup", validatePassword);

    </script>
</body>
</html>
