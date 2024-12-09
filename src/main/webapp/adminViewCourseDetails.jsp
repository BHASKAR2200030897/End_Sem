<!DOCTYPE html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ page import="com.klef.jfsd.springboot.model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin");
        return;
    }
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Course Details || Student Work Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS links -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="main-wrapper">
        <%@ include file="adminHeader.jsp" %>

        <div class="breadcrumb-area" style="background-image: url('assets/images/bg/breadcrumb-bg-01.jpg');" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Course Details</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="adminManageCourses">Manage Courses</a></li>
                                <li class="breadcrumb-item active">Course Details</li>
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
                    <h4>Course Details</h4>
                    <table class="table table-bordered">
                        <tr>
                            <th>Course ID</th>
                            <td>${course.id}</td>
                        </tr>
                        <tr>
                            <th>Course Name</th>
                            <td>${course.name}</td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td>${course.description}</td>
                        </tr>
                        <tr>
                            <th>Duration</th>
                            <td>${course.duration} weeks</td>
                        </tr>
                        <tr>
                            <th>Course Image</th>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty course.courseImage}">
                                        <!-- Dynamically fetching course image from server -->
                                        <img src="${pageContext.request.contextPath}/displayCourseImage?id=${course.id}" alt="Course Image" style="width: 200px; height: auto;" />
                                    </c:when>
                                    <c:otherwise>
                                        <p>No image available</p>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>Syllabus PDF</th>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty course.syllabusPdf}">
                                        <!-- Dynamically fetching syllabus PDF from server -->
                                        <a href="${pageContext.request.contextPath}/displaySyllabusPdf?id=${course.id}" target="_blank" class="btn btn-link">View Syllabus PDF</a>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No PDF available</p>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                    <a href="adminManageCourses" class="btn btn-primary">Back to Courses</a>
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
