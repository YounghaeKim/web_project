package www.spring.com.model;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.spring.com.board.mapper.BoardMapper;
import www.spring.com.board.model.BoardVO;
import www.spring.com.board.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod=@__({@Autowired}))
	private BoardMapper boardMapper;

	//@Test
	public void testGetList() {
		boardMapper.getList().forEach(board -> log.info(board)); //람다식 활용
	}
	
	//@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성 하는 내용");
		board.setWriter("장석현");
		
		boardMapper.insert(board);
		
		log.info(board);
	}
	
	//@Test
	public void testInsertKey() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성 하는 내용 select key");
		board.setWriter("장석현");
		
		boardMapper.insert(board);
		
		log.info(board);
	}
	
	//@Test
	public void testRead() {
		//존재하는 게시물 번호로 테스트
		BoardVO board = boardMapper.read(7864421L);
		log.info(board);
	}
	
	//@Test
	public void testDelete() {
		log.info("DELETE_COUNT: " + boardMapper.delete(7864421L));
		
	}
	
	//@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		//실행전 존재하는 번호인지 확인할 것
		board.setBno(5L);
		board.setTitle("수정된 제목이야");
		board.setContent("수정된 내용이야");
		board.setWriter("user00");
		
		int count = boardMapper.update(board);
		log.info("UPDATE_COUNT: " + count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board.getBno()));
		
	}
}
