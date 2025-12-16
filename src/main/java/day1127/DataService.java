package day1127;

public class DataService {
	
	public String msg(DataDTO dDTO) {
		return dDTO.getName() + "님의 나이는 " + dDTO.getMyAge();
	}// msg
	
}// class
