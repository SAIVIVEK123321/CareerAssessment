package com.klef.jfsd.project.StudentCarrerProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.StudentCarrerProject.model.Admin;
import com.klef.jfsd.project.StudentCarrerProject.model.Question;
import com.klef.jfsd.project.StudentCarrerProject.model.Student;
import com.klef.jfsd.project.StudentCarrerProject.repo.AdminRepo;
import com.klef.jfsd.project.StudentCarrerProject.repo.StudentRepo;
@Service
public class AdminService {
	@Autowired
	private AdminRepo repoa;
	@Autowired
	private StudentRepo repo;
	
	public List<Student> viewAllStudent() {
		return repo.findAll();
	}
	public Admin cheakAdminLogin(String cname, String password) {
		return repoa.cheakAdminLogin(cname, password);
	}
	
	public void deleteStudent(int id) {
        // Check if the student exists before attempting to delete
        if (repo.existsById(id)) {
            repo.deleteById(id);
        } else {
            // Optionally, handle the case where the student does not exist (e.g., throw an exception or log it)
            throw new RuntimeException("Student with ID " + id + " not found");
        }
    }
	public Student displaystudentById(int id) {
        return repo.findById(id).orElse(null);  // Returns null if the student is not found
    }
	public String verifyUser(int id) {
	    Optional<Student> optionalUser = repo.findById(id);

	    if (optionalUser.isPresent()) {
	        Student user = optionalUser.get();
	        user.setVerified(true);
	        repo.save(user);
	        
	        return "User verified successfully";
	    } else {
	        return "User not found. Please try again.";
	    }
	}

	
}
