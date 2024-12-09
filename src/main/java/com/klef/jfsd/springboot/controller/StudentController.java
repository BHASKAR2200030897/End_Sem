package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	@Autowired
	private StudentService  studentService;
	
	
	@GetMapping("studentRegister")
	public ModelAndView studentRegister(ModelAndView mv) {
		mv.setViewName("studentLoginRegister");
		return mv;
	}
	@PostMapping("/studentRegister")
    public ModelAndView registerUser(
            HttpServletRequest request,
            @RequestParam("studentPhoto") MultipartFile file) {
		
		ModelAndView mv=new ModelAndView();
        String registrationNumber = request.getParameter("registrationNumber");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String emailId = request.getParameter("emailId");
        String mobileNumber = request.getParameter("mobileNumber");
        String dateOfBirthString = request.getParameter("dateOfBirth");
        LocalDate dateOfBirth = null;

        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Adjust pattern as per input format
            dateOfBirth = LocalDate.parse(dateOfBirthString, formatter);
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid Date of Birth format.");
        }

        String fatherName = request.getParameter("fatherName");
        String motherName = request.getParameter("motherName");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String pincode = request.getParameter("pincode");
        String country = request.getParameter("country");
        String password=request.getParameter("password");
        
        Student student=new Student();
        student.setRegistrationNumber(registrationNumber);
        student.setCity(city);
        student.setCountry(country);
        student.setDateOfBirth(dateOfBirth);
        student.setDistrict(district);
        student.setEmailId(emailId);
        student.setFatherName(fatherName);
        student.setFullName(fullName);
        student.setGender(gender);
        student.setMobileNumber(mobileNumber);
        student.setMotherName(motherName);
        student.setPassword(password);
        student.setPincode(pincode);
        student.setState(state);
        

        Blob studentPhotoBlob = null;
        try {
            if (!file.isEmpty()) {
                studentPhotoBlob = new SerialBlob(file.getBytes());
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to upload photo.");// Redirect to a failure page
        }
        student.setStudentPhoto(studentPhotoBlob);
        System.out.println("Registration Number: " + registrationNumber);
        System.out.println("Full Name: " + fullName);
        System.out.println("Gender: " + gender);
        System.out.println("Email ID: " + emailId);
        System.out.println("Mobile Number: " + mobileNumber);
        System.out.println("Date of Birth: " + dateOfBirth);
        if (studentPhotoBlob != null) {
            System.out.println("Student photo uploaded successfully.");
        }
        else{
        	System.out.println("Uploaded unsuccessful");
        }
        
        String msg=studentService.register(student);
        
        mv.addObject("msg", msg);
        
        mv.setViewName("redirect:/studentRegister");
        return mv;
        
    }
	@PostMapping("StudentLogin")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv) {
	    String email = request.getParameter("emailId");
	    String password = request.getParameter("password");
	    System.out.println(email + " " + password);

	    Student student = studentService.login(email, password);

	    if (student != null) {
	        // Creating a session and storing the student object
	        HttpSession session = request.getSession();
	        session.setAttribute("student", student);
	        mv.setViewName("redirect:/studentDashboard");
	    } else {
	        System.out.println("Login failed");
	        mv.setViewName("login-failure"); // Optionally redirect to a failure page
	    }

	    return mv;
	}

	
	@GetMapping("studentDashboard")
	public ModelAndView studentDashboard(ModelAndView mv) {
		mv.setViewName("studentDashboard");
		return mv;
	}
}
