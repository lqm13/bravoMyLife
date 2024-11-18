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
 * File			: ProductService.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241017153207][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.product.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.backoffice.product.dao.ProductDao;
import kr.co.bravomylife.backoffice.product.dto.ProductDto;

/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-17
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.backoffice.product.service.ProductSrvc")
public class ProductSrvc {
	
	@Inject
	ProductDao productDao;
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean update(ProductDto productDto) {
		
		int result = productDao.update(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 품절(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean out(ProductDto productDto) {
		
		int result = productDao.out(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 재개(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean re(ProductDto productDto) {
		
		int result = productDao.re(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 판매 목록 중지(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean stop(ProductDto productDto) {
		
		int result = productDao.stop(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return SaleDto
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public ProductDto select(ProductDto productDto) {
		return productDao.select(productDto);
	}
	
	/**
	 * @return List<SaleDto>
	 * 
	 * @since 2024-10-23
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = productDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(productDao.list(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txBackoffice")
	public boolean insert(ProductDto productDto) {
		
		productDto.setSeq_sle(productDto.getSeq_sle());
		
		int result = productDao.insert(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}

	}
}