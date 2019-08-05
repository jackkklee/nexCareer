package com.nexmore.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nexmore.web.mapper.EquipInfoMapper;
import com.nexmore.web.model.EquipInfoVo;
import com.nexmore.web.service.EquipmentInfoService;




@Service("equipInfo")
public class EquipmentInfoServiceImpl implements EquipmentInfoService{
	@Autowired
	private EquipInfoMapper equipInfo;

	public List<EquipInfoVo> list() {
		return equipInfo.list();
	}
	
	
}
