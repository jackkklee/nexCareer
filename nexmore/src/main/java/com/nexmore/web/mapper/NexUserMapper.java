package com.nexmore.web.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.nexmore.web.model.NexUserVo;

@Repository
public interface NexUserMapper {
	List<NexUserVo> list();
}
