package edu.osu.cse5234.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PAYMENT_INFO")
public class PaymentInfo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private int id;
	@Column(name="CARD_NUM")
	
	private String card_number;
	@Column(name="EXP_DATE")
	
	private String expiration_date;
	@Column(name="CVV")
	private String cvvCode;
	
	@Column(name="HOLDER_NAME")
	private String holder_name;
	

	public PaymentInfo() {
		
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public void setCard_number(String number) {
		this.card_number = number;
	}
	public String getCard_number() {
		return this.card_number;
	}
	
	public void setExpiration_date(String date) {
		this.expiration_date = date;
	}
	public String getExpiration_date() {
		return this.expiration_date;
	}
	
	public void setCvvCode(String code) {
		this.cvvCode = code;
	}
	public String getCvvCode() {
		return this.cvvCode;
	}
	
	public void setHolder_name(String name) {
		this.holder_name = name;
	}
	public String getHolder_name() {
		return this.holder_name;
	}
}
