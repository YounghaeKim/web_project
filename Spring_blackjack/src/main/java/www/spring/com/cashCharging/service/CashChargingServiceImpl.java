package www.spring.com.cashCharging.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.UserMapper;

@Service
public class CashChargingServiceImpl implements CashChargingService{

	@Autowired
	private UserMapper boardMapper;
	
}
