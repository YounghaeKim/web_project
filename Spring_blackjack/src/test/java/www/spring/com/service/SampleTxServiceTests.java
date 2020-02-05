package www.spring.com.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.spring.com.AOP.service.SampleTxService;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SampleTxServiceTests {

	
	@Setter(onMethod=@__({@Autowired}))
	private SampleTxService service;
	
	@Test//@Transactional 이 선언 안되면 테이블 두개중 하나가 에러 나면 한쪽만 입력됨 선언되면 동시에 안들어감
	public void testLong() {
		
		String str ="Starry\r\n" +
				"Starry night\r\n" +
				"Paint your palette blue and grey\r\n" +
				"Look out on a summer's day";
		
		log.info(str.getBytes().length);
		
		service.addData(str);
		
	}
	
}
