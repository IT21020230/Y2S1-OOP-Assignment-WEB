package com.popcorntime.role;

public class User {
	private int id;
    private String email;
    private String username;
    private String password;
    private String role;
    
    public User(int id, String email, String username, String password, String role) {
    	this.id = id;
    	this.email = email;
    	this.username = username;
    	this.password = password;
    	this.role = role;
    }

    public int getId() {
        return this.id;
    }

    public String getEmail() {
        return this.email;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    } 
    
    public String getRole() {
    	return this.role;
    }
}
