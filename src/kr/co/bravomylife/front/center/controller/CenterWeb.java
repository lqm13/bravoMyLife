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
 * File			: CenterWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241028000811][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.center.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-28
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.center.controller.CenterWeb")
public class CenterWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Inject
	private SaleSrvc saleSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-27
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/index.web")
	public ModelAndView mainList(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			PagingListDto pagingListDto = saleSrvc.mainList();
			PagingListDto _pagingListDto = saleSrvc.mainSubList();
			
			mav.addObject("list"	, pagingListDto.getList());
			mav.addObject("subList"	, _pagingListDto.getList());
			mav.setViewName("index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".mainList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}