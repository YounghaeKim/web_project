package www.spring.com.AOP.log;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect//해당 클래스의 객체가 Aspect를 구현한 것임을 나타내기 위해 사용
@Log4j
@Component //AOP와는 관련이 없지만 스프링에서 빈으로 인식하기 위해서 사용
public class LogAdvice { //로그를 기록해주는 클래스

	@Before( "execution(* www.spring.com.AOP.service.SampleService*.*(..))")
	public void logBefore() {//<<<번호 옆에 화살표를 보면 알 수 있다. 영어그대로 프로그램 실행전에 먼저 실행된다.
		
		log.info("========================");
		
	}
	
	@Before( "execution(* www.spring.com.AOP.service.SampleService*.doAdd(String, String)) && args(str1, str2)")
	public void logBeforeWithParam(String str1, String str2) { //args를 이용하면 간단히 파라미터를 구할 수 있다.
		
		log.info("str1: " + str1);
		log.info("str2: " + str2);
		
	}
	
	
	// @AfterThrowing 지정된 대상이 예외를 발생한 후에 동작하면서 문제를 찾을 수 있도록 도와준다.
	@AfterThrowing(pointcut = "execution(* www.spring.com.AOP.service.SampleService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		
		log.info("Exception....!!!!");
		log.info("exception: " + exception);
	}
	
	//Around >>> Before 로 실행 후 걸린 시간이 로그 된다. 
	@Around("execution(* www.spring.com.AOP.service.SampleService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		
		long start = System.currentTimeMillis();
		
		log.info("Target: " + pjp.getTarget());
		log.info("Param: " + Arrays.toString(pjp.getArgs()));
		
		//invoke method
		Object result = null;
		
		try {
			result = pjp.proceed();
		} catch (Throwable e) {
			
			e.printStackTrace();
		}
		
		long end = System.currentTimeMillis();
		
		log.info("Time: " + (end - start));
		
		return result;
	}
	
}
