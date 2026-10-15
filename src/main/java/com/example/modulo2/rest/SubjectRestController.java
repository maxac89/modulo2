package com.example.modulo2.rest;

import com.example.modulo2.dao.SubjectDAO;
import com.example.modulo2.entities.Subject;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class SubjectRestController {

    private SubjectDAO subjectDAO;

    @Autowired
    public SubjectRestController(SubjectDAO theSubjectDAO) {
        subjectDAO = theSubjectDAO;
    }

    @GetMapping("/subjects")
    public List<Subject> findAll() {
        return subjectDAO.findAll();
    }

    @GetMapping("/subjects/{subjectId}")
    public Subject getSubject(@PathVariable int subjectId) {

        Subject subject = this.subjectDAO.findById(subjectId);

        if (subject == null) {
            throw new RuntimeException("Subject id not found - " + subjectId);
        }

        return subject;
    }

    @PostMapping("/subjects")
    public Subject addSubject(@RequestBody Subject theSubject) {

        this.subjectDAO.save(theSubject);

        return theSubject;
    }

    @PutMapping("/subjects")
    public Subject updateSubject(@RequestBody Subject theSubject) {

        this.subjectDAO.update(theSubject);

        return theSubject;
    }
    
    @DeleteMapping("/subjects/{subjectId}")
    public String deleteSubject(@PathVariable int subjectId) {
        
        this.subjectDAO.delete(subjectId);
        
        return "Deleted subjectId: " + subjectId;
    }
}
