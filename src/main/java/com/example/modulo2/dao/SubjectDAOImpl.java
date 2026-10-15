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
public class SubjectDAOImpl implements SubjectDAO {

    private EntityManager entityManager;

    @Autowired
    public SubjectDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    @Transactional
    public void save(Subject theSubject) {
        this.entityManager.persist(theSubject);
    }

    @Override
    public Subject findById(Integer id) {
        return this.entityManager.find(Subject.class, id);
    }

    @Override
    public List<Subject> findAll() {
        TypedQuery<Subject> theQuery;
        theQuery
                = entityManager.createQuery("FROM Subject", Subject.class);
        return theQuery.getResultList();
    }

    @Override
    @Transactional
    public void update(Subject theSubject) {
        entityManager.merge(theSubject);
    }

    @Override
    @Transactional
    public void delete(Integer id) {
        Subject subject = this.entityManager.find(Subject.class, id);

        entityManager.remove(subject);
    }

    @Override
    public Object[] findTeacherNameAndLastNameBySubjectId(Integer id) {
        Query query = entityManager.createNativeQuery(
                "SELECT t.first_name, t.last_name FROM teacher t JOIN subject s ON t.id = s.teacher_id WHERE s.id = :theSubjectId");
        query.setParameter("theSubjectId", id);

        List<Object[]> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }


}
