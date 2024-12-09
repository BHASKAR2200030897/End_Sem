<!doctype html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Teacher"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<%
    // Ensure that only admin is allowed to view this page
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin");
        return;
    }
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>View Teacher Details || Teacher Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="main-wrapper">

        <%@ include file="adminHeader.jsp" %>

        <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>View Teacher Details</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="manageTeachers">Manage Teachers</a></li>
                                <li class="breadcrumb-item active">View Teacher Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <main class="page-content">
            <div class="dashboard-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h4 class="mb-4">Teacher Details</h4>
                            <div class="table-responsive">
                                <c:choose>
                                    <c:when test="${not empty teacher}">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>ID</th>
                                                <td><c:out value="${teacher.id}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><c:out value="${teacher.name}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td><c:out value="${teacher.email}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Phone Number</th>
                                                <td><c:out value="${teacher.phoneNumber}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Subject Specialization</th>
                                                <td><c:out value="${teacher.subjectSpecialization}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Years of Experience</th>
                                                <td><c:out value="${teacher.yearsOfExperience}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Education Qualification</th>
                                                <td><c:out value="${teacher.educationQualification}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td><c:out value="${teacher.status}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Hire Date</th>
                                                <td><c:out value="${teacher.hireDate}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Bio</th>
                                                <td><c:out value="${teacher.bio}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Profile Picture</th>
                                                <td>
                                                    <c:if test="${not empty teacher.profilePicture}">
                                                        <img src="data:image/jpeg;base64,${teacher.profilePicture}" alt="Teacher Profile Picture" class="img-thumbnail" style="width: 150px; height: auto;" />
                                                    </c:if>
                                                    <c:if test="${empty teacher.profilePicture}">
                                                        No Profile Picture Available
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Actions</th>
                                                <td>
                                                    <a href="adminUpdateTeacherDetails?id=${teacher.id}" class="btn btn-primary">Update</a>
                                                    <a href="deleteTeacher?id=${teacher.id}" class="btn btn-danger" 
                                                       onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-danger text-center">Teacher details not found!</div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="mt-3">
                                    <a href="viewAllTeachers" class="btn btn-secondary">Back to Teacher List</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="footer-area">
            <div class="footer-top section-pb section-pt-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="copy-right pt--10 pb--10 text-center text-white">
                                <p>© 2024 Teacher Management System, Designed by <span>Your Team</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
