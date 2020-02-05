package www.spring.com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	//updateReplyCnt는 해당 게시물의 번호인 bno의 증가나 감소를 의미하는 amount 변수에 파라미터를 받을 수 있도록 처리했다.
	//댓글이 등록되면 1증가 댓글이 삭제되면 1감소
	
}
