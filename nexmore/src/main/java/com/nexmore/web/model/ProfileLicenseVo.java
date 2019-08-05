package com.nexmore.web.model;
import java.util.Date;

import lombok.Data;

@Data
public class ProfileLicenseVo {
	private String user_id;
	private String license_name;
	private Date license_date;
}
