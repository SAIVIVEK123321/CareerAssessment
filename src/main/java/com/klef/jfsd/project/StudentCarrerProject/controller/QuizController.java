package com.klef.jfsd.project.StudentCarrerProject.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.klef.jfsd.project.StudentCarrerProject.model.Question;
import com.klef.jfsd.project.StudentCarrerProject.model.Response;
import com.klef.jfsd.project.StudentCarrerProject.model.QuestionWapper;
import com.klef.jfsd.project.StudentCarrerProject.service.QuizService;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("Quiz")
public class QuizController {
	
	@Autowired
	private QuizService quizservice;
	
	@PostMapping("create")
	public ResponseEntity<String> createQuiz(@RequestParam String category,@RequestParam int numQ,@RequestParam String title){
		return quizservice.createQuiz(category,numQ,title);
	}
	
	@GetMapping("get/{id}")
	public ResponseEntity<List<QuestionWapper>> getQuizQuestions(@PathVariable Long id){
		return quizservice.getQuizQuestions(id);
	}
	
	@PostMapping("submit/{id}")
	public ResponseEntity<Integer> submitQuiz(@PathVariable Long id, @RequestBody List<Response>responses)	{
		return quizservice.calculateResult(id,responses);
		
	}
}