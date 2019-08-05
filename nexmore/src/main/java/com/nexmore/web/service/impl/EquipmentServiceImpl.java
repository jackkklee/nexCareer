package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.EquipmentMapper;
import com.nexmore.web.model.EquipmentVo;
import com.nexmore.web.service.EquipmentService;



@Service("equip")
public class EquipmentServiceImpl implements EquipmentService{
	@Autowired
	private EquipmentMapper ed;

	public List<EquipmentVo> list() {
		return ed.list();
	}
	
	
}
