package com.nexmore.web.model;
import lombok.Data;

@Data
public class NexUserVo {
	private String user_id;
	private String user_pw;
	private int auth;
}
