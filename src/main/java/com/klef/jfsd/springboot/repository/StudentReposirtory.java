package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;
import java.util.List;


public interface StudentReposirtory  extends JpaRepository<Student, Long>{
	@Query("SELECT a FROM Student a WHERE a.emailId = ?1 AND a.password = ?2")
    Student findByEmailAndPassword(String email, String password);
}
