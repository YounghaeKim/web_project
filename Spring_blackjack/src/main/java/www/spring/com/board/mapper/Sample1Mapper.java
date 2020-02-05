package www.spring.com.board.mapper;

import org.apache.ibatis.annotations.Insert;

public interface Sample1Mapper {

	@Insert("insert into qna_sample1 (col1) values (#{data})")
	public int insertCol1(String data);//데이터 insert한다
	
}
