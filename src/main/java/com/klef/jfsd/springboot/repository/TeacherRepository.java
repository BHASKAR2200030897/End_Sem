package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.model.Teacher;

import jakarta.persistence.Column;

public interface TeacherRepository  extends JpaRepository<Teacher, Long>{

}
