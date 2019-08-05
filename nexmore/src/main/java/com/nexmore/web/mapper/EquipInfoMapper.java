package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.EquipInfoVo;

@Repository
public interface EquipInfoMapper {
	List<EquipInfoVo> list();
}
