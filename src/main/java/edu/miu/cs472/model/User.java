package edu.miu.cs472.model;

import java.io.Serializable;

public class User implements Serializable{
	
	private static final long serialVersionUID = -1964357865647441722L;
	public static final String STORAGE_TYPE = "USER";
	
	
	private String username;
	private String password;
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
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

}
