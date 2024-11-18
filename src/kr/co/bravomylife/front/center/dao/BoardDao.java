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
 * File			: BoardDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241007114351][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.center.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import kr.co.bravomylife.front.center.dto.BoardDto;
import kr.co.bravomylife.front.common.dao.BaseDao;
import kr.co.bravomylife.front.common.dto.PagingDto;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-07
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */

@Repository("kr.co.bravomylife.front.center.dao.BoardDao")
public class BoardDao extends BaseDao{
	
	
	public BoardDto selectReply(BoardDto boardDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.selectReply", boardDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.count", pagingDto);
	}
	
	public int delete(BoardDto boardDto) {
		return sqlSessionFront.delete("kr.co.bravomylife.front.mybatis.center.Board.delete", boardDto);
	}
	
	public int insert(BoardDto boardDto) {
		return sqlSessionFront.insert("kr.co.bravomylife.front.mybatis.center.Board.insert", boardDto);
	}
	
	public int deleteFlag(BoardDto boardDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.center.Board.deleteFlag", boardDto);
	}
	
	public int update(BoardDto boardDto) {
		return sqlSessionFront.update("kr.co.bravomylife.front.mybatis.center.Board.update", boardDto);
	}
	
	public BoardDto select(BoardDto boardDto) {
		
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.select", boardDto);
	}
	
	public BoardDto introduceSelect(BoardDto boardDto) {
		
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.introduceSelect", boardDto);
	}
	
	public List<BoardDto> healthSelect(BoardDto boardDto) {
		
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.center.Board.healthSelect", boardDto);
	}
	
	public List<BoardDto> ingredSelect(BoardDto boardDto) {
		
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.center.Board.ingredSelect", boardDto);
	}
	
	public BoardDto mySelect(BoardDto boardDto) {
		
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.mySelect", boardDto);
	}
	
	public List<BoardDto> list(PagingDto pagingDto) {
		
		return sqlSessionFront.selectList("kr.co.bravomylife.front.mybatis.center.Board.list", pagingDto);
	}
	
	public int sequence() {
		return sqlSessionFront.selectOne("kr.co.bravomylife.front.mybatis.center.Board.sequence");
	}
}