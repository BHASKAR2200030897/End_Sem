<!doctype html>
<html class="no-js" lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login And Register Page || Eduhas - Education Bootstrap 5 Template</title>
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

        <%-- <%@ include file="studentHeader.jsp" %> --%>
        <c:out value="${ msg }"></c:out>
        

        <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Login And Register</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item active">Login And Register</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <main class="page-content">

            <div class="register-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 m-auto">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav">
                                    <a class="active" data-bs-toggle="tab" href="#lg1">
                                        <h4> login </h4>
                                    </a>
                                    <a data-bs-toggle="tab" href="#lg2">
                                        <h4> register </h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="lg1" class="tab-pane active">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form action="StudentLogin" method="post">
                                                    <div class="login-input-box">
                                                        <input type="text" name="emailId" placeholder="Email" required>
                                                        <input type="password" name="password" placeholder="Password" required>
                                                    </div>
                                                    <div class="button-box">
                                                        <div class="login-toggle-btn">
                                                            <input type="checkbox">
                                                            <label>Remember me</label>
                                                            <a href="#">Forgot Password?</a>
                                                        </div>
                                                        <div class="button-box">
                                                            <button class="login-btn btn" type="submit"><span>Login</span></button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="lg2" class="tab-pane">
									    <div class="login-form-container">
									        <div class="login-register-form">
									            <form action="studentRegister" method="post" enctype="multipart/form-data">
									                <div class="login-input-box">
									                    <input type="text" name="registrationNumber" placeholder="Registration Number *" required>
									                    <input type="text" name="fullName" placeholder="Full Name *" required>
									                    <input type="text" name="gender" placeholder="Gender  *" required>
									                    <input type="email" name="emailId" placeholder="Email *" required>
									                    <input type="text" name="mobileNumber" placeholder="Mobile Number *" required>
									                    <input type="date" name="dateOfBirth" placeholder="Date of Birth *" required="required">
									                    
									
									                    <!-- Optional Fields -->
									                    <input type="text" name="fatherName" placeholder="Father's Name" >
									                    <input type="text" name="motherName" placeholder="Mother's Name" >
									                    
									                    <input type="text" name="city" placeholder="City">
									                    <input type="text" name="state" placeholder="State">
									                    <input type="text" name="district" placeholder="District">
									                    <input type="text" name="pincode" placeholder="Pincode">
									                    <input type="text" name="country" placeholder="Country">
									                    <input type="file" name="studentPhoto" placeholder="Student Photo">
									                    <input type="password" name="password" placeholder="Password *" required>
									                </div>
									                <div class="button-box">
									                    <button class="register-btn btn" type="submit"><span>Register</span></button>
									                </div>
									            </form>
									        </div>
									    </div>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        

    </div>

    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>
