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
 * File			: StatisticsWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241028094629][whslsl88#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.statistics.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.statistics.dto.MemberAgeDto;
import kr.co.bravomylife.backoffice.statistics.dto.MemberIncomeDto;
import kr.co.bravomylife.backoffice.statistics.service.MemberSrvc;


/**
 * @version 1.0.0
 * @author whslsl88#gmail.com
 * 
 * @since 2024-10-28
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.statistics.controller.StatisticsWeb")
public class StatisticsWeb extends Common{

	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(StatisticsWeb.class);
	
	@Inject
	MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-28
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/statistics/index1.web", method = RequestMethod.POST)
	public ModelAndView index1(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List<MemberAgeDto> listsellingBestName = memberSrvc.sellingBestName();
			List<MemberAgeDto> listsellingBestList = memberSrvc.sellingBestList();
			
			mav.addObject("listsellingBestName", listsellingBestName);
			mav.addObject("listsellingBestList", listsellingBestList);
			
			mav.setViewName("backoffice/statistics/index1");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-28
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/statistics/index.web", method = RequestMethod.POST)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List<MemberAgeDto> listMemberAge = memberSrvc.memberAge();
			
			mav.addObject("listMemberAge", listMemberAge);
			
			mav.setViewName("backoffice/statistics/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-28
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/statistics/index2.web", method = RequestMethod.POST)
	public ModelAndView index2(HttpServletRequest request, HttpServletResponse response, MemberIncomeDto memberIncomeDto) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			List<MemberIncomeDto> listIncomeRegion = memberSrvc.incomeRegion(memberIncomeDto);
			
			mav.addObject("list", listIncomeRegion);
			
			mav.setViewName("backoffice/statistics/index2");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}

}
