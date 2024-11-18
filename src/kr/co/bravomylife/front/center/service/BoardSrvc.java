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
 * File			: BoardSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241007115051][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.center.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.front.center.dao.BoardDao;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.center.dto.BoardDto;



/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-07
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.front.center.service.BoardSrvc")
public class BoardSrvc {
	
	@Inject 
	BoardDao boardDao;

	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 삭제(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txFront")
	public boolean deleteFlag(BoardDto boardDto) {
		
		int result = boardDao.deleteFlag(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txFront")
	public boolean delete(BoardDto boardDto) {
		
		int result = boardDao.delete(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txFront")
	public boolean update(BoardDto boardDto) {
		
		int result = boardDao.update(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기(답변)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto selectReply(BoardDto boardDto) {
		return boardDao.selectReply(boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto select(BoardDto boardDto) {
		return boardDao.select(boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-11-01
	 * <p>DESCRIPTION: 소개</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto introduceSelect(BoardDto boardDto) {
		return boardDao.introduceSelect(boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-11-04
	 * <p>DESCRIPTION: 건강정보</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BoardDto> healthSelect(BoardDto boardDto) {
		return boardDao.healthSelect(boardDto);
	}
	


	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-11-04
	 * <p>DESCRIPTION: 성분사전</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BoardDto> ingredSelect(BoardDto boardDto) {
		return boardDao.ingredSelect(boardDto);
	}
		
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto mySelect(BoardDto boardDto) {
		return boardDao.mySelect(boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-07-10
	 * <p>DESCRIPTION: 고객센터 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txFront")
	public boolean insert(BoardDto boardDto) {
		
		
		// 신규 글 번호(seq_bbs)
		boardDto.setSeq_bbs(boardDao.sequence());
		
		int result = boardDao.insert(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = boardDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(boardDao.list(pagingDto));
		
		return pagingListDto;
	}
}
