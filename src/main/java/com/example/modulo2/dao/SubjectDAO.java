package com.example.modulo2.dao;

import com.example.modulo2.entities.Subject;
import java.util.List;

  
    public interface SubjectDAO {
        void save(Subject theTeacher);
        Subject findById(Integer id);
        List<Subject> findAll();
        void update(Subject theSubject);
        void delete(Integer id);
    }