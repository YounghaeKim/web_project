package www.spring.com.AOP.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.spring.com.board.mapper.Sample1Mapper;
import www.spring.com.board.mapper.Sample2Mapper;

@Service
@Log4j
public class SamepleTxServiceImpl implements SampleTxService {

	@Setter(onMethod=@__({@Autowired}))
	private Sample1Mapper mapper1;
	
	@Setter(onMethod=@__({@Autowired}))
	private Sample2Mapper mapper2;

	@Transactional
	@Override
	public void addData(String value) {
		
		log.info("mapper1......................");
		mapper1.insertCol1(value);
		
		log.info("mapper2......................");
		mapper2.insertCol2(value);
		
		log.info("end..........................");
		
	}
	
}
