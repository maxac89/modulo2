package com.example.modulo2.dao;

import com.example.modulo2.entities.Subject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.data.jpa.domain.AbstractPersistable_.id;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDAOImpl implements SubjectDAO{
    
    private EntityManager entityManager;
    
    @Autowired
    public SubjectDAOImpl(EntityManager entityManager){
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
        theQuery =
                entityManager.createQuery("FROM Subject", Subject.class);
        return theQuery.getResultList();
    }

    @Override
    public List<Subject> materias() {
        TypedQuery<Subject> theQuery = entityManager.createQuery(
        "SELECT s FROM Subject s JOIN FETCH s.teacher WHERE s.id = :theId", Subject.class);
        theQuery.setParameter("theId", id);    
        return theQuery.getResultList();
    }
    
    @Override
    @Transactional
    public void update(Subject theSubject){
        entityManager.merge(theSubject);
    }
    
    @Override
    @Transactional
    public void delete(Integer id){
        Subject subject = this.entityManager.find(Subject.class, id);
        
        entityManager.remove(subject);
    }
}
