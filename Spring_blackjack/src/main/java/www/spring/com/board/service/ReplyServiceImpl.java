package www.spring.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.spring.com.board.mapper.BoardMapper;
import www.spring.com.board.mapper.ReplyMapper;
import www.spring.com.board.model.Criteria;
import www.spring.com.board.model.ReplyPageDTO;
import www.spring.com.board.model.ReplyVO;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	//새로운 댓글이 추가될때 ReplyMapper, BoardMapper 둘다 사용해야 하는 상황에 되서 Transactional을 사용
	@Setter(onMethod=@__({@Autowired}))
	private ReplyMapper mapper;
	
	@Setter(onMethod=@__({@Autowired}))
	private BoardMapper boardMapper;
	

	@Transactional//register나 remove 둘중하나라도 오류가 나면 처리가 이루어지지 않는다.
	@Override
	public int register(ReplyVO vo) {
		
		log.info("register....." + vo);
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get....." + rno);
		
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify....." + vo);
		
		return mapper.update(vo);
	}

	@Transactional//register나 remove 둘중하나라도 오류가 나면 처리가 이루어지지 않는다.
	@Override
	public int remove(Long rno) {
		log.info("remove....." + rno);
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board : " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno), 
				mapper.getListWithPaging(cri, bno));
	}
	
	
}
