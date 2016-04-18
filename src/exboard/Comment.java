package exboard;
import java.sql.*;
public class Comment {
	private int c_num;
	private String c_content;
	private Date c_reg_date;
	private int c_ref;
	private int c_ref_step;
	private int c_ref_level;
	public int getC_ref_step() {
		return c_ref_step;
	}
	public void setC_ref_step(int c_ref_step) {
		this.c_ref_step = c_ref_step;
	}
	public int getC_ref_level() {
		return c_ref_level;
	}
	public void setC_ref_level(int c_ref_level) {
		this.c_ref_level = c_ref_level;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_reg_date() {
		return c_reg_date;
	}
	public void setC_reg_date(Date c_reg_date) {
		this.c_reg_date = c_reg_date;
	}
	public int getC_ref() {
		return c_ref;
	}
	public void setC_ref(int c_ref) {
		this.c_ref = c_ref;
	}
}
