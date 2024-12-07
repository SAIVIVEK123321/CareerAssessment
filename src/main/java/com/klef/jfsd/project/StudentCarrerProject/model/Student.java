package com.klef.jfsd.project.StudentCarrerProject.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Student_table")
public class Student {
	@Id
	@Column(name ="student_id",nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name ="Student_Name",nullable = false,length = 100 )
	private String name;
	@Column(name ="student_gender",nullable = false,length = 10)
	private String gender;
	@JsonFormat(pattern = "dd-MM-yyy")
	@Column(name ="student_dateofbirth",nullable = false)
	private String dataofbirth;
	@Column(name ="student_email",nullable = false,unique = true)
	private String email;
	@Column(name ="student_location",nullable = false)
	private String location;
	@Column(name ="student_contact",nullable = false,unique = true,length = 10)
	private String contact;
	@Column(name ="student_Password",nullable = false)
	private String password;
	@Column(nullable = false)
	private boolean isVerified;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDataofbirth() {
		return dataofbirth;
	}
	public void setDataofbirth(String dataofbirth) {
		this.dataofbirth = dataofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Student(int id, String name, String gender, String dataofbirth, String email, String location,
			String contact, String password, String college) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.dataofbirth = dataofbirth;
		this.email = email;
		this.location = location;
		this.contact = contact;
		this.password = password;
		
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public boolean isVerified() {
		return isVerified;
	}
	public void setVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}
	
}
