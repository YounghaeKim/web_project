package www.spring.com.cashCharging.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.spring.com.cashCharging.service.CashChargingService;
import www.spring.com.user.model.UserVO;

@Controller
public class CashChargingController {
	
	@Autowired
	private CashChargingService boardService;//서비스에 연결시킨다.
	
	@RequestMapping("/cashCharging.do")
	public String listAllBoard(Model model) {
		List<UserVO> listAllBoard = boardService.getAllBoard();
		model.addAttribute("listAllCustomer", listAllBoard);
		return "cashCharging/cashChargingPage";
	}
}
