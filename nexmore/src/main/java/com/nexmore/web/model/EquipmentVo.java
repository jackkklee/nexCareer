package com.nexmore.web.model;
import lombok.Data;

@Data
public class EquipmentVo {
	private String user_id;
	private String equip_model;
	private String equip_serial;
	private String group;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEquip_model() {
		return equip_model;
	}
	public void setEquip_model(String equip_model) {
		this.equip_model = equip_model;
	}
	public String getEquip_serial() {
		return equip_serial;
	}
	public void setEquip_serial(String equip_serial) {
		this.equip_serial = equip_serial;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
}
