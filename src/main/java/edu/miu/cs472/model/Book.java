package edu.miu.cs472.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Book implements Serializable{

	private static final long serialVersionUID = -284993669099407157L;

	private String isbn;
	private String title;
	private List<Author> authors = new ArrayList<>();
	private int maxCheckout;
	private boolean isCheckout = false;
	
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

	public Book(String isbn, String title, List<Author> authors, int maxCheckout) {
		this(isbn, title, authors);
		this.maxCheckout = maxCheckout;
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

	public String getAuthorStr() {
		return authors.stream().map(ath -> ath.getFullName()).collect(Collectors.joining(", ")).toString();
	}


	public void setAuthors(List<Author> authors) {
		if (authors == null || authors.isEmpty()) {
			return;
		}
		this.authors = authors;
	}

	public void addAuthor(String authStr) {
		if (authStr == null || authStr.isEmpty()) {
			return;
		}
		String[] auths = authStr.split(",");
		for (String auth : auths) {
			String[] temp = auth.split(" ");
			String firstName = temp[0];
			String lastName = "";
			if (temp.length > 1) {
				for(int i = 1; i < temp.length; i ++) {
					lastName += temp[i];
					lastName += " ";
				}
			}
			authors.add(new Author(firstName, lastName));
		}
	}

	public int getMaxCheckout() {
		return maxCheckout;
	}

	public void setMaxCheckout(int maxCheckout) {
		this.maxCheckout = maxCheckout;
	}

	public void setCheckout(boolean checkout) {
		isCheckout = checkout;
	}

	public boolean isCheckout() {
		return isCheckout;
	}
}
