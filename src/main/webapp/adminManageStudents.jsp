<!DOCTYPE html>
<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<%
    // Check if the admin is logged in; if not, redirect to the login page
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin");
        return;
    }
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Manage Students || Student Work Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS links -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="main-wrapper">
        <!-- Admin Header -->
        <%@ include file="adminHeader.jsp" %>

        <!-- Breadcrumb Section -->
        <div class="breadcrumb-area" style="background-image: url('assets/images/bg/breadcrumb-bg-01.jpg');" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Manage Students</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Manage Students</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <main class="page-content">
            <div class="dashboard-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4 class="mb-4">Student List</h4>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Registration Number</th>
                                            <th>Full Name</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty students}">
                                                <c:forEach var="student" items="${students}">
                                                    <tr>
                                                        <td><c:out value="${student.id}" /></td>
                                                        <td><c:out value="${student.registrationNumber}" /></td>
                                                        <td><c:out value="${student.fullName}" /></td>
														<td>
														    <c:choose>
														        <c:when test="${student.verified}">
														            <span class="badge badge-success" style="color: green;">Verified</span>
														        </c:when>
														        <c:otherwise>
														            <a href="verifyStudent?id=${student.id}" class="btn btn-warning btn-sm">Verify</a>
														        </c:otherwise>
														    </c:choose>
														    <a href="viewStudentDetails?id=${student.id}" class="btn btn-primary btn-sm">View Details</a>
														</td>
																												
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="4" class="text-center">No students found</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer-area">
            <div class="footer-top section-pb section-pt-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="copy-right pt--10 pb--10 text-center text-white">
                                <p>© 2024 Student Work Management System, Designed by <span>Your Team</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <!-- JavaScript links -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
