<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Agent Portal</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h2>Admin Login</h2>
            <form action="AdminLoginServlet" method="post">
                <div class="input-group">
                    <input type="email" id="userId" name="userId" required > <!-- minlength="8" pattern="[A-Za-z0-9]{8,}"title="User Id should be Minimum 8 characters with alphanumeric characters"> -->
                    <label for="userId">Email <i class="fas fa-user"></i></label>
                    <span class="error" id="userIdError"></span>
                </div>
                <div class="input-group">
                    <input type="password" id="password" name="password" pattern="(?+>*\d)(?=.*[\W_]).{10,}" title="Password must be at least 10 characters long annd include at least one uppercase letter, one number and one special character. " required>
                    <label for="password">Password <i class="fas fa-lock"></i></label>
                    <span class="error" id="passwordError"></span>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
           <!--  <p style="text-align: center;">Don't have an account? <a href="createAccount.jsp" style="color: #03a9f4;">Create one</a></p> -->
        </div>
    </div>
</body>
</html>
