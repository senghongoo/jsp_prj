package day1201;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductService {
	public List<ProductDTO> searchPrd() {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		list.add(new ProductDTO("dice_1.png", "이건 1", "다음은 2", 1000, new Date()));
		list.add(new ProductDTO("dice_2.png", "이건 2", "다음은 3", 2000, new Date(System.currentTimeMillis()-(60*60*24*2))));
		list.add(new ProductDTO("dice_3.png", "이건 3", "다음은 1", 3000, new Date()));
		
		return list;
	}// searchPrd
}
