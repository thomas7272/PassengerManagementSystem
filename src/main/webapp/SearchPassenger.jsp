<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pms.dao.*" %>
<%
   String username = (String) session.getAttribute("username");
   if(session == null || username == null)
   {
	   response.sendRedirect("Index.jsp");
	   return;
   } 
%>

 <!DOCTYPE html>
 <%@ page import="javax.servlet.http.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Passenger</title>
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
			<a href="SearchPassenger.jsp" class="active" id="searchPassenger"><i class="fas fa-search"></i> Search Passenger</a>
			<a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
			
			<a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>
    <script type="text/javascript">
    function searchPassenger() {
        let filter = document.getElementById("searchInput").value.toUpperCase();
        let table = document.getElementById("passengerTable");
        let rows = table.getElementsByTagName("tr");

        for (let i = 1; i < rows.length; i++) {
            let cells = rows[i].getElementsByTagName("td");
            let match = false;

            for (let j = 0; j < cells.length - 1; j++) { 
            	// Excluding actions column
                if (cells[j].children[0].value.toUpperCase().includes(filter)) {
                    match = true;
                    break;
                }
            }
            rows[i].style.display = match ? "" : alert("no details found");
        }
    }
    
    </script>
    <div id="main">
        <header>
            <h2 style="color:black;">Search Passenger</h2>
        </header>
        <div id="content">
            <form id="searchPassengerForm" >
                <input type="text" id="searchQuery" placeholder="Search by PNR"  name="pnr"
       style="width: 100%; max-width: 750px;  font-size: 18px; display: block; margin: 10px auto; text-align: center; padding: 10px;">

		

<button type="submit" class="btn" 
        style="width: 100%; max-width: 200px; display: block; margin: 10px auto; text-align: center;">Search</button>          
 </form>

            <div id="searchResults">
            <table>
            <thead>
                <tr>
                    <th>PNR</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Train Number</th>
                    <th>Origin</th>
                    <th>Destination</th>
                    <th>Price</th>          
                    
                </tr>
            </thead>
            <tbody>
            
                <% 
                		
                		
                    	Connection con = AddPassengerDao.establishConnection();
                    	ResultSet rs = AddPassengerDao.retriveData(con);
                 %>
                <%while(rs!= null && rs.next()) { %>
                 <tr>
                 		<td><%= rs.getLong("PNR") %></td>
                        <td><%= rs.getString("PassengerName") %></td>
                        <td><%= rs.getInt("age") %></td>
                        <td><%= rs.getString("Gender") %></td>
                        <td><%= rs.getInt("TrainNumber") %></td>
                        <td><%= rs.getString("Origin") %></td>
                        <td><%= rs.getString("Destination") %></td>
                        <td><%= rs.getInt("price") %></td>
                        
                    </tr>  
                                      
                 <%}%>
            </tbody>
        </table>
            </div>
        </div>
    </div>
</body>
</html>
  --%>
  
  
  
  
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
    <title>Search Passenger</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            <a href="SearchPassenger.jsp" id="searchPassenger" class="active"><i class="fas fa-search"></i> SearchPassenger</a> 
            <a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>
    <div id="main">
        <header>
            <h2 style="color:black;">Search Passenger</h2>
        </header>
        <div id="content">
            <form id="searchPassengerForm" action="SearchPassenger.jsp" method="post">
                <input type="text" id="searchQuery" name="searchTerm" placeholder="Search by PNR or Name" 
                       style="width: 100%; max-width: 750px; font-size: 18px; display: block; margin: 10px auto; text-align: center; padding: 10px;">
                <button type="submit" class="btn" 
                        style="width: 100%; max-width: 200px; display: block; margin: 10px auto; text-align: center;">Search</button>
            </form>
            <div id="searchResults">
                <table id="passengerTable">
                    <thead>
                  
                        <tr>
                            <th>PNR</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Train Number</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String searchTerm = request.getParameter("searchTerm");
                            Connection con = AddPassengerDao.establishConnection();
                            ResultSet rs;
                            if (searchTerm != null && !searchTerm.isEmpty()) {
                                rs = AddPassengerDao.searchPassengers(con, searchTerm);
                            } else {
                                rs = AddPassengerDao.retriveData(con);
                            }
                            if(rs!=null ){
                            	request.setAttribute("message","No passengers found");
                            }
                            
                            while(rs != null && rs.next()) { 
                        %>
                        <tr>
                            <td><%= rs.getLong("PNR") %></td>
                            <td><%= rs.getString("PassengerName") %></td>
                            <td><%= rs.getInt("age") %></td>
                            <td><%= rs.getString("Gender") %></td>
                            <td><%= rs.getInt("TrainNumber") %></td>
                            <td><%= rs.getString("Origin") %></td>
                            <td><%= rs.getString("Destination") %></td>
                            <td><%= rs.getInt("price") %></td>
                        </tr>
                        <%}%>
                         
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function searchPassenger() {
            let filter = document.getElementById("searchQuery").value.toUpperCase();
            let table = document.getElementById("passengerTable");
            let rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                let cells = rows[i].getElementsByTagName("td");
                let match = false;

                for (let j = 0; j < cells.length; j++) { 
                    if (cells[j].textContent.toUpperCase().includes(filter)) {
                        match = true;
                        break;
                    }
                }
                rows[i].style.display = match ? "" : "none";
            }
        }
        document.getElementById('searchPassengerForm').addEventListener('submit', function(e) {
            e.preventDefault();
            searchPassenger();
            // If you want to submit the form for server-side filtering, remove e.preventDefault();
        });
    </script>
</body>
</html>
  