package com.epam.javatraining.spring.web.domain;

import org.apache.logging.log4j.util.Strings;

public class Subject {
    private Long id;
    private String name;

    public Subject(){

    }

    public Subject(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIncorrect() {
        return  Strings.isBlank(name);
    }

    public boolean isCorrect() {
        return !isIncorrect();
    }
}
