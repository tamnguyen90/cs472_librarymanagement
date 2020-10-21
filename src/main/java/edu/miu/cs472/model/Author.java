package edu.miu.cs472.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Author extends Person implements Serializable{

	private static final long serialVersionUID = 1648296739938896042L;

	public Author(String firstName, String lastName) {
		super(firstName, lastName, null, null);
	}
}
