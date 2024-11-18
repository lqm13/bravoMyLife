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
 *				: [20241003231434][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.buy.dao.BuyDao")
public class BuyDao extends BaseDao {
	
	public List<BuyDetailDto> pointListDtl(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.pointListDtl", pagingDto);
	}
	
	public List<BuyMasterDto> pointListMst(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.pointListMst", pagingDto);
	}
	
	public int buyPointCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.buyPointCount", pagingDto);
	}
	
	public BuyMasterDto pointUseHistoryMain(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.pointUseHistoryMain", buyMasterDto);
	}
	
	public int historyDelete(BuyDto buyDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.Buy.historyDelete", buyDto);
	}
	
	public List<BuyDto> cancelDtl(BuyDto buyDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.cancelDtl", buyDto);
	}
	
	public List<BuyDto> cancelMst(BuyDto buyDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.cancelMst", buyDto);
	}
	
	public List<BuyDto> deliveryListDtl(BuyDto buyDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.deliveryListDtl", buyDto);
	}
	
	public List<BuyDto> deliveryListMst(BuyDto buyDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.deliveryListMst", buyDto);
	}
	
	public List<BuyDetailDto> buyListDtl(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.buyListDtl", pagingDto);
	}
	
	public List<BuyMasterDto> buyListMst(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.buyListMst", pagingDto);
	}
	
	public int buyCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.buyCount", pagingDto);
	}
	
	public int updateCancle(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.Buy.updateCancle", buyDetailDto);
	}
	
	public BuyDetailDto cancel(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.cancel", buyDetailDto);
	}
	
	public int updateDetail(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.BuyDetail.updateDetail", buyMasterDto);
	}
	
	public int insertBestMst(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyDetail.insertBestMst", buyDetailDto);
	}
	
	public int updateBestMst(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.BuyDetail.updateBestMst", buyDetailDto);
	}
	
	public int insertBestCheck(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyDetail.insertBestCheck", buyDetailDto);
	}
	
	public int sequenceBest() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyDetail.sequenceBest");
	}
	
	public int insertBest(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyDetail.insertBest", buyDetailDto);
	}
	
	public List<SaleDto> pointHistory(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.pointHistory", pagingDto);
	}
	
	public int pointCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.pointCount", pagingDto);
	}
	
	public int checkBasket(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.basket.Basket.checkBasket", buyDetailDto);
	}
	
	public int updateBasket(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.basket.Basket.updateBasket", buyDetailDto);
	}
	
	public int updateCountStock(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.updateCountStock", buyDetailDto);
	}
	
	public int update(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.buy.BuyMaster.update", buyMasterDto);
	}
	
	public int sequenceMaster() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyMaster.sequence");
	}
	
	public int insertMaster(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyMaster.insert", buyMasterDto);
	}
	
	public int sequenceDetail() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.BuyDetail.sequence");
	}
	
	public int insertDetail(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.buy.BuyDetail.insert", buyDetailDto);
	}
	
	public String selectTotal(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.buy.Buy.selectTotal", buyDetailDto);
	}
	
	public List<BuyDetailDto> historyList(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.buy.Buy.historyList", buyDetailDto);
	}
}
