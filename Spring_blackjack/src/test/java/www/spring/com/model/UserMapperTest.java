package www.spring.com.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
	private UserMapper boardMapper;
	
	@Test
	public void testListAllBoard() {
		List<UserVO> list = boardMapper.getAllBoard();
		for (UserVO board : list) {
			System.out.println(board);
			log.info(board);//보통의 경우
		}
	}

}











