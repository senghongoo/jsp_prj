package day1124;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class UseURLEncoder {

	public static void main(String[] args) throws UnsupportedEncodingException {
		String name = "안세홍";
		System.out.println(name);

		// 문자열을 Web parameter 형식으로 변환
		String enName = URLEncoder.encode(name, "UTF-8");
		System.out.println(enName);
		// %EC%95%88%EC%84%B8%ED%99%8D

		String deName = URLDecoder.decode(enName, "UTF-8");
		System.out.println(deName);
		// 안세홍

		// String class 사용
		String str = new String(URLDecoder.decode(enName, "8859_1").getBytes("8859_1"), "UTF-8");
		System.out.println(str);
	}// main

}// class
