package www.spring.com.board.service;

import java.util.List;

import www.spring.com.board.model.Criteria;
import www.spring.com.board.model.ReplyPageDTO;
import www.spring.com.board.model.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo); //등록
	
	public ReplyVO get(Long rno); //특정한 댓글 조회
	
	public int modify(ReplyVO vo); //수정
	
	public int remove(Long rno); //삭제
	
	public List<ReplyVO> getList(Criteria cri, Long bno); //페이지처리 게시물 가져오기
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno); //댓글 페이지 화면 처리
}
