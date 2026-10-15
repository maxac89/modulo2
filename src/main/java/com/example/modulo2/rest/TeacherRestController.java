package com.example.modulo2.rest;

import com.example.modulo2.dao.TeacherDAO;
import com.example.modulo2.entities.Subject;
import com.example.modulo2.entities.Teacher;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class TeacherRestController {

    private TeacherDAO teacherDAO;

    @Autowired
    public TeacherRestController(TeacherDAO theTeacherDAO) {
        teacherDAO = theTeacherDAO;
    }

    @GetMapping("/teachers")
    public List<Teacher> findAll() {
        return teacherDAO.findAll();
    }

    @GetMapping("/teachers/{teacherId}")
    public Teacher getTeacher(@PathVariable int teacherId) {

        Teacher teacher = this.teacherDAO.findById(teacherId);

        if (teacher == null) {
            throw new RuntimeException("Teacher id not found - " + teacherId);
        }

        return teacher;
    }

    @PostMapping("/teachers")
    public Teacher addTeacher(@RequestBody Teacher theTeacher) {

        this.teacherDAO.save(theTeacher);

        return theTeacher;
    }

    @PutMapping("/teachers")
    public Teacher updateTeacher(@RequestBody Teacher theTeacher) {

        this.teacherDAO.update(theTeacher);

        return theTeacher;
    }

    @DeleteMapping("/teachers/{teacherId}")
    public String deleteTeacher(@PathVariable int teacherId) {

        this.teacherDAO.delete(teacherId);

        return "Deleted teacherId: " + teacherId;
    }

    @GetMapping("/teacher/{id}/subjects")
    public Map<String, Object> getTeacherWithSubjects(@PathVariable Integer id) {
        Teacher teacher = teacherDAO.findById(id);
        if (teacher == null) {
            throw new RuntimeException("Teacher id not found - " + id);
        }

        List<Subject> subjects = teacherDAO.findSubjectsByTeacherId(id);

        Map<String, Object> response = new HashMap<>();
        response.put("teacher", teacher);
        response.put("subjects", subjects);

        return response;
    }
}
