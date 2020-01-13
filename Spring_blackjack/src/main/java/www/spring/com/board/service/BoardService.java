package www.spring.com.board.service;

import java.util.List;

import www.spring.com.board.model.BoardVO;
import www.spring.com.board.model.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);// 게시물 등록하다
	public BoardVO get(Long bno); //특정한 게시물 가져오다
	public boolean modify(BoardVO board); //수정하다
	public boolean remove(Long bno); //특정한 게시물 지우다
	//public List<BoardVO> getList(); //전체 게시물 가져오기
	public List<BoardVO> getList(Criteria cri); //페이지처리 게시물 가져오기
	
}
