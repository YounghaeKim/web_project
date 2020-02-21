package www.spring.com.board.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt; //댓글의 숫자
	
	private List<BoardAttachVO> attachList; 
	// └등록시 한 번에 BoardAttachVO를 처리할 수 있도록 List<BoardAttachVO>를 추가 
}
