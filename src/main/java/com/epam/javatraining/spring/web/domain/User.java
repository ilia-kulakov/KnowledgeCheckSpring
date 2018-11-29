package com.epam.javatraining.spring.web.domain;

public class User {

    private Long id;
    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String email;
    private String role;
    private boolean verified;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(User other) {
        this.id = other.id;
        this.firstName = other.firstName;
        this.lastName = other.lastName;
        this.username = other.username;
        this.password = other.password;
        this.email = other.email;
        this.role = other.role;
        this.verified = other.verified;
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullname() {
        return firstName + " " + lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    public String toString() {
        String format = "User { id : %d, firstName : %s, lastName : %s, username : %s, password : %s, email : %s, role : %s, verified : %s }";
        return String.format(format, id, firstName, lastName, username, password, email, role.toString(), verified ? "true" : "false");
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || obj.getClass() != this.getClass()) {
            return false;
        }

        User other = (User) obj;
        return this.id.equals(other.id)
                && this.firstName.equals(other.firstName)
                && this.lastName.equals(other.lastName)
                && this.email.equals(other.email)
                && this.username.equals(other.username)
                && this.password.equals(other.password)
                && this.role.equals(other.role)
                && (this.verified == other.verified);
    }
}
