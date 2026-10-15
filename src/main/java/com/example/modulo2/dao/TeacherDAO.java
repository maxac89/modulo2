package com.example.modulo2.dao;

import com.example.modulo2.entities.Subject;
import com.example.modulo2.entities.Teacher;
import java.util.List;

  
    public interface TeacherDAO {
        void save(Teacher theTeacher);
        Teacher findById(Integer id);
        List<Teacher> findAll();
        void update(Teacher theTeacher);
        void delete(Integer id);
        List<Subject> findSubjectsByTeacherId(Integer id);
    }

