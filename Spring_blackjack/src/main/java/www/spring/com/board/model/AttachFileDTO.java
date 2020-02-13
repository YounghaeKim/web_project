package www.spring.com.board.model;

import lombok.Data;


//첨부파일의 정보를 저장하는 클래스
@Data
public class AttachFileDTO {

	private String fileName; //파일이름
	private String uploadPath; //업로드 경로
	private String uuid; //uuid값
	private boolean image; //이미지 확인 여부
}
