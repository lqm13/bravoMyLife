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
 * Program		: com.github.ecommorce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BoardSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241008112926][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.center.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.backoffice.center.dao.BoardDao;
import kr.co.bravomylife.backoffice.center.dto.BoardDto;

/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.backoffice.center.service.BoardSrvc")
public class BoardSrvc {
	
	@Inject
	BoardDao boardDao;
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean insert(BoardDto boardDto) {
		
		int result = 0;
		
		// 문의일 경우 답변 완료 처리
		if (boardDto.getCd_bbs_type() == 3) {
			result += boardDao.replied(boardDto);
		}
		
		// 신규 글 번호(seq_bbs)
		boardDto.setSeq_bbs(boardDao.sequence());
		
		result += boardDao.insert(boardDto);
		
		// 문의(3)일 경우와 공지/자주찾는질문일 경우
		if (result == ((boardDto.getCd_bbs_type() == 3) ? 2 : 1)) return true;
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
	 * @return boolean
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 삭제(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean deleteFlag(BoardDto boardDto) {
		
		int result = 0;
		
		if (boardDto.getCd_bbs_type() == 3) {
			result += boardDao.deleteQuestionReply(boardDto);
		}
		
		result += boardDao.deleteFlag(boardDto);
		
		if (result == ((boardDto.getCd_bbs_type() == 3) ? 2 : 1)) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
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
	 * <p>DESCRIPTION: 고객센터 보기(문의)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto selectQuestion(BoardDto boardDto) {
		return boardDao.selectQuestion(boardDto);
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
		
		int result = boardDao.readed(boardDto);
		
		// 정상적으로 조회수가 증가되면 표시할 게시물 정보를 리턴
		if (result == 1) {
			return boardDao.select(boardDto);
		}
		// 정상적으로 조회수가 증가 안 되면 NULL을 리턴
		else {
			return null;
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
	

