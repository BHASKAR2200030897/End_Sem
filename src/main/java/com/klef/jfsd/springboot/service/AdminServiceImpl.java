package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Teacher;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentReposirtory;
import com.klef.jfsd.springboot.repository.TeacherRepository;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentReposirtory studentReposirtory;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private TeacherRepository teacherRepository;
	
	public Admin validateAdmin(String email, String password) {
		return adminRepository.findByEmailAndPassword(email, password);
	}
	@Override
	public List<Student> viewAllStudents() {
		return studentReposirtory.findAll();
	}
	@Override
	public Student viewStudentById(long id) {
		return studentReposirtory.findById(id).get();
	}

	public void deleteStudentById(long studentId)  {
	    studentReposirtory.deleteById(studentId);
	}
	@Override
	public void verifyStudent(Student student) {
		student.setVerified(true);
		studentReposirtory.save(student);
	}
	@Override
	public String addCourse(Course course) {
		 courseRepository.save(course);
		 return "Course added successfully";
	}
	@Override
	public List<Course> viewAllCourses() {
		return courseRepository.findAll();
	}
	@Override
	public Course viewCourseById(int id) {
		return courseRepository.findById(id).get();
	}
	@Override
	public List<Teacher> viewAllTeachers() {
		return teacherRepository.findAll();
	}
	@Override
	public String addTeacher(Teacher teacher) {
		teacherRepository.save(teacher);
		return "Teacher added succesfully";
	}
	@Override
	public Teacher viewTeacherById(long id) {
		return teacherRepository.findById(id).get();
	}
	@Override
	public String updateTeacher(Teacher teacher) {
		teacherRepository.save(teacher);
		return "Teacher updated successsfully";
	}
	
	

}
