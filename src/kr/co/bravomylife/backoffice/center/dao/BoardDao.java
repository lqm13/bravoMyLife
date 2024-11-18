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
 * File			: BoardDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241008112535][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.center.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.bravomylife.backoffice.center.dto.BoardDto;
import kr.co.bravomylife.backoffice.common.dao.BaseDao;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;

/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.bravomylife.backoffice.center.dao.BoardDao")
public class BoardDao extends BaseDao {
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 답변 완료</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int replied(BoardDto boardDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.center.Board.replied", boardDto);
	}
	
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 답변 완료</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int deleteQuestionReply(BoardDto boardDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.center.Board.deleteQuestionReply", boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int insert(BoardDto boardDto) {
		return sqlSessionBackoffice.insert("kr.co.bravomylife.backoffice.mybatis.center.Board.insert", boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 삭제(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int deleteFlag(BoardDto boardDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.center.Board.deleteFlag", boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기(질문) </p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto selectQuestion(BoardDto boardDto) {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.center.Board.selectQuestion", boardDto);
	}
	
	/**
	 * @param boardDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int update(BoardDto boardDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.center.Board.update", boardDto);
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
	public int sequence() {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.center.Board.sequence");
	}
	
	public List<BoardDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("kr.co.bravomylife.backoffice.mybatis.center.Board.list", pagingDto);
	}	

	public int readed(BoardDto boardDto) {
		return sqlSessionBackoffice.update("kr.co.bravomylife.backoffice.mybatis.center.Board.readed", boardDto);
	}

	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.center.Board.count", pagingDto);
	}

	public BoardDto select(BoardDto boardDto) {
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.center.Board.select", boardDto);
	}
	/**
	 * @param boardDto [게시판 빈]
	 * @return BoardDto
	 * 
	 * @since 2024-09-09
	 * <p>DESCRIPTION: 고객센터 보기(답변) </p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public BoardDto selectReply(BoardDto boardDto) {
		
		return sqlSessionBackoffice.selectOne("kr.co.bravomylife.backoffice.mybatis.center.Board.selectReply", boardDto);
	}
	
}
