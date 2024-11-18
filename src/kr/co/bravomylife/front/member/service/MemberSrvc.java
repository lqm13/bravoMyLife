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
 * File			: MemberSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001104654][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.member.dao.MemberDao;
import kr.co.bravomylife.front.member.dao.TermAgreeDao;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.dto.MemberListDto;
import kr.co.bravomylife.front.member.dto.TermAgreeDto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.member.service.MemberSrvc")
public class MemberSrvc {
	
	@Inject
	MemberDao memberDao;
	
	@Inject
	TermAgreeDao termAgreeDao;
	
	public MemberDto buyDelivertView(MemberDto memberDto) {
		return memberDao.buyDelivertView(memberDto);
	}
	
	@Transactional("txFront")
	public boolean deliveryDelete(MemberDto memberDto) {
		
		int result = memberDao.deliveryDelete(memberDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean deliveryDelCheck(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.deliveryDelCheck(memberDto);
		
		if(result == 1) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public List<MemberDto> deliveryChanges(MemberDto memberDto) {
		return memberDao.deliveryChanges(memberDto);
	}
	
	@Transactional("txFront")
	public boolean deleteDelivery(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.deleteDelivery(memberDto);
		
		if(result == 1) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean writeProcDelivery(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.writeProcDelivery(memberDto);
		
		if(result == 1) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public MemberDto writeFomrDelivery(MemberDto memberDto) {
		return memberDao.writeFomrDelivery(memberDto);
	}
	
	public BuyMasterDto selectBuyMst(BuyMasterDto buyMasterDto) {
		return memberDao.selectBuyMst(buyMasterDto);
	}
	
	public MemberDto selectIndex(MemberDto memberDto) {
		return memberDao.selectIndex(memberDto);
	}
	
	public MemberDto select(MemberDto memberDto) {
		return memberDao.select(memberDto);
	}
	
	@Transactional("txFront")
	public boolean modifyDeliveryProc(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.modifyDeliveryProc(memberDto);
		
		if(result == 1) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean deliveryDefaultCheck(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.deliveryDefaultCheck(memberDto);
		
		if(result == 1) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean deliveryCheck(MemberDto memberDto) {
		
		int result = 0;
		
		result = memberDao.deliveryCheck(memberDto);
		
		if(result < 3) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public MemberDto currentBasket(MemberDto memberDto) {
		return memberDao.currentBasket(memberDto);
	}
	
	@Transactional("txFront")
	public boolean pointInsert(BuyMasterDto buyMasterDto) {
		
		int result = 0;
		
		result += memberDao.useUpdate(buyMasterDto);
		
		result += memberDao.pointUpdate(buyMasterDto);
		
		if(result == 2) {
			
			return true;
		}
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean updateState(MemberDto memberDto) {
		
		int result = memberDao.updateState(memberDto);
		
		if (result == 1) {
			return true;
		}
		else if (result == 0) {
			memberDao.updateStateM(memberDto);
			return false;
		}
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
	}
	
	public MemberDto selectPasswd(MemberDto memberDto) {
		return memberDao.selectPasswd(memberDto);
	}
	
	@Transactional("txFront")
	public int findPasswd(MemberDto memberDto) {
		
		int result = memberDao.findPasswd(memberDto);
		
		if (result == 1) {
			
			//랜덤 비밀번호 생성
			//String randomPassword = Passwd.generateRandomPassword(16); // 원하는 길이 설정
			
			// 생성된 랜덤 비밀번호는 randomPassword 변수에 저장됨
			//System.out.println("Generated random password: " + randomPassword);
			
			//생성된 랜덤 비밀번호를 DTO에 설정
			//memberDto.setPasswd(randomPassword);
			
			//임시 비밀번호를 데이터베이스에 저장
			//memberDao.tempPasswd(memberDto);
			
			return 1;
		}
		else if (result == 0) {
			return 0;
		}
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		return 0;
	}
			
	public MemberDto findId(MemberDto memberDto) {
		return memberDao.findId(memberDto);
	}
	
	public int selectDuplicate(MemberDto memberDto) {
		return memberDao.selectDuplicate(memberDto);
	}
	
	/*약관*/
	@Transactional("txFront")
	public boolean insert(MemberDto memberDto, String[] arrTermAgreement, String post) {
		
		int result = 0;
		
		// 신규 회원 번호(seq_mbr)
		memberDto.setSeq_mbr(memberDao.sequence());
		memberDto.setRegister(memberDto.getSeq_mbr());
		
		// 회원 정보
		result += memberDao.insertMaster(memberDto);
		result += memberDao.insertDetail(memberDto);
		result += memberDao.insertAddr(memberDto);
		
		// 약관 정보
		TermAgreeDto termAgreeDto = new TermAgreeDto();
			
		for (int loop = 0; loop < 3; loop++) {
			
			termAgreeDto.setSeq_trm_agr(termAgreeDao.sequence());
			termAgreeDto.setSeq_mbr(memberDto.getSeq_mbr());
			termAgreeDto.setSeq_trm(loop + 1);
			termAgreeDto.setFlg_agr(arrTermAgreement[loop]);
			termAgreeDto.setRegister(memberDto.getSeq_mbr());
			
			result += termAgreeDao.insert(termAgreeDto);
		}
		
		// 회원(2개) + 약관(3개)
		if (result == 3 + 3) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean updatePasswd(MemberDto memberDto) {
		
		int result = memberDao.updatePasswd(memberDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean update(MemberDto memberDto) {
				
		if (memberDao.updateMaster(memberDto) == 1 && memberDao.updateDetail(memberDto) == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public MemberListDto deliveryList(MemberDto memberDto) {
		
		MemberListDto memberListDto = new MemberListDto();
		
		memberListDto.setList(memberDao.deliveryList(memberDto));
		
		return memberListDto;
	}
	
		public boolean withdraw(MemberDto memberDto) {
		
		int result = memberDao.withdraw(memberDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
		@Transactional("txFront")
		public boolean updateMyPasswd(MemberDto memberDto) {
			
			int result = memberDao.updateMyPasswd(memberDto);
			
			if (result == 1) return true;
			else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
		}
		
	public MemberDto selectMyPasswd(MemberDto memberDto) {
		return memberDao.selectMyPasswd(memberDto);
	}
}
