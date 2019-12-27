package www.spring.com.board.mapper;

import java.util.List;

import www.spring.com.board.model.BoardVO;

public interface BoardMapper {
	
	//@Select("select * from qna_board where bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
