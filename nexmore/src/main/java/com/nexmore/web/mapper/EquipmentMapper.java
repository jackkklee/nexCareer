package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.EquipmentVo;
@Repository
public interface EquipmentMapper {
	List<EquipmentVo> list();
}
