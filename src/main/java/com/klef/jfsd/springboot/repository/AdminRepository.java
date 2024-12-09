package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.klef.jfsd.springboot.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long>{
	@Query("SELECT a FROM Admin a WHERE a.emailId = ?1 AND a.password = ?2")
    Admin findByEmailAndPassword(String email, String password);
}
