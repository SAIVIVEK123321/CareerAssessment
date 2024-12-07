package com.klef.jfsd.project.StudentCarrerProject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.project.StudentCarrerProject.model.Question;

@Repository
public interface QuestionRepo extends JpaRepository<Question, Integer> {

	List<Question> findByCategory(String category);
	@Query("SELECT q FROM Question q WHERE q.category =?1 ORDER BY RAND() LIMIT ?2")
	List<Question> findquestionbycategory(String category, int numQ);
}
