package com.klef.jfsd.project.StudentCarrerProject.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.project.StudentCarrerProject.model.Admin;
@Repository
public interface AdminRepo extends JpaRepository<Admin, String> {

	
	@Query("select a from Admin a where a.username =?1 and a.password=?2")
	 public Admin cheakAdminLogin(String uname,String upassword);

}
