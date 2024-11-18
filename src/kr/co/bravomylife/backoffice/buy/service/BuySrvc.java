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
 * File			: BuySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241024162622][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.buy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.backoffice.buy.dao.BuyDao;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.backoffice.buy.dto.BuyDto;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-24
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.backoffice.buy.service.BuySrvc")
public class BuySrvc {
	
	@Inject
	BuyDao buyDao;
	
	@Transactional("txBackoffice")
	public int updateDeliveryStatus(BuyDto buyDto) {
		
		int result = buyDao.updateDeliveryStatus(buyDto);
		
		if (result != 1) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return result;
	}
	
	@Transactional("txBackoffice")
	public boolean updateLast(BuyDto buyDto) {
		
		int result = buyDao.updateLast(buyDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txBackoffice")
	public boolean update(BuyDto buyDto) {
		
		int result = buyDao.update(buyDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public List<BuyDto> selectList(BuyDto buyDto) {
		return buyDao.selectList(buyDto);  // DAO의 select 메서드 호출
	}
	
	public BuyDto select(BuyDto buyDto) {
		return buyDao.select(buyDto);  // BuyDto에 대한 select 메서드 호출
	}
	
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = buyDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);

		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.list(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txBackoffice")
	public boolean updateDeliveryStatusAll(BuyDto buyDto) {
		
		int result = buyDao.updateDeliveryStatusAll(buyDto);
		
		if (result >= 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
}