package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.Lob;
import java.sql.Blob;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 1000)
    private String description;

    @Column(nullable = false)
    private int duration;

    @Lob
    @Column(columnDefinition = "BLOB")
    private Blob syllabusPdf; // PDF file as BLOB

    @Lob
    @Column(columnDefinition = "BLOB")
    private Blob courseImage; // Image file as BLOB
    
    

    public Course() {
    }

    // Parameterized Constructor
    public Course(String name, String description, int duration, Blob syllabusPdf, Blob courseImage) {
        this.name = name;
        this.description = description;
        this.duration = duration;
        this.syllabusPdf = syllabusPdf;
        this.courseImage = courseImage;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Blob getSyllabusPdf() {
        return syllabusPdf;
    }

    public void setSyllabusPdf(Blob syllabusPdf) {
        this.syllabusPdf = syllabusPdf;
    }

    public Blob getCourseImage() {
        return courseImage;
    }

    public void setCourseImage(Blob courseImage) {
        this.courseImage = courseImage;
    }

    // toString Method for Debugging
    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", duration=" + duration +
                '}';
    }
}
