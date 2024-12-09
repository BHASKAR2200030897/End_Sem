<!doctype html>
<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>Update Teacher Details || Teacher Management System</title>
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
                            <h3>Update Teacher Details</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="manageTeachers">Manage Teachers</a></li>
                                <li class="breadcrumb-item active">Update Teacher Details</li>
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
                            <h4 class="mb-4">Update Teacher Information</h4>
                            <form action="updateTeacher?id=${teacher.id}" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="${teacher.id}" />
                                <div class="form-group">
                                    <label for="name">Full Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="${teacher.name}" required />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email ID</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${teacher.email}" required />
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber">Phone Number</label>
                                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" />
                                </div>
                                <div class="form-group">
                                    <label for="subjectSpecialization">Subject Specialization</label>
                                    <input type="text" class="form-control" id="subjectSpecialization" name="subjectSpecialization" value="${teacher.subjectSpecialization}" required />
                                </div>
                                <div class="form-group">
                                    <label for="yearsOfExperience">Years of Experience</label>
                                    <input type="number" class="form-control" id="yearsOfExperience" name="yearsOfExperience" value="${teacher.yearsOfExperience}" />
                                </div>
                                <div class="form-group">
                                    <label for="educationQualification">Education Qualification</label>
                                    <input type="text" class="form-control" id="educationQualification" name="educationQualification" value="${teacher.educationQualification}" />
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="Active" <c:if test="${teacher.status == 'Active'}">selected</c:if>>Active</option>
                                        <option value="Inactive" <c:if test="${teacher.status == 'Inactive'}">selected</c:if>>Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="hireDate">Hire Date</label>
                                    <input type="date" class="form-control" id="hireDate" name="hireDate" value="${teacher.hireDate}" />
                                </div>
                                <div class="form-group">
                                    <label for="bio">Bio</label>
                                    <textarea class="form-control" id="bio" name="bio">${teacher.bio}</textarea>
                                </div>
                                
                                <div class="form-group">
                                    <label for="educationQualification">Pasword</label>
                                    <input type="password" class="form-control" id="password" name="password" value="${teacher.password}" />
                                </div>
                                <div class="form-group">
                                    <label for="profilePicture">Profile Picture</label>
                                    <input type="file" class="form-control" id="profilePicture" name="profilePicture" />
                                    <c:if test="${not empty teacher.profilePicture}">
                                        <br>
                                        <img src="data:image/jpeg;base64,${teacher.profilePictureBase64}" alt="Teacher Profile Picture" class="img-thumbnail" style="width: 150px; height: auto;" />
                                    </c:if>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update Teacher</button>
                                <a href="adminManageTeacher" class="btn btn-secondary">Cancel</a>
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
