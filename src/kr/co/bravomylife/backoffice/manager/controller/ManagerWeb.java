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
 * File			: managerWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241018155103][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.manager.controller;


import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.backoffice.manager.service.ManagerSrvc;


/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-18
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.manager.controller.ManagerWeb")
public class ManagerWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ManagerWeb.class);
	
	@Autowired
	Properties staticProperties;

	@Inject
	private ManagerSrvc managerSrvc;
	

	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-30
	 * <p>DESCRIPTION: 마이페이지 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/console/manager/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			managerDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			managerDto.setSeq_mng(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (managerSrvc.update(managerDto)) {
				
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/console/myPage/index.web");
			}
			else {
				
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyProc()] " + e.getMessage(), e);
			e.printStackTrace();
		}
		finally {}
		
		return mav;
	}
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-30
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/console/manager/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

				managerDto.setSeq_mng(Integer.parseInt(getSession(request, "SEQ_MNG")));
							
				ManagerDto _managerDto = managerSrvc.select(managerDto);
				/*	
				_managerDto.setEmail(_managerDto.getEmail());
				_managerDto.setMng_nm(_managerDto.getMng_nm());
				_managerDto.setPhone(_managerDto.getPhone());
				_managerDto.setPost(_managerDto.getPost());
				_managerDto.setAddr1(_managerDto.getAddr1());
				_managerDto.setAddr2(_managerDto.getAddr2());
				*/			
				mav.addObject("managerDto", _managerDto);
							
				mav.setViewName("backoffice/manager/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".main()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-21
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/console/manager/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody ManagerDto managerDto) {
		
		boolean isDuplicate = true;
		
		try {

			int count = managerSrvc.selectDuplicate(managerDto);
			
			if (count == 0) isDuplicate = false;
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	@RequestMapping(value = "/console/manager/registerForm.web", method = RequestMethod.POST)
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/manager/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/manager/registerProc.web", method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			boolean result = managerSrvc.insert(managerDto);
			
			if (result) {
				mav.addObject("message", "가입 성공");
			} else {
				mav.addObject("message", "가입 실패");
			}
			
			request.setAttribute("redirect"	, "/console/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}
