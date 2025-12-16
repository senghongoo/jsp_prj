package day1201;

import java.util.ArrayList;
import java.util.List;

import day1127.DataDTO;

public class CollectionService {
	public String[] arr() {
		return "Java SE,Oracle DBMS,JDBC,HTML,JavaScript,CSS,Jsp".split(",");
	}// arr

	public List<String> list() {
		List<String> list = new ArrayList<String>();

		list.add("옥션");
		list.add("네이버");
		list.add("지마켓");
		list.add("쿠팡");

		return list;
	}// list
	
	public List<DataDTO> searchMember() {
		List<DataDTO> list=new ArrayList<DataDTO>();
		
		list.add(new DataDTO("안세홍", 25));
		list.add(new DataDTO("안세영", 36));
		list.add(new DataDTO("안세진", 38));
		list.add(new DataDTO("안지선", 47));
		
		return list;
	}// searchMember
}// class
