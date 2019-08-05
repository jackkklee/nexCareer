package com.nexmore.web.model;
import java.util.Date;

import lombok.Data;

@Data
public class ProfileCareerVo {
	private String user_id;
	private String company_name;
	private Date carrer_start;
	private Date carrer_end;
	private int hire_term;
	private String main_career;
}
