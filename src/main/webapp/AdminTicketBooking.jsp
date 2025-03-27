<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pms.dao.*" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Tickets</title>
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
            color: white;
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

        table
        {
            width: 100%;
            border-collapse: collapse;
        }
         th, td {
			    border: 1px solid #ddd;
			    padding: 10px;
			    text-align: left;
			    color: #333; 
				}

		th {
			  background-color: #c4c0c0;
			}

#main {
    flex: 1;
    padding: 40px;
    overflow-y: auto;
    background-color: rgba(255, 255, 255, 0.8); 
}
        .book-button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .book-button:hover {
            background-color: #2ecc71;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div id="sidebar">
        <div class="sidebar-header">
            <h2>Passenger</h2>
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
        <h1 style="color:black">Available Trains</h1>
        <table>
            <tr>
                <th>Train Number</th>
                <th>Train Name</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Price</th>
                <th>Book</th>
            </tr>
            <!-- Example Train Data -->
            <% 
            	Connection con = TrainDetailsDao.getconnection();
            	ResultSet rs = TrainDetailsDao.retriveTrainData(con);

            %> 
            <% while(rs.next()) { %>
            <tr>
            
                <td><%= rs.getInt("trainnumber") %></td>
                <td><%= rs.getString("trainname")%></td>
                <td><%= rs.getString("origin")%></td>
                <td><%= rs.getString("destination")%></td>
                <td><%= rs.getInt("ticketPrice")%></td>
                <td>
                    			<form action="Add.jsp" method="get" onclick ="return confirmBooking();">
                                    <input type="hidden" name="trainnumber" value="<%= rs.getLong("trainnumber") %>">
                                    <input type="hidden" name="trainname" value="<%= rs.getString("trainname") %>">
                                    <input type="hidden" name="origin" value="<%= rs.getString("origin") %>">
                                    <input type="hidden" name="destination" value="<%= rs.getString("destination") %>">
                                    <input type="hidden" name="ticketPrice" value="<%= rs.getInt("ticketPrice") %>">
                                    <script>
                                    function confirmBooking()
                                		{
                                			return confirm("Are you sure?? you want to Book Ticket?");
                                		}
                                </script>
                                    <button class="book-button">Book</button>
                                </form>
                </td>
            </tr>
            <%} %>
            <!-- Add more train data here -->
        </table>
    </div>


</body>
</html>
