package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.NexUserInfoVo;

@Repository
public interface NexUserInfoMapper {
	List<NexUserInfoVo> list();
}
