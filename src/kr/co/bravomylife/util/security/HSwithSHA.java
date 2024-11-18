package kr.co.bravomylife.util.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION: SHA(Default: SHA-256) 암호화 유틸리티 클래스</p>
 * <p>IMPORTANT:</p>
 */
public class HSwithSHA {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(HSwithSHA.class);
	
	private static volatile HSwithSHA INSTANCE;
	
	/**
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 인스턴스 얻기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public static HSwithSHA getInstance() {
		if (INSTANCE == null) {
			synchronized (HSwithSHA.class) {
				if (INSTANCE == null) INSTANCE = new HSwithSHA();
			}
		}
		return INSTANCE;
	}
	
	/**
	 * @param string [알고리즘]
	 * @throws NoSuchAlgorithmException [알고리즘 부재]
	 * @return String
	 *
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 해당 메시지(string)를 SHA 알고리즘으로 암호화하여 문자열로 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static String encode(String string) throws NoSuchAlgorithmException {
		return encode(string, "SHA-256");
	}
	
	/**
	 * @param string [평문]
	 * @param algorithm [알고리즘]
	 * @throws NoSuchAlgorithmException [알고리즘 부재]
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 해당 메시지(string)를 SHA(Default: SHA-256) 알고리즘으로 암호화하여 문자열로 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.<br>MD5(비권장 length:32), SHA(비권장 length:40), SHA-1(비권장 length:40), SHA-256(권장 length:64), SHA-384(권장 length:96), SHA-512(권장 length:128)<br>알고리즘을 지정하지 않으면 SHA-256이 사용된다.</p>
	 * <p>EXAMPLE:<br>
	 * <code>HSwithSHA hash = HSwithSHA.getInstance();</code><br>
	 * <code>String encryptedString1 = hash.encode("cydgate4957@gmail.com");</code><br>
	 * <code>String encryptedString2 = hash.encode("cydgate4957@gmail.com", "SHA-1");</code>
	 * </p>
	 */
	public static String encode(String string, String algorithm) throws NoSuchAlgorithmException {
		MessageDigest md;
		String out = "";
		
		if (algorithm == null || algorithm.equals("")) {
			algorithm = "SHA-256";
		}
		
		try {
			md = MessageDigest.getInstance(algorithm);
			
			md.update(string.getBytes());
			byte[] mb = md.digest();
			
			for (int i = 0; i < mb.length; i++) {
				byte temp = mb[i];
				String s = Integer.toHexString(new Byte(temp));
				while (s.length() < 2) {
					s = "0" + s;
				}
				s = s.substring(s.length() - 2);
				out += s;
			}			
			// System.out.println("CRYPTO(" + algorithm + "): " + out + ", length is : " + out.length());
			
			}
			catch (NoSuchAlgorithmException e) {
				logger.error("[kr.co.bravomylife.util.security.HSwithSHA.encode()]" + e.getMessage(), e);
			}
		
		return out.toUpperCase();
	}
	
	/** Example code */
	/*
	public static void main(String[] args) throws NoSuchAlgorithmException {
		HSwithSHA hash = HSwithSHA.getInstance();
		
		System.out.println("SHA-256: "	+ hash.encode("12345678"));
		System.out.println("SHA-1: "	+ hash.encode("cyd", "SHA-1"));
	}
	*/
}
