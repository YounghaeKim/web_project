package www.spring.com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.spring.com.board.mapper.ReplyMapper;
import www.spring.com.board.model.Criteria;
import www.spring.com.board.model.ReplyPageDTO;
import www.spring.com.board.model.ReplyVO;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod=@__({@Autowired}))
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		
		log.info("register....." + vo);
		
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

	@Override
	public int remove(Long rno) {
		log.info("remove....." + rno);
		
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
