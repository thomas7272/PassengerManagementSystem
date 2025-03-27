<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>View Passengers</title>
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
            <a href="AddPassenger.jsp" id="addPassenger"><i class="fas fa-user-plus"></i>Add Passenger</a> 
            <a href="ViewPassenger.jsp" class="active" id="viewPassengers"><i class="fas fa-users"></i> View Passengers</a>
            <a href="ViewPassengerBookings.jsp" id="searchPassenger"><i class="fas fa-ticket-alt fa"></i>Passenger Bookings</a>  
            <a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i> SearchPassenger</a> 
            <a href="createAccount.jsp"  id="addPassenger"><i class="fas fa-user-plus"></i>Create Account</a> 
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>
    <div id="main" style="color:black;">
        <header> <h2>View Passenger List</h2></header>
        <div id="content">
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
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int recordsPerPage = 5;
                        int currentPage = 1;
                        if(request.getParameter("page") != null)
                        {
                            currentPage = Integer.parseInt(request.getParameter("page"));
                        }
                        
                        Connection con = AddPassengerDao.establishConnection();
                        int totalRecords = AddPassengerDao.getTotalRecords(con);
                        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                        
                        int start = (currentPage - 1) * recordsPerPage;
                        ResultSet rs = AddPassengerDao.getPassengersByPage(con, start, recordsPerPage);
                    %>
                    <% while(rs.next()) { %>
                        <tr>
                            <td><%= rs.getLong("PNR") %></td>
                            <td><%= rs.getString("PassengerName") %></td>
                            <td><%= rs.getInt("age") %></td>
                            <td><%= rs.getString("Gender") %></td>
                            <td><%= rs.getInt("TrainNumber") %></td>
                            <td><%= rs.getString("Origin") %></td>
                            <td><%= rs.getString("Destination") %></td>
                            <td><%= rs.getInt("price") %></td>
                            <td><div style="display: flex; flex-direction: horizontal;">
                                <form action="EditPassenger.jsp" method="get">
                                    <input type="hidden" name="pnr" value="<%= rs.getLong("PNR") %>">
                                    <input type="hidden" name="PassengerName" value="<%= rs.getString("PassengerName") %>">
                                    <input type="hidden" name="age" value="<%= rs.getInt("age") %>">
                                    <input type="hidden" name="Gender" value="<%= rs.getString("Gender") %>">
                                    <input type="hidden" name="TrainNumber" value="<%= rs.getInt("TrainNumber") %>">
                                    <input type="hidden" name="Origin" value="<%= rs.getString("Origin") %>">
                                    <input type="hidden" name="Destination" value="<%= rs.getString("Destination") %>">
                                    <input type="hidden" name="price" value="<%= rs.getInt("price") %>">
                                    <button class="btna "><i class="fas fa-edit"></i> Edit</button><br>
                                </form>
                                
                                
                              
                                <form action="DeletePassengerDetailsServlet" method="post" onclick ="return confirmDeletion();">
                                    <input type="hidden" name="pnr" value="<%= rs.getLong("PNR") %>">
                                    <script>function confirmDeletion()
                                {
                                	return confirm("Are you sure you want to delete this passenger?");
                                }
                                </script>
                                    <button class="btna " style="background:red;"><i class="fas fa-trash-alt"></i> Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>  
                    <%}%>
                      <% rs.close(); %>
                    <%con.close(); %>
                </tbody>
            </table>
            
<%--             <!-- Pagination Links -->
            <div style="text-align: center;">
            
                <% if(currentPage > 1) { %>
                   <div style="margin-top: 10px;"> <a href="ViewPassenger.jsp?page=<%=currentPage - 1%>"><button class="btna">Previous</button></a></div>
                <% } %>
                 
                <p><%= currentPage%>
                <% if(currentPage < totalPages) { %>
                   <div style="margin-top: 10px;"> <a href="ViewPassenger.jsp?page=<%=currentPage + 1%>"><button class="btna ">Next</button></a></div></p>
                <% } %> --%>
                <div class="pagination" id="pagination">
    <button id="prev" class="btna" onclick="location.href='ViewPassenger.jsp?page=<%=currentPage - 1%>'" <%=currentPage == 1 ? "disabled" : ""%>>Previous</button>
    <span id="pageInfo">Page <span id="currentPage"><%=currentPage %></span> of <span id="totalPages"><%=totalPages %></span></span>
    <button id="next" class="btna" onclick="location.href='ViewPassenger.jsp?page=<%=currentPage + 1%>'" <%=currentPage == totalPages ? "disabled" : ""%>>Next</button>
</div>
                
            </div>
            </div>
        </div>
    </div>
</body>
</html>