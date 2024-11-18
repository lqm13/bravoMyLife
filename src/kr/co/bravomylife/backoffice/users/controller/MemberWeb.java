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
 * File			: MemberWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241023102624][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.users.controller;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.users.controller.MemberWeb;
import kr.co.bravomylife.backoffice.users.service.MemberSrvc;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.backoffice.users.dto.MemberDto;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-23
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.users.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	MemberSrvc memberSrvc;

	@RequestMapping(value = "/console/users/member/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			String searchWord = pagingDto.getSearchWord();
			
			if (searchWord != null && !searchWord.equals("")) {
				
				pagingDto.setSearchWord(aes.encode(searchWord));
			}
			
			PagingListDto pagingListDto = memberSrvc.list(pagingDto);
			
			@SuppressWarnings("unchecked")
			List<MemberDto> list = (List<MemberDto>) pagingListDto.getList();
			
			for (int loop = 0; loop < list.size(); loop++) {
			MemberDto currentMemberDto = list.get(loop);
			String encodedEmail = currentMemberDto.getEmail();
			String decodedEmail = null;
			String encodedMbr_nm = currentMemberDto.getMbr_nm();
			String decodedMbr_nm = null;
		
			// 이메일이 '_'로 시작하는 경우
			if (encodedEmail.startsWith("_")) {
				decodedEmail = encodedEmail; // 기본값 또는 적절한 처리
			} else {
				try {
					decodedEmail = aes.decode(encodedEmail);
				} catch (Exception e) {
					logger.error("이메일 디코딩 오류: " + e.getMessage(), e);
					decodedEmail = "디코딩 실패"; // 기본값 설정
				}
			}
			currentMemberDto.setEmail(decodedEmail);
			
			
			// 성명이 '_'로 시작하는 경우
			if (encodedMbr_nm.startsWith("_")) {
				decodedMbr_nm = encodedMbr_nm; // 기본값 또는 적절한 처리
			} else {
				try {
					decodedMbr_nm = aes.decode(encodedMbr_nm);
				} catch (Exception e) {
					logger.error("회원 이름 디코딩 오류: " + e.getMessage(), e);
					decodedMbr_nm = "디코딩 실패"; // 기본값 설정
				}
			}
			currentMemberDto.setMbr_nm(decodedMbr_nm);
			}

			pagingDto.setSearchWord(searchWord);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/users/member/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/users/member/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav	= new ModelAndView("redirect:/error.web");
		
		try {
			
			MemberDto _memberDto = memberSrvc.select(memberDto);
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			
			
			mav.addObject("memberDto", _memberDto);
			
			mav.setViewName("backoffice/users/member/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/users/member/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			memberDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('적용되었습니다.');");
				request.setAttribute("redirect"	, "/console/users/member/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}
