
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Passenger Management System</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* General Styles */
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
	background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
		url('image.jpg');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
	color: white;
}

/*     /* Navbar (Hidden Sidebar) */
.sidebar {
	position: fixed;
	top: 0;
	left: -250px;
	width: 250px;
	height: 100%;
	background-color: rgba(0, 0, 0, 0);
	color: white;
	transition: left 0.3s ease, background-color 0.3s ease;
	z-index: 1000;
	overflow-y: auto;
	box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.3);
}

.sidebar:hover {
	background-color: rgba(68, 68, 68, 1);
}

.sidebar-header {
	padding: 20px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0);
	margin-bottom: 10px;
	/*border-bottom: 1px solid #555;*/
}

.sidebar-header h2 {
	margin: 0;
	font-size: 24px;
	font-weight: bold;
	letter-spacing: 1px;
	text-align: left;
	margin-left: 30px;
	text-shadow: 1px 1px 2px black;
}

nav a {
	display: block;
	padding: 15px 20px;
	color: white;
	text-decoration: none;
	font-size: 16px;
	/*border-bottom: 1px solid #555;*/
	transition: background-color 0.3s ease, color 0.3s ease;
}

nav a i {
	margin-right: 10px;
}

nav a:hover {
	background-color: rgba(85, 85, 85, 0.7);
	color: #00bfff;
}

/* Open Sidebar Button */
.menu-toggle {
	position: absolute;
	top: 20px;
	left: 20px;
	font-size: 24px;
	color: white;
	cursor: pointer;
	z-index: 1001;
	transition: color 0.3s ease;
}

.menu-toggle:hover {
	color: #00bfff;
}

* /
	/* Main Content */
        .main-content {
	padding-top: 120px;
	text-align: center;
	color: white;
	margin-top:50px;
}

.main-content h1 {
	font-size: 48px;
	color: white;
	text-shadow: 3px 3px 5px black;
	margin-bottom: 20px;
	text-align:center;
}

.main-content p {
	font-size: 20px;
	color: #eee;
	line-height: 1.6;
	max-width: 800px;
	margin: 0 auto;
	text-align:center;
}

/* Login Cards */
.login-cards {
	display: flex;
	justify-content: center;
	margin-top: 50px;
}

.login-card {
	background-color: rgba(0, 0, 0, 0.5);
	padding: 20px;
	margin: 20px;
	width: 250px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	cursor: pointer;
	transition: transform 0.3s ease;
}

.login-card:hover {
	transform: scale(1.05);
}

.login-card h2 {
	font-size: 24px;
	margin-bottom: 10px;
}

.login-card a {
	text-decoration: none;
	color: white;
}

.login-card a:hover {
	color: #00bfff;
}
</style>
</head>

<body>
	<!--  Sidebar
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2>Menu</h2>
        </div>
        <nav>
            <a href="dashboard.jsp" id="home"><i class="fas fa-home"></i>Home</a>
            <a href="AddPassenger.jsp" class="active" id="addPassenger"><i class="fas fa-user-plus"></i>Add Passenger</a>
            <a href="ViewPassenger.jsp" id="viewPassengers"><i class="fas fa-users"></i>View Passengers</a>
            <a href="SearchPassenger.jsp" id="searchPassenger"><i class="fas fa-search"></i>Search Passenger</a>
            <a href="LogoutServlet" id="logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
        </nav>
    </div>

    Menu Toggle Button
    <div class="menu-toggle" onclick="toggleSidebar()">
        <i class="fas fa-bars"></i>
    </div> -->

	<!-- Main Content -->
	<br><br><br>
	<div class="main-content">
		<h1 styles="text-align:center;">Passenger Management System</h1>
		<p>Your one-stop solution for managing passenger information
			efficiently and effectively.</p>

<br>

<p styles="text-align:center;">Click the appropriate option below based on your designation: </p>
		<div class="login-cards">
			<div class="login-card">
				<a href="Index.jsp">
					<h2>Admin Login</h2> Login as Admin
				</a>
			</div>
			<div class="login-card">
				<a href="PassengerIndex.jsp"><h2>Passenger Login</h2> Login as Passenger</a>
			</div>
		</div>
	</div>

	<!--     JavaScript for Sidebar
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');

            if (sidebar.style.left === '0px') {
                sidebar.style.left = '-250px';
            } else {
                sidebar.style.left = '0px';
            }
        }
    </script>-->
</body>

</html>
