<!DOCTYPE html>
<%@ page import="com.klef.jfsd.springboot.model.Admin, com.klef.jfsd.springboot.model.Teacher" %>
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
    <title>Manage Teachers || Student Work Management System</title>
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
                            <h3>Manage Teachers</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Manage Teachers</li>
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
                        <!-- Left Column: Viewable Teachers -->
                        <div class="col-lg-4">
                            <h4 class="mb-4">Viewable Teachers</h4>
                            <div class="list-group">
                                <c:choose>
                                    <c:when test="${not empty teachers}">
                                        <c:forEach var="teacher" items="${teachers}">
                                            <a href="viewTeacherDetails?id=${teacher.id}" class="list-group-item list-group-item-action">
                                                <c:out value="${teacher.name}" />
                                            </a>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <p>No teachers found</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Right Column: Add Teacher Form -->
                        <div class="col-lg-8">
                            <h4 class="mb-4">Add a New Teacher</h4>
                            <form action="addTeacher" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="teacherName">Teacher Name</label>
                                    <input type="text" id="teacherName" name="name" class="form-control" placeholder="Enter teacher name" required>
                                </div>
                                <div class="form-group">
                                    <label for="teacherEmail">Teacher Email</label>
                                    <input type="email" id="teacherEmail" name="email" class="form-control" placeholder="Enter teacher email" required>
                                </div>
                                <div class="form-group">
                                    <label for="teacherPassword">Password</label>
                                    <input type="password" id="teacherPassword" name="password" class="form-control" placeholder="Enter password" required>
                                </div>
                                <div class="form-group">
                                    <label for="teacherSubject">Subject Specialization</label>
                                    <input type="text" id="teacherSubject" name="subjectSpecialization" class="form-control" placeholder="Enter subject specialization" required>
                                </div>
                                
                                <!-- File Input for Teacher Profile Picture -->
                                <div class="form-group">
                                    <label for="teacherProfilePicture">Profile Picture</label>
                                    <input type="file" id="teacherProfilePicture" name="profilePicture" class="form-control-file" accept="image/*">
                                </div>

                                <button type="submit" class="btn btn-primary">Add Teacher</button>
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
