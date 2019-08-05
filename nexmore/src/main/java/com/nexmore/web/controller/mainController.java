package com.nexmore.web.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nexmore.web.model.EquipInfoVo;
import com.nexmore.web.model.EquipmentVo;
import com.nexmore.web.model.NexUserInfoVo;
import com.nexmore.web.model.NexUserVo;
import com.nexmore.web.model.ProfileCareerVo;
import com.nexmore.web.model.ProfileLicenseVo;
import com.nexmore.web.model.ProfileVo;
import com.nexmore.web.service.EquipmentInfoService;
import com.nexmore.web.service.EquipmentService;
import com.nexmore.web.service.NexUserInfoService;
import com.nexmore.web.service.NexUserService;
import com.nexmore.web.service.ProfileCareerService;
import com.nexmore.web.service.ProfileLicenseService;
import com.nexmore.web.service.ProfileService;

@Controller
public class mainController {
	
private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
@Resource(name = "equipInfo")
	private EquipmentInfoService equipInfo;
	@Resource(name = "equip")
	private EquipmentService equip;
	@Resource(name = "userInfo")
	private NexUserInfoService userInfo;
	@Resource(name = "user")
	private NexUserService user;
	@Resource(name = "career")
	private ProfileCareerService career;
	@Resource(name = "license")
	private ProfileLicenseService license;
	@Resource(name = "profile")
	private ProfileService profile;
		
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String home(Locale locale, Model model) {
		System.out.println("1111111111111111111111111111111");
		List<EquipmentVo> list = equip.list();
		System.out.println("equip = "+list);
		List<EquipInfoVo> list2 = equipInfo.list();
		System.out.println("equipInfo = "+list2);
		List<NexUserInfoVo> list3 = userInfo.list();
		System.out.println("userInfo = "+list3);
		List<NexUserVo> list4 = user.list();
		System.out.println("user = "+list4);
		List<ProfileCareerVo> list5 = career.list();
		System.out.println("career = "+list5);
		List<ProfileLicenseVo> list6 = license.list();
		System.out.println("license = "+list6);
		List<ProfileVo> list7 = profile.list();
		System.out.println("profile = "+list7);
		logger.info("Welcome home! The client locale is {}.", locale);
		return "public:common/login.tiles";
	}
}
