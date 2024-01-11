package com.sist.vo;

import java.util.Date;

public class ReserveVO {
	private MemberVO mvo=new MemberVO();
    private GoCampingVO gvo=new GoCampingVO();
    
    private int rsvno,campingno,ischeck;
    private String id,checkin,checkout,timein,timeout,inwon,price;
    private Date regdate;
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public GoCampingVO getGvo() {
		return gvo;
	}
	public void setGvo(GoCampingVO gvo) {
		this.gvo = gvo;
	}
	public int getRsvno() {
		return rsvno;
	}
	public void setRsvno(int rsvno) {
		this.rsvno = rsvno;
	}
	public int getCampingno() {
		return campingno;
	}
	public void setCampingno(int campingno) {
		this.campingno = campingno;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIscheck(int ischeck) {
		this.ischeck = ischeck;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getTimein() {
		return timein;
	}
	public void setTimein(String timein) {
		this.timein = timein;
	}
	public String getTimeout() {
		return timeout;
	}
	public void setTimeout(String timeout) {
		this.timeout = timeout;
	}
	public String getInwon() {
		return inwon;
	}
	public void setInwon(String inwon) {
		this.inwon = inwon;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
