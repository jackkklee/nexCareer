package kr.co.ucp.neww;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.ucp.neww.service.NewService;

@Controller
public class NewController {
	@Autowired
	private NewService ns;
}
