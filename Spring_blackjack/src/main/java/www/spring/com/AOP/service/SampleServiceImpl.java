package www.spring.com.AOP.service;

import org.springframework.stereotype.Service;

@Service //@Service = 스프링에서 빈으로 사용할 수 있도록 설정
public class SampleServiceImpl implements SampleService {

	@Override
	public Integer doAdd(String str1, String str2) throws Exception {
		return Integer.parseInt(str1) + Integer.parseInt(str2);
		//단순 문자열을 변환해서 더하기 연산을 하는 단순 작업
	}

	
}
