package com.klef.jfsd.project.StudentCarrerProject.service;


import java.util.ArrayList;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.StudentCarrerProject.model.Question;
import com.klef.jfsd.project.StudentCarrerProject.repo.QuestionRepo;



@Service
public class QuestionService {
	
	@Autowired
	private QuestionRepo repo;

	public List<Question> getAllQuestions() {
	    return repo.findAll();
	}
	
	  public Question findById(int id) {
	        return repo.findById(id).orElse(null); // This returns the question or null if not found
	    }
	
	public ResponseEntity <List<Question>> getQuetionsByCategory(String category) {
		try {
			return new ResponseEntity<> (repo.findByCategory(category),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(new ArrayList<>(),HttpStatus.BAD_REQUEST);
	}

	
	
	public Question addQuestion(Question question) {
		return repo.save(question);	
	}

	
	
	public Object deleteQuestion(int id) {
		 repo.deleteById(id);
		 return "delete sussue";
	}

	
	
	public void updateQuestion(Question question) {
		 repo.save(question);
	}

}
