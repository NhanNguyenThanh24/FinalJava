package com.entity;

public class Cart {
    private int idcart;
    private int idbook;
    private int iduser;
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;
	public int getIdcart() {
		return idcart;
	}
	public void setIdcart(int idcart) {
		this.idcart = idcart;
	}
	public int getIdbook() {
		return idbook;
	}
	public void setIdbook(int idbook) {
		this.idbook = idbook;
	}
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
    
    
}
