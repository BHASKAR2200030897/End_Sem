package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService {
	public String register(Student student);
	public Student login(String email, String password);
	
	public String studentUpdate(Student  student);
}
