package exboard;

import java.sql.*;

public class Board_1 {
	private int bo_num;
	private String bo_writer;
	private String bo_password;
	private String bo_brand;  //상품명/제목
	private String bo_price;  //가격
	private String bo_capacity;  //용량
	private String bo_place;   //구매장소
	private String bo_grade;  //평점
	private String bo_pros;  //장점
	private String bo_cons;  //단점
	private String bo_reco;  //추천
	private String bo_imag;   //사진
	private int bo_readcount;    //조회수
	private int bo_likecount;    //좋아요수
	private Timestamp reg_date; //작성일
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_writer() {
		return bo_writer;
	}
	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}
	public String getBo_password() {
		return bo_password;
	}
	public void setBo_password(String bo_password) {
		this.bo_password = bo_password;
	}
	public String getBo_brand() {
		return bo_brand;
	}
	public void setBo_brand(String bo_brand) {
		this.bo_brand = bo_brand;
	}
	public String getBo_price() {
		return bo_price;
	}
	public void setBo_price(String bo_price) {
		this.bo_price = bo_price;
	}
	public String getBo_capacity() {
		return bo_capacity;
	}
	public void setBo_capacity(String bo_capacity) {
		this.bo_capacity = bo_capacity;
	}
	public String getBo_place() {
		return bo_place;
	}
	public void setBo_place(String bo_place) {
		this.bo_place = bo_place;
	}
	public String getBo_grade() {
		return bo_grade;
	}
	public void setBo_grade(String bo_grade) {
		this.bo_grade = bo_grade;
	}
	public String getBo_pros() {
		return bo_pros;
	}
	public void setBo_pros(String bo_pros) {
		this.bo_pros = bo_pros;
	}
	public String getBo_cons() {
		return bo_cons;
	}
	public void setBo_cons(String bo_cons) {
		this.bo_cons = bo_cons;
	}
	public String getBo_reco() {
		return bo_reco;
	}
	public void setBo_reco(String bo_reco) {
		this.bo_reco = bo_reco;
	}
	public String getBo_imag() {
		return bo_imag;
	}
	public void setBo_imag(String bo_imag) {
		this.bo_imag = bo_imag;
	}
	public int getBo_readcount() {
		return bo_readcount;
	}
	public void setBo_readcount(int bo_readcount) {
		this.bo_readcount = bo_readcount;
	}
	public int getBo_likecount() {
		return bo_likecount;
	}
	public void setBo_likecount(int bo_likecount) {
		this.bo_likecount = bo_likecount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}


}
