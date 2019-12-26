package www.spring.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import www.spring.com.board.mapper.BoardMapper;
import www.spring.com.board.model.BoardVO;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod=@__({@Autowired}))
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		System.out.println("register....." + board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {

		System.out.println("get테스트 입니다. :" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) { //수정하다

		System.out.println("modify테스트 입니다. : " + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		
		System.out.println("remove테스트 입니다. :" + bno );
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		System.out.println("getList...............");
		return mapper.getList();
	}

}
