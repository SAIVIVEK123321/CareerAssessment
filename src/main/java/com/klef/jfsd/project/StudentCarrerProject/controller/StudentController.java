package com.klef.jfsd.project.StudentCarrerProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.klef.jfsd.project.StudentCarrerProject.model.Student;
import com.klef.jfsd.project.StudentCarrerProject.service.StudentService;

@RestController
public class StudentController {

    @Autowired
    private StudentService servies;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }

    @GetMapping("studentRegistration")
    public ModelAndView studentRegistration() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentRegistration");
        return mv;
    }

    @GetMapping("studentLogin")
    public ModelAndView customerLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentLogin");
        return mv;
    }

    @PostMapping("insertStudent")
    public ModelAndView insertStudent(HttpServletRequest request) {
        String name = request.getParameter("cname");
        String gender = request.getParameter("gender");
        String dateofbirth = request.getParameter("dateofbirth");
        String email = request.getParameter("email");
        String locationme = request.getParameter("location");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        Student student = new Student();
        student.setName(name);
        student.setGender(gender);
        student.setDataofbirth(dateofbirth);
        student.setEmail(email);
        student.setLocation(locationme);
        student.setContact(contact);
        student.setPassword(password);

        String message = servies.StudentRegistration(student);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentRegSuccus");
        mv.addObject("message", message);
        return mv;
    }

    @PostMapping("/checkstudent")
    public ModelAndView checkStudentLogin(HttpServletRequest request) {
        String email = request.getParameter("email"); // Get email from the request
        String password = request.getParameter("password"); // Get password from the request
        ModelAndView mv = new ModelAndView();

        System.out.println(email + " " + password); // Debugging: log email and password

        Student student = servies.cheackStudentLogin(email, password); // Call service method to check credentials

        if (student == null) {
            // Credentials are invalid
            HttpSession session = request.getSession();
            session.setAttribute("error", "Check your credentials");
            mv.setViewName("studentLogin"); // Redirect to login page
        } else if (!student.isVerified()) {
            // Account is not verified
            mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
            mv.setViewName("ErrorPage"); // Redirect to error page
            System.out.println(student.toString() + "");
        } else {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("student", student); // Store student object in session
            mv.setViewName("studenthome"); // Redirect to student home/dashboard
            System.out.println(student.toString());
        }
        return mv;
    }


    @GetMapping("studenthome")
    public ModelAndView studenthome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("studenthome");
        return mv;
    }

    @GetMapping("studentprofile")
    public ModelAndView studentprofile(HttpSession session) {
        Student student = (Student) session.getAttribute("student");
        ModelAndView mv = new ModelAndView();
        if (student != null) {
            mv.addObject("student", student); // Pass the student object to the view
            mv.setViewName("studentprofile");
        } else {
            mv.setViewName("studentlogfaill"); // Redirect to login fail page if no session
        }
        return mv;
    }
    @GetMapping("updateprofile")
    public ModelAndView updateprofile() {
    	ModelAndView mv=new ModelAndView("updateprofile");
    	return mv;
    }
    
    @PostMapping("updatep")
    public ModelAndView update(HttpServletRequest request) {
    	ModelAndView mv=new ModelAndView("updateprofile");
    	
    	int id = Integer.parseInt(request.getParameter("studentId"));
    	String name = request.getParameter("cname");
        String gender = request.getParameter("gender");
        String dateofbirth = request.getParameter("dateofbirth");
        String location = request.getParameter("location");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setGender(gender);
        student.setDataofbirth(dateofbirth);
        student.setLocation(location);
        student.setContact(contact);
        student.setPassword(password);
        
        servies.updateStudent(student);
        mv.setViewName("home");
    	return mv;
    }
}
