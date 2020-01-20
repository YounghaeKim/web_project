package www.spring.com.board.model;

import lombok.Data;

@Data
public class Ticket {
	private int tno;
	private String owner;
	private String grade;
}
