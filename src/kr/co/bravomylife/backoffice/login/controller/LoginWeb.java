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
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.login.controller;


import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.login.dto.LoginDto;
import kr.co.bravomylife.backoffice.login.dto.StatisticsBestDto;
import kr.co.bravomylife.backoffice.login.dto.StatisticsDto;
import kr.co.bravomylife.backoffice.login.service.LoginSrvc;
import kr.co.bravomylife.backoffice.login.service.StatisticsSrvc;
import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.util.Datetime;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.login.controller.LoginWeb")
public class LoginWeb extends Common{
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	LoginSrvc loginSrvc;
	
	@Inject
	StatisticsSrvc statisticsSrvc;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(LoginWeb.class);
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-22
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/login/logout.web", method = RequestMethod.POST)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			HttpSession session = request.getSession(false);
			
			String name		= (String) session.getAttribute("NAME");
			String dt_login	= (String) session.getAttribute("DT_LOGIN");
			session.invalidate();
			
			request.setAttribute("script"	, "alert('" + dt_login + "에 로그인한 " + name + "님 안녕히 가세요.')");
			request.setAttribute("redirect"	, "/console/index.web");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".logout()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-22
	 * <p>DESCRIPTION:로그인한 메인 페이지로 가게/p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/console/login/main.web")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, StatisticsDto statisticsDto, StatisticsBestDto statisticsBestDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			List<StatisticsDto> listIncomeRegion = statisticsSrvc.incomeRegion(statisticsDto);
			List<StatisticsBestDto> listsellingBestName = statisticsSrvc.sellingBestName(statisticsBestDto);
			List<StatisticsBestDto> listsellingBestList = statisticsSrvc.sellingBestList(statisticsBestDto);
			List<StatisticsBestDto> listMemberAge = statisticsSrvc.memberAge(statisticsBestDto);
			
			mav.addObject("list", listIncomeRegion);
			mav.addObject("listsellingBestName", listsellingBestName);
			mav.addObject("listsellingBestList", listsellingBestList);
			mav.addObject("listMemberAge", listMemberAge);
			
			mav.setViewName("backoffice/login/main");
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
	 * @param loginDto [로그인 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-22
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/login/loginProc.web", method = RequestMethod.POST)
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response, LoginDto loginDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			ManagerDto managerDto = loginSrvc.exist(loginDto);
			
			if (managerDto != null
					&& loginDto.getPasswd().equals(managerDto.getPasswd())) {
				
				/** 정상적인 회원일 경우 세션에 이름과 아이디를 저장 */
				HttpSession session = request.getSession(true);
				session.setAttribute("SEQ_MNG", Integer.toString(managerDto.getSeq_mng()));
				session.setAttribute("NAME", managerDto.getMng_nm());
				session.setAttribute("EMAIL", managerDto.getEmail());
				session.setAttribute("DT_LOGIN", Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
				
				request.setAttribute("script", "alert('" + session.getAttribute("NAME")
												+ "님 "
												+ session.getAttribute("DT_LOGIN")
												+ "반갑습니다."
												+ "')");
				request.setAttribute("redirect"	, "/console/login/main.web");
			}
			else {
				request.setAttribute("script", "alert('이메일(아이디)과 비밀번호를 확인하세요!')");
				request.setAttribute("redirect"	, "/console/index.web");
			}			
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".loginProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}

}
