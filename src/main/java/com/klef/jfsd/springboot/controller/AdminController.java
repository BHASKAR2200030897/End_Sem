package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("adminLogin")
	public ModelAndView login() {
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("adminLogin");
		return mv;
		
	}
	@PostMapping("/checkAdminLogin")
	public ModelAndView adminLogin(HttpServletRequest request, HttpSession session) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    ModelAndView mv = new ModelAndView();

	    Admin admin = adminService.validateAdmin(email, password);
	    if (admin != null) {
	        System.out.println("Login Successfully");

	        // Store the admin object in the session
	        session.setAttribute("admin", admin);

	        mv.setViewName("redirect:/adminDashboard");
	    } else {
	        System.out.println("Login Unsuccessfully");

	        // Add error message for invalid login
	        mv.setViewName("redirect:/adminLogin");
	        mv.addObject("error", "Invalid email or password!");
	    }

	    return mv;
	}
	

	@GetMapping("adminDashboard")
	public ModelAndView adminDashboard() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminDashboard");
		return mv;
	}
	
	@GetMapping("viewAllStudents")
	public ModelAndView viewAllStudents(ModelAndView mv) {
	    List<Student> students = adminService.viewAllStudents();
	    if (students == null || students.isEmpty()) {
	        System.out.println("No students found");
	    } else {
	        for (Student s : students) {
	            System.out.println(s.getFullName());
	        }
	    }
	    mv.addObject("students", students);
	    mv.setViewName("adminManageStudents");
	    return mv;
	}
	
	@GetMapping("viewStudentDetails")
	public ModelAndView viewStudentDetails(@RequestParam("id") Long id, ModelAndView mv) {
	    Student student = adminService.viewStudentById(id);
	    
	    if (student == null) {
	        mv.addObject("errorMessage", "Student not found!");
	        mv.setViewName("errorPage"); 
	    } else {
	    	if (student.getStudentPhoto() != null) {
	            mv.addObject("studentPhotoBase64", convertBlobToBase64(student.getStudentPhoto()));
	        }
	        mv.addObject("student", student);
	        mv.setViewName("adminViewStudentDetails"); 
	    }
	    
	    return mv;
	}
	public String convertBlobToBase64(Blob blob) {
	    if (blob == null) {
	        return null;
	    }
	    try (InputStream inputStream = blob.getBinaryStream()) {
	        byte[] bytes = inputStream.readAllBytes();
	        return Base64.getEncoder().encodeToString(bytes);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	@GetMapping("/updateStudentForm")
    public ModelAndView showUpdateForm(@RequestParam("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("adminUpdateStudentDetails");
        Student student = adminService.viewStudentById(id);  
        modelAndView.addObject("student", student);  
        return modelAndView;
    }

//     Method to handle student update
	@RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
	public ModelAndView updateStudent(HttpServletRequest request, @RequestParam("studentPhoto") MultipartFile file) {
	    ModelAndView modelAndView = new ModelAndView();

	    try {
	        // Create a new Student object
	        Student student = adminService.viewStudentById(Integer.parseInt(request.getParameter("id")));

	        // Retrieve form data
	        String registrationNumber = request.getParameter("registrationNumber");
	        String fullName = request.getParameter("fullName");
	        String gender = request.getParameter("gender");
	        String emailId = request.getParameter("emailId");
	        String mobileNumber = request.getParameter("mobileNumber");
	        String fatherName = request.getParameter("fatherName");
	        String motherName = request.getParameter("motherName");
	        String city = request.getParameter("city");
	        String state = request.getParameter("state");
	        String district = request.getParameter("district");
	        String pincode = request.getParameter("pincode");
	        String country = request.getParameter("country");
	        String password = request.getParameter("password");

	        // Parse date of birth
	        String dateOfBirthString = request.getParameter("dateOfBirth");
	        LocalDate dateOfBirth = null;
	        if (dateOfBirthString != null && !dateOfBirthString.isEmpty()) {
	            try {
	                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	                dateOfBirth = LocalDate.parse(dateOfBirthString, formatter);
	            } catch (DateTimeParseException e) {
	                request.setAttribute("error", "Invalid Date of Birth format.");
	                modelAndView.setViewName("updateStudentDetails");
	                return modelAndView;
	            }
	        }

	        // Set student properties
	        student.setRegistrationNumber(registrationNumber);
	        student.setFullName(fullName);
	        student.setGender(gender);
	        student.setEmailId(emailId);
	        student.setMobileNumber(mobileNumber);
	        student.setDateOfBirth(dateOfBirth);
	        student.setFatherName(fatherName);
	        student.setMotherName(motherName);
	        student.setCity(city);
	        student.setState(state);
	        student.setDistrict(district);
	        student.setPincode(pincode);
	        student.setCountry(country);
	        student.setPassword(password);

	        if (file != null && !file.isEmpty()) {
	            try {
	                Blob studentPhotoBlob = new SerialBlob(file.getBytes());
	                student.setStudentPhoto(studentPhotoBlob);
	            } catch (SQLException | IOException e) {
	                request.setAttribute("error", "Failed to upload photo.");
	                modelAndView.setViewName("updateStudentDetails");
	                return modelAndView;
	            }
	        }

	        
	        studentService.studentUpdate(student);

	        modelAndView.setViewName("redirect:/viewStudentDetails?id=" + student.getId());

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "An unexpected error occurred while updating the student.");
	        modelAndView.setViewName("updateStudentDetails");
	    }

	    return modelAndView;
	}

	@GetMapping("/deleteStudent")
	public ModelAndView deleteStudent(@RequestParam("id") int studentId, HttpServletRequest request) {
	    ModelAndView modelAndView = new ModelAndView();

	    try {
	        adminService.deleteStudentById(studentId);

	        modelAndView.setViewName("redirect:/viewAllStudents");
	        request.getSession().setAttribute("message", "Student deleted successfully.");
	    } catch (Exception e) {
	        e.printStackTrace();

	        modelAndView.setViewName("redirect:/viewAllStudents");
	        request.getSession().setAttribute("error", "Failed to delete the student. Please try again.");
	    }

	    return modelAndView;
	}
	
	@GetMapping("/verifyStudent")
	public ModelAndView verifyStudent(@RequestParam("id") Long studentId, HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    Student student=adminService.viewStudentById(studentId);
	    adminService.verifyStudent(student);
	    mv.setViewName("redirect:/viewAllStudents");

	    return mv;
	}

	@GetMapping("adminManageCourses")
	public ModelAndView adminManageCourses(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    List<Course> courses = adminService.viewAllCourses(); 
	    request.setAttribute("courses", courses); 
	    mv.addObject("courses", courses);
	    
	    mv.setViewName("adminManageCourses");
	    return mv;
	}

	@PostMapping("addCourse")
	public ModelAndView addCourse(HttpServletRequest request, 
	                               @RequestParam("name") String name,
	                               @RequestParam("description") String description,
	                               @RequestParam("duration") int duration,
	                               @RequestParam(value = "courseImage", required = false) MultipartFile courseImage,
	                               @RequestParam(value = "coursePdf", required = false) MultipartFile coursePdf) throws IOException, SQLException {
	    ModelAndView mv = new ModelAndView();
	    
	    Course course = new Course();
	    course.setName(name);
	    course.setDescription(description);
	    course.setDuration(duration);
	    
	    if (courseImage != null && !courseImage.isEmpty()) {
	        Blob imageBlob = new javax.sql.rowset.serial.SerialBlob(courseImage.getBytes());
	        course.setCourseImage(imageBlob);
	    }

	    if (coursePdf != null && !coursePdf.isEmpty()) {
	        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(coursePdf.getBytes());
	        course.setSyllabusPdf(pdfBlob);
	    }
	    adminService.addCourse(course);

	    mv.setViewName("redirect:/adminManageCourses");
	    return mv;
	}
	
	@GetMapping("/viewCourseDetails")
    public ModelAndView viewCourseDetails(@RequestParam("id") int courseId) {
        ModelAndView mv = new ModelAndView();
        Course course = adminService.viewCourseById(courseId);

        if (course != null) {
        	
        	
        	
        	
            mv.addObject("course", course);
            mv.setViewName("adminViewCourseDetails");
        } else {
            mv.setViewName("redirect:/adminManageCourses"); // Redirect if course is not found
        }
        return mv;
    }
	
	@GetMapping("/displayCourseImage")
	public ResponseEntity<byte[]> displayCourseImage(HttpServletRequest request, @RequestParam("id") int courseId) throws Exception {
	    // Fetch course from the database using the courseId
	    Course course = adminService.viewCourseById(courseId);

	    if (course != null && course.getCourseImage() != null) {
	        Blob courseImageBlob = course.getCourseImage();  // Blob field from the database
	        byte[] imageBytes = courseImageBlob.getBytes(1, (int) courseImageBlob.length());

	        // Returning the image in the response
	        return ResponseEntity.ok()
	                .contentType(MediaType.IMAGE_JPEG) // Content type can be changed as needed
	                .body(imageBytes);
	    }
	    
	    // Return a 404 if no image found
	    return ResponseEntity.notFound().build();
	}

	@GetMapping("/displaySyllabusPdf")
	public ResponseEntity<byte[]> displaySyllabusPdf(HttpServletRequest request, @RequestParam("id") int courseId) throws Exception {
	    // Fetch course from the database using the courseId
	    Course course = adminService.viewCourseById(courseId);

	    if (course != null && course.getSyllabusPdf() != null) {
	        Blob syllabusPdfBlob = course.getSyllabusPdf();  // Blob field from the database
	        byte[] pdfBytes = syllabusPdfBlob.getBytes(1, (int) syllabusPdfBlob.length());

	        // Returning the PDF file in the response
	        return ResponseEntity.ok()
	                .contentType(MediaType.APPLICATION_PDF)
	                .body(pdfBytes);
	    }

	    // Return a 404 if no PDF found
	    return ResponseEntity.notFound().build();
	}

	
	@GetMapping("adminManageTeacher")
	public ModelAndView adminManageTeacher() {
		ModelAndView mv=new ModelAndView();
		
		List<Teacher> teachers=adminService.viewAllTeachers();
		
		for(Teacher t:teachers) {
			System.out.println(t.getName());
		}
		
		
		mv.addObject("teachers", teachers);
		mv.setViewName("adminManageTeacher");
		return mv;
	}
	
	@PostMapping("addTeacher")
	public ModelAndView addTeacher(HttpServletRequest request,
	                               @RequestParam(value = "profilePicture", required = false) MultipartFile profilePicture) throws SQLException {

	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String subjectSpecialization = request.getParameter("subjectSpecialization");

	    Teacher teacher = new Teacher();
	    teacher.setName(name);
	    teacher.setEmail(email);
	    teacher.setPassword(password);
	    teacher.setSubjectSpecialization(subjectSpecialization);

	    if (profilePicture != null && !profilePicture.isEmpty()) {
	        try {
	            InputStream profilePicInputStream = profilePicture.getInputStream();
	            teacher.setProfilePicture(new SerialBlob(profilePicInputStream.readAllBytes()));
	        } catch (IOException | SQLException e) {
	            e.printStackTrace();
	            ModelAndView mv = new ModelAndView("adminManageTeacher");
	            mv.addObject("message", "Error saving profile picture.");
	            return mv;
	        }
	    }

	    String isAdded = adminService.addTeacher(teacher);

	    ModelAndView mv = new ModelAndView("redirect:/adminManageTeacher");
	    if (isAdded.equalsIgnoreCase("Teacher added succesfully")) {
	        mv.addObject("message", "Teacher added successfully!");
	    } else {
	        mv.addObject("message", "Failed to add teacher.");
	    }

	    return mv;
	}
	
	@GetMapping("viewTeacherDetails")
	public ModelAndView viewTeacherDetails(@RequestParam("id") Long id) {
	    ModelAndView mv = new ModelAndView();

	    Teacher teacher = adminService.viewTeacherById(id);

	    if (teacher != null) {
	        mv.addObject("teacher", teacher);  
	        mv.setViewName("adminViewTeacherDetails"); 
	    } else {
	        mv.addObject("message", "Teacher not found.");
	        mv.setViewName("error");  
	    }

	    return mv;
	}
	
	@GetMapping("/adminUpdateTeacherDetails")
	public ModelAndView showUpdateTeacherForm(@RequestParam("id") Long teacherId, HttpServletRequest request) {
	    Teacher teacher = adminService.viewTeacherById(teacherId);

	    if (teacher == null) {
	        return new ModelAndView("redirect:/manageTeachers");
	    }

	    ModelAndView modelAndView = new ModelAndView("adminUpdateTeacherDetails");
	    modelAndView.addObject("teacher", teacher);

	    // Convert the teacher's profile picture (Blob) to Base64 for JSP rendering
	    if (teacher.getProfilePicture() != null) {
	        String encodedImage = encodeBlobToBase64(teacher.getProfilePicture());
	        modelAndView.addObject("teacherProfilePictureBase64", encodedImage);
	    }

	    return modelAndView;
	}

	private String encodeBlobToBase64(Blob blob) {
	    try {
	        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
	        return Base64.getEncoder().encodeToString(imageBytes);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	@PostMapping("/updateTeacher")
	public ModelAndView updateTeacher(
	        @RequestParam("id") Long teacherId,
	        @RequestParam("name") String name,
	        @RequestParam("email") String email,
	        @RequestParam("phoneNumber") String phoneNumber,
	        @RequestParam("subjectSpecialization") String subjectSpecialization,
	        @RequestParam("yearsOfExperience") int yearsOfExperience,
	        @RequestParam("educationQualification") String educationQualification,
	        @RequestParam("status") String status,
	        @RequestParam("bio") String bio,
	        @RequestParam("hireDate") String hireDateString,
	        @RequestParam(value = "profilePicture", required = false) MultipartFile profilePicture,
	        @RequestParam("password")String password,
	        HttpServletRequest request) throws IOException {

	    Teacher teacher = new Teacher();
	    teacher.setId(teacherId);
	    teacher.setName(name);
	    teacher.setEmail(email);
	    teacher.setPhoneNumber(phoneNumber);
	    teacher.setSubjectSpecialization(subjectSpecialization);
	    teacher.setYearsOfExperience(yearsOfExperience);
	    teacher.setEducationQualification(educationQualification);
	    teacher.setStatus(status);
	    teacher.setBio(bio);
	    teacher.setPassword(password);

	    try {
	        Date hireDate = new SimpleDateFormat("yyyy-MM-dd").parse(hireDateString);
	        LocalDate localHireDate = hireDate.toInstant()
	                                         .atZone(ZoneId.systemDefault())
	                                         .toLocalDate();
	        teacher.setHireDate(localHireDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    if (profilePicture != null && !profilePicture.isEmpty()) {
	        Blob profilePicBlob = convertToBlob(profilePicture);
	        teacher.setProfilePicture(profilePicBlob);
	    }

	    adminService.updateTeacher(teacher);

	    ModelAndView modelAndView = new ModelAndView("redirect:/viewTeacherDetails?id="+teacherId);
	    modelAndView.addObject("message", "Teacher updated successfully!");
	    return modelAndView;
	}

	private Blob convertToBlob(MultipartFile file) throws IOException {
	    try {
	        byte[] fileBytes = file.getBytes();
	        return new javax.sql.rowset.serial.SerialBlob(fileBytes);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}









	
	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
	    session.invalidate();  // Invalidate the session
	    return "redirect:/";  // Redirect to the login page
	}

} 
