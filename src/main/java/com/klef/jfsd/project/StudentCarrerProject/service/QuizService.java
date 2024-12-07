package com.klef.jfsd.project.StudentCarrerProject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.klef.jfsd.project.StudentCarrerProject.model.Question;
import com.klef.jfsd.project.StudentCarrerProject.model.QuestionWapper;
import com.klef.jfsd.project.StudentCarrerProject.model.Quiz;
import com.klef.jfsd.project.StudentCarrerProject.model.Response;
import com.klef.jfsd.project.StudentCarrerProject.repo.QuestionRepo;
import com.klef.jfsd.project.StudentCarrerProject.repo.QuizRepo;

@Service
public class QuizService {
	@Autowired
	private QuizRepo quizrepo;
	
	@Autowired
	private QuestionRepo repo;

	public ResponseEntity<String> createQuiz(String category, int numQ, String title) {
	    List<Question> questions = repo.findquestionbycategory(category, numQ);

	    Quiz quiz = new Quiz();
	    quiz.setTitle(title);
	    quiz.setQuetions(questions);

	    quizrepo.save(quiz); // Save to DB, the id will be automatically generated

	    return new ResponseEntity<>("Questions added successfully", HttpStatus.CREATED);
	}

	public ResponseEntity<List<QuestionWapper>> getQuizQuestions(Long id) {
		Optional<Quiz>  quiz= quizrepo.findById(id);
		List<Question> questionFromDb = quiz.get().getQuetions();
		List<QuestionWapper> quetionForuser=new ArrayList<>();
		for(Question q:questionFromDb) {
			QuestionWapper qw = new QuestionWapper(q.getId(),q.getQuestionTitle(),q.getOption1(),q.getOption2(),q.getOption3(),q.getOption4());
			quetionForuser.add(qw);
		}
		return new ResponseEntity<>(quetionForuser,HttpStatus.OK);
	}

	public ResponseEntity<Integer> calculateResult(Long id, List<Response> responses) {
		Quiz quiz=quizrepo.findById(id).get();
		List<Question>questions=quiz.getQuetions();
		int right=0;
		int i=0;
		for(Response response:responses) {
			if(response.getResponse().equals(questions.get(i).getRightAnswer()))
				right++;
			i++;
		}
		return new ResponseEntity<>(right,HttpStatus.OK);
	}
	

}
