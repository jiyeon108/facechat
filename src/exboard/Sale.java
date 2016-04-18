package exboard;

public class Sale {
	
	private int s_num; //key
	private String s_brand; // 브랜드명
	private String s_salename; // 세일명
	private String s_store; // 세일매장
	private String s_term; // 세일기간
	private String s_image ;// 사진
	private int count; //세일등록된 숫자
	private String s_link;
	
	public String getS_link() {
		return s_link;
	}
	public void setS_link(String s_link) {
		this.s_link = s_link;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_brand() {
		return s_brand;
	}
	public void setS_brand(String s_brand) {
		this.s_brand = s_brand;
	}
	public String getS_salename() {
		return s_salename;
	}
	public void setS_salename(String s_salename) {
		this.s_salename = s_salename;
	}
	public String getS_store() {
		return s_store;
	}
	public void setS_store(String s_store) {
		this.s_store = s_store;
	}
	public String getS_term() {
		return s_term;
	}
	public void setS_term(String s_term) {
		this.s_term = s_term;
	}
	public String getS_image() {
		return s_image;
	}
	public void setS_image(String s_image) {
		this.s_image = s_image;
	}
		
}
