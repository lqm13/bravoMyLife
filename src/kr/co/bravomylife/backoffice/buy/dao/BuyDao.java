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
 * File			: BuyDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241024162549][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.buy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.backoffice.common.dao.BaseDao;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;

import kr.co.bravomylife.backoffice.buy.dto.BuyDto;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-24
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.backoffice.buy.dao.BuyDao")
public class BuyDao extends BaseDao {
	
	public int updateDeliveryStatus(BuyDto buyDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.buy.Buy.updateDeliveryStatus", buyDto);
	}
	
	public int updateLast(BuyDto buyDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.buy.Buy.updateLast", buyDto);
	}
	
	public int update(BuyDto buyDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.buy.Buy.update", buyDto); 
	}
	
	public int updateDeliveryStatusAll(BuyDto buyDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.buy.Buy.updateDeliveryStatusAll", buyDto); 
	}
	
	public List<BuyDto> selectList(BuyDto buyDto) {
		return sqlSessionBackoffice.selectList("kr.co.bravomylife.backoffice.mybatis.buy.Buy.selectList", buyDto);
	}

	
	public BuyDto select(BuyDto buyDto) {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.buy.Buy.select", buyDto);
	}

	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.buy.Buy.count", pagingDto);
	}
	
	public List<BuyDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("kr.co.bravomylife.backoffice.mybatis.buy.Buy.list", pagingDto);
	}

	

}
