# Passenger Management System

## Project Overview
The **Passenger Management System** is a web-based application developed using JSP, Servlets, and SQLite. It provides functionalities for managing passenger records, including registration, searching, updating details, and deletion. The system follows structured data handling and ensures seamless user interaction.

## Features
### Admin Module
- **Passenger Management**: Add, update, delete, and view passenger records.
- **Search Passengers**: Find passengers using their PRN (Passenger Reference Number).
- **Pagination Support**: View passengers with pagination for better navigation.

### User Module
- **Passenger Registration**: Register new passengers with a unique PRN and validated inputs,User Authentication.
- **Profile Management**: Update personal details (name, city, etc.).
- **Booking Management**: View and manage ticket bookings.

## Technologies Used
- **Programming Language**: Java (JSP, Servlets)
- **IDE**: Eclipse
- **Database**: SQLite
- **Libraries**: JDBC (for database connectivity)
- **Web Server**: Apache Tomcat

## Installation & Setup
### Prerequisites
- Java Development Kit (JDK) installed
- Eclipse IDE setup
- SQLite Database configured
- Apache Tomcat Server installed

### Steps to Run the Project
1. **Clone or Download the Repository**
2. **Open Eclipse** and import the project.
3. **Configure Database:**
   - Ensure SQLite database file is placed in the correct directory.
   - Update database connection settings in the configuration file.
4. **Deploy on Tomcat:**
   - Run the project on the Apache Tomcat server.
   - Access the web interface via `http://localhost:8080/PassengerManagementSystem`

## Database Schema (Basic Tables)
- **Passenger** (`prn`, `name`, `age`, `gender`, `email`, `city`, `mobile_number`)
- **Bookings** (`booking_id`, `prn`, `train_id`, `seat_number`, `status`)

## Future Enhancements
- Add an online ticket booking system with real-time availability.
- Improve UI with modern frameworks like Bootstrap or React.
