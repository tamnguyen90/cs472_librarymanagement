package edu.miu.cs472.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Book implements Serializable{

	private static final long serialVersionUID = -284993669099407157L;
	public static final String STORAGE_TYPE = "BOOK";
	
	
	private String isbn;
	private String title;
	private List<Author> authors = new ArrayList<>();
	private int maxCheckout;
	
	public Book() {}
	
	public Book(String isbn, String title) {
		super();
		this.isbn = isbn;
		this.title = title;
	}

	public Book(String isbn, String title, List<Author> authors) {
		this(isbn, title);
		this.authors = authors;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Author> getAuthors() {
		return authors;
	}


	public void setAuthors(List<Author> authors) {
		if (authors == null || authors.isEmpty()) {
			return;
		}
		this.authors = authors;
	}

	public void addAuthor(Author author) {
		this.authors.add(author);
	}

	public int getMaxCheckout() {
		return maxCheckout;
	}

	public void setMaxCheckout(int maxCheckout) {
		this.maxCheckout = maxCheckout;
	}
}
