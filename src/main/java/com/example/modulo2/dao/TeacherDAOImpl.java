package com.example.modulo2.dao;

import com.example.modulo2.entities.Subject;
import com.example.modulo2.entities.Teacher;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAOImpl implements TeacherDAO {

    private EntityManager entityManager;

    @Autowired
    public TeacherDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public void save(Teacher theTeacher) {
        this.entityManager.persist(theTeacher);
    }

    @Override
    public Teacher findById(Integer id) {
        return this.entityManager.find(Teacher.class, id);
    }

    @Override
    public List<Teacher> findAll() {
        TypedQuery<Teacher> theQuery;
        theQuery
                = entityManager.createQuery("FROM Teacher", Teacher.class);
        return theQuery.getResultList();
    }

    @Override
    @Transactional
    public void update(Teacher theTeacher) {
        entityManager.merge(theTeacher);
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        Teacher teacher = this.entityManager.find(Teacher.class, id);

        entityManager.remove(teacher);
    }

    @Override
    public List<Subject> findSubjectsByTeacherId(Integer id) {
        Query query = entityManager.createNativeQuery(
                "SELECT * FROM subject WHERE teacher_id = :theTeacherId", Subject.class);
        query.setParameter("theTeacherId", id);
        return query.getResultList();
    }
}
