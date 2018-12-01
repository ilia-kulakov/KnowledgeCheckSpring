package com.epam.javatraining.spring.web.exception;

public class UsernameExistsException extends Exception {

    private String description;

    public UsernameExistsException(String username) {

        description = "There is an account with that username: " + username;
    }

    public UsernameExistsException(String username, Exception e) {

        super("There is an account with that username: " + username, e);
        description = "There is an account with that username: " + username;
    }

    public String toString() {
        return "UsernameExistsException: " + description;
    }
}