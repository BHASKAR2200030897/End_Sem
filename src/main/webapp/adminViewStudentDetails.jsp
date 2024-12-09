<!doctype html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
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
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>View Student Details || Student Work Management System</title>
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
                            <h3>View Student Details</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="manageStudents">Manage Students</a></li>
                                <li class="breadcrumb-item active">View Student Details</li>
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
                            <h4 class="mb-4">Student Details</h4>
                            <div class="table-responsive">
                                <c:choose>
                                    <c:when test="${not empty student}">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>ID</th>
                                                <td><c:out value="${student.id}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Registration Number</th>
                                                <td><c:out value="${student.registrationNumber}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Full Name</th>
                                                <td><c:out value="${student.fullName}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Gender</th>
                                                <td><c:out value="${student.gender}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Date of Birth</th>
                                                <td><c:out value="${student.dateOfBirth}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Mobile Number</th>
                                                <td><c:out value="${student.mobileNumber}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Email ID</th>
                                                <td><c:out value="${student.emailId}" /></td>
                                            </tr>
                                            <tr>
                                                <th>City</th>
                                                <td><c:out value="${student.city}" /></td>
                                            </tr>
                                            <tr>
                                                <th>State</th>
                                                <td><c:out value="${student.state}" /></td>
                                            </tr>
                                            <tr>
                                                <th>District</th>
                                                <td><c:out value="${student.district}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Pincode</th>
                                                <td><c:out value="${student.pincode}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Country</th>
                                                <td><c:out value="${student.country}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Father's Name</th>
                                                <td><c:out value="${student.fatherName}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Mother's Name</th>
                                                <td><c:out value="${student.motherName}" /></td>
                                            </tr>
                                            <tr>
                                                <th>Student Photo</th>
                                                <td>
                                                    <c:if test="${not empty student.studentPhoto}">
                                                        <img src="data:image/jpeg;base64,${studentPhotoBase64}" alt="Student Photo" class="img-thumbnail" style="width: 150px; height: auto;" />
                                                    </c:if>
                                                    <c:if test="${empty student.studentPhoto}">
                                                        No Photo Available
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
											    <th>Actions</th>
											    <td>
											        <a href="updateStudentForm?id=${student.id}" class="btn btn-primary">Update</a>
											        <a href="deleteStudent?id=${student.id}" class="btn btn-danger" 
											           onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
											    </td>
											</tr>
											                                            
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-danger text-center">Student details not found!</div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="mt-3">
                                    <a href="viewAllStudents" class="btn btn-secondary">Back to Student List</a>
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
                                <p>© 2024 Student Work Management System, Designed by <span>Your Team</span></p>
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
