package www.spring.com.robby;

import java.util.ArrayList;
import java.util.List;

public class Robby {
	private List<Room> rooms = new ArrayList<>();
	
	
	//room을 추가하고 삭제하는 함수
	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	
	
	
	
}
