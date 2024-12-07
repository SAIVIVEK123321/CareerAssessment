package com.klef.jfsd.project.StudentCarrerProject.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;

@Entity
public class Quiz {
	

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) // Automatically generate ID
    private Long id;


	private String title;
	@ManyToMany
	private List<Question> quetions;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Question> getQuetions() {
		return quetions;
	}
	public void setQuetions(List<Question> quetions) {
		this.quetions = quetions;
	}

}
