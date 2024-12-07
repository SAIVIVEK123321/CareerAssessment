package com.klef.jfsd.project.StudentCarrerProject.controller;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import com.klef.jfsd.project.StudentCarrerProject.model.Admin;
import com.klef.jfsd.project.StudentCarrerProject.model.Question;
import com.klef.jfsd.project.StudentCarrerProject.model.Student;
import com.klef.jfsd.project.StudentCarrerProject.service.AdminService;
import com.klef.jfsd.project.StudentCarrerProject.service.QuestionService;
import com.klef.jfsd.project.StudentCarrerProject.service.QuizService;

import jakarta.servlet.http.HttpServletRequest;

@RestController

public class AdminController {
	@Autowired
	private AdminService servies;
	
	@Autowired
	QuestionService questionservice;
	
	@Autowired
	QuizService quizservice;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	@PostMapping("cheakadminlogin")
	public ModelAndView cheakadminlogin(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		String name = request.getParameter("cname");
		String password = request.getParameter("password");
		Admin ad = servies.cheakAdminLogin(name, password);
		
		if(ad!=null) {
			mv.setViewName("adminhome");
		}
		else {
			mv.setViewName("adminloginfail");
			mv.addObject("msg","loginfailed!...........");
		}
		return mv;
	}
	@GetMapping("viewallstudent")
	public ModelAndView viewallstudents() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallstudent");
		List<Student> students =servies.viewAllStudent();
		mv.addObject("studentList",students);
		return mv;
	}
	
	@GetMapping("/viewallquestions")
	public ModelAndView viewAllQuestions() {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("viewallquestions");
	    List<Question> questions = questionservice.getAllQuestions();
	    mv.addObject("questionList", questions);
	    return mv;
	}



	
	
	@GetMapping("category/{category}")
	public ResponseEntity <List<Question>> getQuetionsByCategory(@PathVariable String category){
		return questionservice.getQuetionsByCategory(category);
	}
	
	
	@PostMapping("/add")
	public String addQuestion(@RequestParam String questionTitle,
	                          @RequestParam String option1,
	                          @RequestParam String option2,
	                          @RequestParam String option3,
	                          @RequestParam String option4,
	                          @RequestParam String rightAnswer,
	                          @RequestParam String difficultlevel,
	                          @RequestParam String category) {
	    
	    // Create and populate the Question object
	    Question question = new Question();
	    question.setQuestionTitle(questionTitle);
	    question.setOption1(option1);
	    question.setOption2(option2);
	    question.setOption3(option3);
	    question.setOption4(option4);
	    question.setRightAnswer(rightAnswer);
	    question.setDifficultlevel(difficultlevel);
	    question.setCategory(category);

	    // Add the question to the database using the service
	    questionservice.addQuestion(question);

	    // Return a view or redirect to another page
	    return "redirect:/success"; // Modify according to your actual flow
	}


	
	
	@DeleteMapping("delete/{id}")
	public Object deleteQuestion(@PathVariable int id) {
		return questionservice.deleteQuestion(id);
	}
	
	
	@GetMapping("/update")
    public String showUpdateForm(@RequestParam("id") int id, Model model) {
        // Find the question by ID
        Question question = questionservice.findById(id);
        if (question != null) {
            model.addAttribute("question", question);
            return "updateQuestion";  // Return the JSP page with the form
        }
        return "redirect:/error";  // If question is not found, redirect to error page
    }

    // POST mapping to update the question
    @PostMapping("/update")
    public String updateQuestion(@RequestParam("id") int id,
                                 @RequestParam("questionTitle") String questionTitle,
                                 @RequestParam("option1") String option1,
                                 @RequestParam("option2") String option2,
                                 @RequestParam("option3") String option3,
                                 @RequestParam("option4") String option4,
                                 @RequestParam("rightAnswer") String rightAnswer,
                                 @RequestParam("difficultlevel") String difficultlevel,
                                 @RequestParam("category") String category) {

        // Find the question by ID
        Question question = questionservice.findById(id);
        if (question != null) {
            // Update the question fields manually
            question.setQuestionTitle(questionTitle);
            question.setOption1(option1);
            question.setOption2(option2);
            question.setOption3(option3);
            question.setOption4(option4);
            question.setRightAnswer(rightAnswer);
            question.setDifficultlevel(difficultlevel);
            question.setCategory(category);

            // Save the updated question
            questionservice.updateQuestion(question);
        }

        // Redirect to a success page after the update
        return "redirect:/updateSuccess.jsp";
  // Redirect to a success page after update
    }
	    

	@GetMapping("deletestudent")
	public ModelAndView deletestudent() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletestudent");
		List<Student> students =servies.viewAllStudent();
		mv.addObject("studentlist",students);
		return mv;
	}
	@GetMapping("delete")
	public String delete(@RequestParam int id)
	{
		servies.deleteStudent(id);
		
		return "redirect:/deleteStudent";
	}
	@GetMapping("viewstudentbyid")
	 public ModelAndView viewstudentbyid() {
		ModelAndView mv = new ModelAndView();
		List<Student> students =servies.viewAllStudent();
		mv.addObject("studentlist",students);
		
		
		mv.setViewName("viewstudentbyid");
		return mv;
	}
	@PostMapping("displaystudent")
	
	public ModelAndView displaycustomer(HttpServletRequest request)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		
		Student student = servies.displaystudentById(id);
		
		ModelAndView mv = new ModelAndView("displaystudent");
		mv.addObject("c",student);
		
		return mv;
	}
	
	
	@PostMapping("create")
	public ResponseEntity<String> createQuiz(@RequestParam String category,@RequestParam int numQ,@RequestParam String title){
		return quizservice.createQuiz(category,numQ,title);
	}


	@GetMapping("verifyuser")
	public ModelAndView verifyUser(@RequestParam("id") int id) {
	    ModelAndView mv = new ModelAndView();
	    String msg = servies.verifyUser(id); // Assuming this method verifies the student
	    mv.addObject("msg", msg); // Display the message
	    mv.setViewName("redirect:/viewallstudent"); // Redirect back to the view all students page
	    return mv;
	}

	
	
}