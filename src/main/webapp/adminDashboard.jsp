<!doctype html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<html class="no-js" lang="en">
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
		response.sendRedirect("adminLogin");
    }
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin Dashboard || Student Work Management System</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
</head>

<body>

    <div class="main-wrapper">

        <%@ include file="adminHeader.jsp" %>

        <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Admin Dashboard</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
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
                            <div class="dashboard-overview">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="overview-item">
                                            <h4>Total Students</h4>
                                            <p>1500</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="overview-item">
                                            <h4>Projects Submitted</h4>
                                            <p>245</p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="overview-item">
                                            <h4>Pending Submissions</h4>
                                            <p>30</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3">
                            <div class="dashboard-menu">
                                <h5>Navigation</h5>
                                <ul class="menu-list">
                                    <li><a href="viewAllStudents">Manage Students</a></li>
                                    <li><a href="adminManageCourses">Manage Courses</a></li>
                                    <li><a href="adminManageTeacher">Manage Teachers</a></li>
                                    <li><a href="profile.jsp">My Profile</a></li>
                                    <li><a href="adminLogout">Logout</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-9">
                            <div class="dashboard-content">
                                <h4>Recent Activities</h4>
                                <div class="activity-list">
                                    <ul>
                                        <li>Student John Doe submitted the project *AI and Machine Learning*</li>
                                        <li>Updated project deadlines for Semester 2</li>
                                        <li>New student registrations approved</li>
                                    </ul>
                                </div>

                                <h4 class="mt-4">Tasks Overview</h4>
                                <div class="tasks-chart">
                                    <img src="assets/images/dashboard/chart-placeholder.png" alt="Chart Placeholder" />
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
