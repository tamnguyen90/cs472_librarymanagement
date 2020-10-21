package edu.miu.cs472.model;

public class LibraryMember extends Person {
	
	private static final long serialVersionUID = -7206984963573838605L;

	private static int starter = 0;
	private int memberId;
	
	public LibraryMember() {}
	
	public LibraryMember(String firstName, String lastName, Address address, String phone) {
		super(firstName, lastName, address, phone);
		this.memberId = ++starter;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

}
