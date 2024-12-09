package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Teacher;

public interface AdminService {
	public Admin validateAdmin(String email, String password) ;
	
	public List<Student> viewAllStudents();
	public Student viewStudentById(long id);
	public void deleteStudentById(long studentId) ;
	public void verifyStudent(Student  student);
	
	public String addCourse(Course course);
	public List<Course> viewAllCourses();
	public Course viewCourseById(int id);
	
	
	public List<Teacher> viewAllTeachers();
	public String addTeacher(Teacher teacher);
	public Teacher viewTeacherById(long id);
	public String updateTeacher(Teacher teacher);
}
