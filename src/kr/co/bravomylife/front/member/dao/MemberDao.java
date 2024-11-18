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
 * File			: MemberDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001104623][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.member.dto.MemberDto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>tempPasswd
 */
@Repository("kr.co.bravomylife.front.member.dao.MemberDao")
public class MemberDao extends BaseDao {
	
	public int deliveryDelete(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.deliveryDelete", memberDto);
	}
	
	public MemberDto buyDelivertView(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.buyDelivertView", memberDto);
	}
	
	public int deliveryDelCheck(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.deliveryDelCheck", memberDto);
	}
	
	public List<MemberDto> deliveryChanges(MemberDto memberDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.member.Member.deliveryChanges", memberDto);
	}
	
	public int deleteDelivery(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.deleteDelivery", memberDto);
	}
	
	public int writeProcDelivery(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.writeProcDelivery", memberDto);
	}
	
	public MemberDto writeFomrDelivery(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.writeFomrDelivery", memberDto);
	}
	
	public List<MemberDto> deliveryList(MemberDto memberDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.member.Member.deliveryList", memberDto);
	}
	
	public int modifyDeliveryProc(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.modifyDeliveryProc", memberDto);
	}
	
	public int deliveryDefaultCheck(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.deliveryDefaultCheck", memberDto);
	}
	
	public int deliveryCheck(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.deliveryCheck", memberDto);
	}
	
	public MemberDto currentBasket(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.currentBasket", memberDto);
	}
	
	public int pointUpdate(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.pointUpdate", buyMasterDto);
	}
	
	public int useUpdate(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.useUpdate", buyMasterDto);
	}
	
	public MemberDto selectPasswd(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectPasswd", memberDto);
	}
	
	public int tempPasswd(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.tempPasswd", memberDto);
	}
	
	public int updatePasswd(MemberDao memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updatePasswd", memberDto);
	}
	
	public int findPasswd(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.findPasswd", memberDto);
	}
	
	public MemberDto findId(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.findId", memberDto);
	}
	
	public int updateStateM(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updateStateM", memberDto);
	}
	
	public int updateState(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updateState", memberDto);
	}

	public int selectDuplicate(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectDuplicate", memberDto);
	}

	public int sequence() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.sequence");
	}
	
	public int insertMaster(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.insertMaster", memberDto);
	}
	
	public int insertAddr(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.insertAddr", memberDto);
	}
	
	public int insertDetail(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.insertDetail", memberDto);
	}
	
	public int updateMaster(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.updateMaster", memberDto);
	}
	
	public int updateDetail(MemberDto memberDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.member.Member.updateDetail", memberDto);
	}
	
	public BuyMasterDto selectBuyMst(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectBuyMst", buyMasterDto);
	}
	
	public MemberDto selectIndex(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectIndex", memberDto);
	}
	
	public MemberDto select(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.select", memberDto);
	}
	
	public int updatePasswd(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updatePasswd", memberDto);
	}
	
	public int withdraw(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.withdraw", memberDto); 
	}
	
	public int updateMyPasswd(MemberDto memberDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.member.Member.updateMyPasswd", memberDto);
	}
	
	public MemberDto selectMyPasswd(MemberDto memberDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.member.Member.selectMyPasswd", memberDto);
	}
	
}
