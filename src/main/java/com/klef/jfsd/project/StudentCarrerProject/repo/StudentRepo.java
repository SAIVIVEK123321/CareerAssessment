package com.klef.jfsd.project.StudentCarrerProject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.project.StudentCarrerProject.model.Student;

@Repository
public interface StudentRepo extends JpaRepository<Student, Integer>{
	@Query("SELECT c FROM Student c WHERE c.email = ?1 AND c.password = ?2")
	public Student checkstudentlogin(String email, String password);
	
	List<Student> findByIsVerified(boolean isVerified);
}
