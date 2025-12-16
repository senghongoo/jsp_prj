package day1204;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;

public class UseSHA {

	public static void main(String[] args) throws Exception {
		String plainText = "1234";

		// 일방향해시 ( 복호화 되지 않는다. )
		try {
			// 1.해시알고리즘을 만들 수 있는 객체 얻기
			MessageDigest md = MessageDigest.getInstance("MD5");
			MessageDigest md2 = MessageDigest.getInstance("SHA-1");
			MessageDigest md3 = MessageDigest.getInstance("SHA-512"); // SHA-2x부터는 안전하다고 평가
			// 2.평문을 배열로 만들어서 일방향 해시 수행 ( 사람이 알아볼 수 없는 문자열로 생성 )
			md.digest(plainText.getBytes());
			md2.digest(plainText.getBytes());
			md3.digest(plainText.getBytes());
			// 3.일방향 해시 알고리즘을 적용받은 byte[] 얻기
			byte[] shaArr = md.digest();
			byte[] shaArr2 = md2.digest();
			byte[] shaArr3 = md3.digest();
			// 4.문자열로 생성 ( 사람이 알아볼 수 없다. )
			// String sha = new String(shaArr);
			// 4.문자열로 생성 ( 사람이 알아볼 수 없다. -> 사람이 알아볼 수 있는 문자열로 )
			String sha = new String(Base64.getEncoder().encode(shaArr));
			String sha2 = new String(Base64.getEncoder().encode(shaArr2));
			String sha3 = new String(Base64.getEncoder().encode(shaArr3));
			System.out.println("plainText : " + plainText);
			System.out.println("MD5 : " + sha);
			System.out.println("SHA-1 : " + sha2);
			System.out.println("SHA-512 : " + sha3);

			String sha4 = DataEncryption.messageDigest("SHA-512", plainText);
			System.out.println("SHA-512 : " + sha4);

			// 16자의 키
			String key = "a123456789012345";
			DataEncryption de = new DataEncryption(key);

			// '안세홍'
			String chipherText = de.encrypt("안세홍");
			System.out.println(chipherText);

			// 복호화
			DataDecryption dd = new DataDecryption(key);
			System.out.println(dd.decrypt(chipherText));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} // end catch
	}// main

}
