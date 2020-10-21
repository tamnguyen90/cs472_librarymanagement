package edu.miu.cs472.model;

import java.io.Serializable;
import java.time.LocalDate;

public class CheckoutRecordEntry implements Serializable{

	private static final long serialVersionUID = 6238095847861745959L;
	private LocalDate checkoutDate;
	private LocalDate dueDate;
	private Book book;

	private LibraryMember owner;
	
	public CheckoutRecordEntry(LocalDate checkoutDate, LocalDate dueDate, Book book) {
		super();
		this.checkoutDate = checkoutDate;
		this.dueDate = dueDate;
		this.book = book;
	}

	public LocalDate getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(LocalDate checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public LibraryMember getOwner() {
		return owner;
	}

	public void setOwner(LibraryMember owner) {
		this.owner = owner;
	}
	
	
	
}
