<%-- <%
                        int recordsPerPage = 5;
                        int currentPage = 1;
                        if(request.getParameter("page") != null) {
                            currentPage = Integer.parseInt(request.getParameter("page"));
                        }
                        
                        Connection con = AddPassengerDao.establishConnection();
                        int totalRecords = TrainDetailsDao.getTotalRecord(con);
                        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                        
                        int start = (currentPage - 1) * recordsPerPage;
                        ResultSet rs = TrainDetailsDao.getPassengersByPages(con, start, recordsPerPage);
                    %>
                     <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getLong("pnr") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%=rs.getInt("trainnumber") %></td>
                <td><%= rs.getString("trainname")%></td>
                <td><%=rs.getString("origin") %></td>
                <td><%= rs.getString("destination")%></td>
                <td><%= rs.getString("ticketPrice")%></td>
                <td><form action="CancelBookingServlet" method="post" onclick ="return confirmDeletion();">
                                    <input type="hidden" name="pnr" value="<%= rs.getLong("pnr") %>">
                                    <script>function confirmDeletion()
                                {
                                	return confirm("Are you sure you want to delete this passenger?");
                                }
                                </script>
                                    <button class="cancel-button" style="background:red;"><i class="fas fa-trash-alt"></i>Cancel</button>
                                </form></td>
            </tr>
            <%}%> --%>
            
            
            
            
            
            
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pms.dao.*" %> 
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
    <title>View Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="dashboard.css">

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

         table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        } 

        table, th, td {
    border: 1px solid black;
    color:black;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color:#f2f2f2;
}


        .cancel-button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .cancel-button:hover {
            background-color: #c82333;
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
            <a href="AddPassenger.jsp" id="addPassenger"><i class="fas fa-user-plus"></i>Add Passenger</a> 
            <a href="ViewPassenger.jsp"  id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a>
            <a href="ViewPassengerBookings.jsp" id="searchPassenger" class="active"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a>  
            <a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a> 
            <a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div id="main">
        <h1 style="color:black">Bookings</h1>
        <div id="content">

        <table>
            <tr>
                <th>PNR</th>
                <th>Passenger Name</th>
                 <th>Age</th>
                <th>Gender</th>
                <th>Train Number</th>
                <th>Train name</th>
                <th>Origin</th>
                <th>Destination</th>
                 <th>Ticket Price</th>
                <th>Actions</th>
                
                
            </tr>
            <!-- Example Booking Data -->
             <%
                        int recordsPerPage = 5;
                        int currentPage = 1;
                        if(request.getParameter("page") != null) {
                            currentPage = Integer.parseInt(request.getParameter("page"));
                        }
                        
                        Connection con = AddPassengerDao.establishConnection();
                        int totalRecords = TrainDetailsDao.getTotalRecord(con);
                        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                        
                        int start = (currentPage - 1) * recordsPerPage;
                        ResultSet rs = TrainDetailsDao.getPassengersByPages(con, start, recordsPerPage);
                    %>
                     <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getLong("pnr") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getInt("age") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%=rs.getInt("trainnumber") %></td>
                <td><%= rs.getString("trainname")%></td>
                <td><%=rs.getString("origin") %></td>
                <td><%= rs.getString("destination")%></td>
                <td><%= rs.getString("ticketPrice")%></td>
                <td><form action="CancelAdminservlet" method="post" onclick ="return confirmDeletion();">
                                    <input type="hidden" name="pnr" value="<%= rs.getLong("pnr") %>">
                                    <script>function confirmDeletion()
                                {
                                	return confirm("Are you sure you want to delete this passenger?");
                                }
                                </script>
                                    <button class="cancel-button" style="background:red;"><i class="fas fa-trash-alt"></i>Cancel</button>
                                </form></td>
            </tr>
            <%}%>
  
        </table>
        
                     <% rs.close(); %>
                    <%con.close(); %>
    </div>
</div>

</body>
</html>
