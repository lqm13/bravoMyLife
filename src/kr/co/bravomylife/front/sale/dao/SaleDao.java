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
 * File			: SaloDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241001112551][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.dto.SaleFileDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.front.sale.dao.SaleDao")
public class SaleDao extends BaseDao {
	
	public SaleDto reviewListCount(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewListCount", saleDto);
	}
	
	public List<SaleDto> mainSubList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.mainSubList", pagingDto);
	}
	
	public int mainSubCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.mainSubCount", pagingDto);
	}
	
	public int schedule_best_y() {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.schedule_best_y");
	}
	
	public int schedule_best_n() {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.schedule_best_n");
	}
	
	public List<SaleDto> mainList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.mainList", pagingDto);
	}
	
	public int mainCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.mainCount", pagingDto);
	}
	
	public int reviewDelete(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.reviewDelete", saleDto);
	}
	
	public int modifyReview(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.modifyReview", saleDto);
	}
	
	public int rateModify(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.rateModify", saleDto);
	}
	
	public int modifyReviewFileIn(SaleFileDto saleFileDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.modifyReviewFileIn", saleFileDto);
	}
	
	public int modifyReviewFile(SaleFileDto saleFileDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.modifyReviewFile", saleFileDto);
	}
	
	public int modifyText(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.modifyText", saleDto);
	}
	
	public int insertReviewModify(SaleFileDto saleFileDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.insertReviewModify", saleFileDto);
	}
	
	public int deleteReviewImg(SaleFileDto saleFileDto) {
		return sqlSessionFront.delete("kr.co.bravomylife.front.mybatis.sale.Sale.deleteReviewImg", saleFileDto);
	}
	
	public int deleteReviewImgIn(SaleFileDto _saleFileDto) {
		return sqlSessionFront.delete("kr.co.bravomylife.front.mybatis.sale.Sale.deleteReviewImgIn", _saleFileDto);
	}
	
	public List<SaleDto> reviewModifyImgs(SaleDto saleDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewModifyImgs", saleDto);
	}
	
	public List<SaleDto> reviewModify(SaleDto saleDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewModify", saleDto);
	}
	
	public List<SaleDto> reviewPageListImgs(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewPageListImgs", pagingDto);
	}
	
	public List<SaleDto> reviewPageList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewPageList", pagingDto);
	}
	
	public int reviewPageCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewPageCount", pagingDto);
	}
	
	public int dtlUpdate(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.dtlUpdate", saleDto);
	}
	
	public SaleDto review(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.review", saleDto);
	}
	
	public int deleteLike(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.deleteLike", saleDto);
	}
	
	public List<SaleDto> reviewListPage(SaleDto saleDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewListPage", saleDto);
	}
	
	public int reviewCheck(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewCheck", saleDto);
	}
	
	public int rateUpdate(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.rateUpdate", saleDto);
	}
	
	public int rateCheck(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.rateCheck", saleDto);
	}
	
	public int rateInsert(SaleDto saleDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.rateInsert", saleDto);
	}
	
	public int insertText(SaleDto saleDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.insertText", saleDto);
	}
	
	public int insertReview(SaleDto saleDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.insertReview", saleDto);
	}
	
	public int insertReviewFile(SaleFileDto saleFileDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.insertReviewFile", saleFileDto);
	}
	
	public int rateSequence() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.rateSequence");
	}
	
	public int sequence() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.sequence");
	}
	
	public int setLikeUpdate(SaleDto saleDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeUpdate", saleDto);
	}
	
	public int setLikeCheck(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeCheck", saleDto);
	}
	
	public int setLikeInsert(SaleDto saleDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.sale.Sale.setLikeInsert", saleDto);
	}
	
	public int delLike(SaleDto saleDto) {		
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.sale.Sale.delLike", saleDto);
	}
	
	public List<SaleDto> reviewListImgs(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewListImgs", pagingDto);
	}
	
	public List<SaleDto> reviewList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.reviewList", pagingDto);
	}
	
	public SaleDto reviewCounts(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewCounts", saleDto);
	}
	
	public int reviewCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.reviewCount", pagingDto);
	}
	
	public List<SaleDto> detailList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.detailList", pagingDto);
	}
	
	public int detailCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.detailCount", pagingDto);
	}
	
	public SaleDto select(SaleDto saleDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.select", saleDto);
	}
	
	public List<SaleDto> functionList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.functionList", pagingDto);
	}
	
	public int functionCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.functionCount", pagingDto);
	}
	
	public List<SaleDto> ingredientList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.ingredientList", pagingDto);
	}
	
	public int ingredientCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.ingredientCount", pagingDto);
	}
	
	public List<SaleDto> genderList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.genderList", pagingDto);
	}
	
	public int genderCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.genderCount", pagingDto);
	}
	
	public List<SaleDto> totalList(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.totalList", pagingDto);
	}
	
	public int totalCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.totalCount", pagingDto);
	}
	
	public int myLikeCount(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.sale.Sale.myLikeCount", pagingDto);
	}
	public List<SaleDto> listingLike(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.listingLike", pagingDto);
	}
	
	public List<SaleDto> listingMyLike(PagingDto pagingDto) {
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.sale.Sale.listingMyLike", pagingDto);
	}
	
}