package com.ch.my.model;

import java.sql.Date;

public class Text {

	private int text_room_num;
	private String texts;
	private String text_mem_id;
	private Date text_date;
	public int getText_room_num() {
		return text_room_num;
	}
	public Date getText_date() {
		return text_date;
	}
	public void setText_date(Date text_date) {
		this.text_date = text_date;
	}
	public void setText_room_num(int text_room_num) {
		this.text_room_num = text_room_num;
	}
	public String getText_mem_id() {
		return text_mem_id;
	}
	public void setText_mem_id(String text_mem_id) {
		this.text_mem_id = text_mem_id;
	}
	public String getTexts() {
		return texts;
	}
	public void setTexts(String texts) {
		this.texts = texts;
	}

}
