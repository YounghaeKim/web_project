package www.spring.com.board.mapper;

import java.util.List;

import www.spring.com.board.model.BoardVO;
import www.spring.com.board.model.Criteria;

public interface BoardMapper {
	
	//@Select("select * from qna_board where bno > 0")
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
