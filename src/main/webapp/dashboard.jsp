
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
    <title>Travel Agent Dashboard - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
        	padding: 0;
        	font-family: 'Arial', sans-serif;
        	background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('image.jpg');
        	background-repeat: no-repeat;
        	color:white;
        
        	

        }

        #sidebar {
            width: 250px;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px 0;
            height: 100vh;
            color: white;
            transition: all 0.3s ease;
        }

        .sidebar-header {
            text-align: center;
            padding: 20px 0 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        #sidebar nav a {
            display: block;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        #sidebar nav a:hover, #sidebar nav a.active {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateX(10px);
        }

        #sidebar nav a.active {
            border-left: 4px solid #3498db;
        }

        #main {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
                       
                background-color: rgba(255, 255, 255, 0.8);
            
        }

        header h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5em;
        }

        .welcome-message {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome-message h2 {
            color: #3498db;
            margin-bottom: 10px;
        }

        .feature-highlights {
            display: flex;
            justify-content: space-around;
            margin-bottom: 40px;
        }

        .feature {
            text-align: center;
            padding: 20px;
           /* background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); */
            transition: transform 0.3s ease;
            margin-top:60px;
            
            
             backdrop-filter: blur(5px);

background-color: rgba(255, 255, 255, 0.13);

border-radius:20px;

border: 2px solid rgba(255, 255, 255, 0.1);

box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);

color: white;
        }

        .feature:hover {
            transform: translateY(-10px);
        }

        .feature i {
            color: #3498db;
            margin-bottom: 15px;
        }

        .feature h3 {
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .feature p{
        }

        .cta-section {
            text-align: center;
            background-color: #3498db;
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-top:130px;
        }

        .cta-section h3 {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div id="sidebar">
        <div class="sidebar-header">
            <h2>Travel Agent</h2>
             <h4><%= username %></h4>
        </div>
       <nav>
            <a href="dashboard.jsp"  id="home"><i class="fas fa-home"></i>Home</a> 
            <a href="AddPassenger.jsp" id="addPassenger"  ><i class="fas fa-user-plus"></i>Add Passenger</a> 
            <a href="ViewPassenger.jsp" id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a>
            <a href="ViewPassengerBookings.jsp" id="searchPassenger"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a>  
            <a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a> 
            <a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div id="main">
        <header>
            <h1 style="color:black">Welcome to our Passenger Management System</h1>
        </header>
        <div id="content">
            <div class="welcome-message">
                <h2>Embark on a Journey of Efficiency</h2>
                <p>Your one-stop solution for managing passenger bookings and travel arrangements.</p>
            </div>
            <div class="feature-highlights">
                
               <div class="feature">
                    <a href=AddPassenger.jsp><i class="fas fa-user-plus fa-3x"></i></a>
                    <h3>Quick Add</h3>
                    <p style="color:black">Seamlessly add new passengers to your roster.</p>
                </div>
                <div class="feature">
                    <a href=ViewPassenger.jsp><i class="fas fa-users fa-3x"></i></a>
                    <h3>Passenger Overview</h3>
                    <p style="color:black">Get a bird's eye view of all your travelers.</p>
                </div>
                <div class="feature">
                    <a href=SearchPassenger.jsp><i class="fas fa-search fa-3x"></i></a>
                    <h3>Smart Search</h3>
                    <p style="color:black">Find passenger details in an instant.</p>
                </div>
            </div>
            <div class="cta-section">
                <h3>Ready to streamline your travel management?</h3>
                <p>Start by adding a new passenger or viewing your current bookings!</p>
            </div>
        </div>
    </div>

    
</body>
</html>
