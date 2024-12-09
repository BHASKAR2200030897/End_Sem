package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.StudentReposirtory;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentReposirtory studentReposirtory;
	
	@Override
	public String register(Student student) {
		 studentReposirtory.save(student);
		 return "Registered successfully";
	}

	@Override
	public Student login(String email, String password) {
		return  studentReposirtory.findByEmailAndPassword(email, password);
	}

	@Override
	public String studentUpdate(Student student) {
		 studentReposirtory.save(student);
		 return "Updated successfully";
	}

	
}
