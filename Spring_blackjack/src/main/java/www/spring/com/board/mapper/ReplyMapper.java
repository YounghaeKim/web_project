package www.spring.com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.spring.com.board.model.Criteria;
import www.spring.com.board.model.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo); //등록
	
	public ReplyVO read(Long bno); //조회
	
	public int delete(Long rno); //삭제
	
	public int update(ReplyVO reply); //수정
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno); //페이징 처리
	
	
}
