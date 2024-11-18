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
 * File			: LoginSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004110901][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.login.dao.LoginDao;
import kr.co.bravomylife.front.login.dto.LoginDto;
import kr.co.bravomylife.front.member.dto.MemberDto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.login.service.LoginSrvc")
public class LoginSrvc {
	
	@Inject
	LoginDao loginDao;
	
	@Transactional("txFront")
	public boolean updateLast(MemberDto memberDto) {
		
		int result = loginDao.updateLast(memberDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param loginDto [로그인 빈]
	 * @return MemberDto [회원 빈]
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 회원이 입력한 이메일(아이디)과 암호를 DAO에 전달하여 등록된 회원 정보(MemberDto)를 반환</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public MemberDto exist(LoginDto loginDto) {
		return loginDao.exist(loginDto);
	}
}