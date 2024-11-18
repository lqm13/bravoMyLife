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
 * File			: BasketDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241009225959][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.basket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.front.basket.dto.BasketDto;
import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.common.dto.PagingDto;


/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-09
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.front.basket.dao.BasketDao")
public class BasketDao extends BaseDao {
	
	public int removeBasket(int seqMbr, int seqSle) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("seq_mbr", seqMbr);
		params.put("seq_sle", seqSle);
		
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.basket.Basket.ajaxRemove", params);
	}
	
	public int ajaxUpdate(BasketDto basketDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.basket.Basket.ajaxUpdate", basketDto);
	}
	
	public List<BasketDto> ajaxlisting(BasketDto basketDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.basket.Basket.ajaxlisting", basketDto);
	}
	
	public int update(BasketDto basketDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.basket.Basket.update", basketDto);
	}
	
	public int insertCheck(BasketDto basketDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.basket.Basket.insertCheck", basketDto);
	}
	
	public int insert(BasketDto basketDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.basket.Basket.insert", basketDto);
	}
	
	public List<BasketDto> listingList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.basket.Basket.listingList", pagingDto);
	}
	public List<BasketDto> listingLike(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.basket.Basket.listingLike", pagingDto);
	}
}
