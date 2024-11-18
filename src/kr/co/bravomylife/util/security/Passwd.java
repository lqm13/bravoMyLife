/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: Passwd.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241008162900][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.util.security;

import java.util.Random;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Passwd {
	
	public static void main(String[] arg) {
		
		System.out.println(generateRandomPassword(12));
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 랜덤 비밀번호 생성</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	public static String generateRandomPassword(int length) {
		
		// 사용할 문자들을 정의합니다.
		String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";
		StringBuilder password = new StringBuilder();
		Random random = new Random();
		
		// 지정된 길이만큼 랜덤으로 문자를 선택합니다.
		for (int i = 0; i < length; i++) {
			int index = random.nextInt(chars.length()); // chars에서 랜덤 인덱스 선택
			password.append(chars.charAt(index)); // 랜덤 문자 추가
		}
		
		return password.toString(); // 최종 비밀번호 반환
	}
}