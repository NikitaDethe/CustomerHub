package com.nikita.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="customers")
public class Customer {
	
	@Id
	@Column(name="custno")
	private int custno;
	
	
	
	private String custnm;
	
	
	private String city;
	
	
	private String prodnm;
	
	

	private int prodid;
	
	private int price;
	

	private String paymode;

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}


	public String getCustnm() {
		return custnm;
	}

	public void setCustnm(String custnm) {
		this.custnm = custnm;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getProdid() {
		return prodid;
	}
	
	public String getProdnm() {
		return prodnm;
	}

	public void setProdnm(String prodnm) {
		this.prodnm = prodnm;
	}
	

	public void setProdid(int prodid) {
		this.prodid = prodid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	public String getPaymode() {
		return paymode;
	}

	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}
	
	
}
