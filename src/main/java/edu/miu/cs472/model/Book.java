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
	private List<BookCopy> copies = new ArrayList<BookCopy>();
	private String authors;
	private int maxCheckout;
	
	public Book() {}
	
	public Book(String isbn, String title, List<BookCopy> copies, String authors) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.copies = copies;
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

	public List<BookCopy> getCopies() {
		return copies;
	}

	public void setCopies(List<BookCopy> copies) {
		if (copies == null || copies.isEmpty()) {
			return;
		}
		this.copies = copies;
	}
	
	public void addBookCopy(BookCopy copy) {
		if (copy != null) {
			this.copies.add(copy);
		}
	}

	public String getAuthors() {
		return authors;
	}


	public void setAuthors(String authors) {
		if (authors == null || authors.isEmpty()) {
			return;
		}
		this.authors = authors;
	}


	public int getMaxCheckout() {
		return maxCheckout;
	}

	public void setMaxCheckout(int maxCheckout) {
		this.maxCheckout = maxCheckout;
	}
}
