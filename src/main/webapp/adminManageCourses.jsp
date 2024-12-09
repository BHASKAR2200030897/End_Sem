<!DOCTYPE html>
<%@ page import="com.klef.jfsd.springboot.model.Admin" %>
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
    <title>Manage Courses || Student Work Management System</title>
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
                            <h3>Manage Courses</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Manage Courses</li>
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
                        <!-- Left Column: Viewable Courses -->
                        <div class="col-lg-4">
                            <h4 class="mb-4">Viewable Courses</h4>
                            <div class="list-group">
                                <c:choose>
                                    <c:when test="${not empty courses}">
                                        <c:forEach var="course" items="${courses}">
                                            <a href="viewCourseDetails?id=${course.id}" class="list-group-item list-group-item-action">
                                                <c:out value="${course.name}" />
                                            </a>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No courses found</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Right Column: Add Course Form -->
                        <div class="col-lg-8">
                            <h4 class="mb-4">Add a New Course</h4>
                            <form action="addCourse" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="courseName">Course Name</label>
                                    <input type="text" id="courseName" name="name" class="form-control" placeholder="Enter course name" required>
                                </div>
                                <div class="form-group">
                                    <label for="courseDescription">Course Description</label>
                                    <textarea id="courseDescription" name="description" class="form-control" rows="3" placeholder="Enter course description" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="courseDuration">Duration (in weeks)</label>
                                    <input type="number" id="courseDuration" name="duration" class="form-control" placeholder="Enter duration" required>
                                </div>
                                
                                <!-- File Input for Course Image -->
                                <div class="form-group">
                                    <label for="courseImage">Course Image</label>
                                    <input type="file" id="courseImage" name="courseImage" class="form-control-file" accept="image/*">
                                </div>

                                <!-- File Input for Course PDF -->
                                <div class="form-group">
                                    <label for="coursePdf">Course PDF</label>
                                    <input type="file" id="coursePdf" name="coursePdf" class="form-control-file" accept="application/pdf">
                                </div>

                                <button type="submit" class="btn btn-primary">Add Course</button>
                            </form>
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
