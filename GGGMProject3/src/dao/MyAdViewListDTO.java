package dao;

import java.util.Date;

public class MyAdViewListDTO {
	private String memberid;
	private Date when;
	private int adno;
	private int point;
	private String description;
	private int balance;
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Date getWhen() {
		return when;
	}
	public void setWhen(Date when) {
		this.when = when;
	}
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
}
