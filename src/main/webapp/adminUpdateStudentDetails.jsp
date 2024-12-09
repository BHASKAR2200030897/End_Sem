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
    <title>Update Student Details || Student Work Management System</title>
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
                            <h3>Update Student Details</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="manageStudents">Manage Students</a></li>
                                <li class="breadcrumb-item active">Update Student Details</li>
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
                            <h4 class="mb-4">Update Student Information</h4>
                            <form action="updateStudent" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${student.id}" />
                                <div class="form-group">
                                    <label for="registrationNumber">Registration Number</label>
                                    <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" value="${student.registrationNumber}" required />
                                </div>
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${student.fullName}" required />
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="Male" <c:if test="${student.gender == 'Male'}">selected</c:if>>Male</option>
                                        <option value="Female" <c:if test="${student.gender == 'Female'}">selected</c:if>>Female</option>
                                        <option value="Other" <c:if test="${student.gender == 'Other'}">selected</c:if>>Other</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="dateOfBirth">Date of Birth</label>
                                    <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required />
                                </div>
                                <div class="form-group">
                                    <label for="mobileNumber">Mobile Number</label>
                                    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="${student.mobileNumber}" required />
                                </div>
                                <div class="form-group">
                                    <label for="emailId">Email ID</label>
                                    <input type="email" class="form-control" id="emailId" name="emailId" value="${student.emailId}" required />
                                </div>
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" class="form-control" id="city" name="city" value="${student.city}" />
                                </div>
                                <div class="form-group">
                                    <label for="state">State</label>
                                    <input type="text" class="form-control" id="state" name="state" value="${student.state}" />
                                </div>
                                <div class="form-group">
                                    <label for="district">District</label>
                                    <input type="text" class="form-control" id="district" name="district" value="${student.district}" />
                                </div>
                                <div class="form-group">
                                    <label for="pincode">Pincode</label>
                                    <input type="text" class="form-control" id="pincode" name="pincode" value="${student.pincode}" />
                                </div>
                                <div class="form-group">
                                    <label for="country">Country</label>
                                    <input type="text" class="form-control" id="country" name="country" value="${student.country}" />
                                </div>
                                <div class="form-group">
                                    <label for="fatherName">Father's Name</label>
                                    <input type="text" class="form-control" id="fatherName" name="fatherName" value="${student.fatherName}" />
                                </div>
                                <div class="form-group">
                                    <label for="motherName">Mother's Name</label>
                                    <input type="text" class="form-control" id="motherName" name="motherName" value="${student.motherName}" />
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" value="${student.password}" />
                                </div>
                                <div class="form-group">
                                    <label for="studentPhoto">Student Photo</label>
                                    <input type="file" class="form-control" id="studentPhoto" name="studentPhoto" />
                                    <c:if test="${not empty student.studentPhoto}">
                                        <br>
                                        <img src="data:image/jpeg;base64,${studentPhotoBase64}" alt="Student Photo" class="img-thumbnail" style="width: 150px; height: auto;" />
                                    </c:if>
                                </div>
                                <button type="submit" class="btn btn-primary">Update Student</button>
                                <a href="viewAllStudents" class="btn btn-secondary">Cancel</a>
                            </form>
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
