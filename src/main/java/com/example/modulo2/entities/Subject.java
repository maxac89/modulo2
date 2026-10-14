package com.example.modulo2.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "subject")
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "credits")
    private int credits;
    
    @Column(name = "lectureHours")
    private int lectureHours;

    @Column(name = "teacherId")
    private int teacherId;

    public Subject() {
    }

    public Subject(int id, String name, int credits, int lectureHours, int teacherId) {
        this.id = id;
        this.name = name;
        this.credits = credits;
        this.lectureHours = lectureHours;
        this.teacherId = teacherId;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public int getLectureHours() {
        return lectureHours;
    }

    public void setLectureHours(int lectureHours) {
        this.lectureHours = lectureHours;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "Subject{" + "id=" + id + ", name=" + name + ", credits=" + credits + ", lectureHours=" + lectureHours + ", teacherId=" + teacherId + '}';
    }
}