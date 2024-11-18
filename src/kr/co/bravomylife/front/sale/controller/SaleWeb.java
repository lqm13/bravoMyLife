/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF bravomylife.CO.KR.
 * bravomylife.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 bravomylife.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 bravomylife.co.kr에 있으며,
 * bravomylife.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * bravomylife.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 bravomylife.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.bravomylife.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: SaleWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930144807][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.sale.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;
import kr.co.bravomylife.front.sale.dto.SaleDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.sale.controller.SaleWeb")
public class SaleWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Inject
	private SaleSrvc saleSrvc;
		
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-16
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/setLike.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> setLike(HttpServletRequest request, @RequestBody SaleDto saleDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
		saleDto.setRegister(saleDto.getSeq_mbr());
		
		String flg_like = saleDto.getFlg_like();
		
		try {
			
			if (saleSrvc.setLike(saleDto)) {
				response.put("flg_like", flg_like);
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".delLike()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-16
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/delLike.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> delLike(HttpServletRequest request, @RequestBody SaleDto saleDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
		
		String flg_like = saleDto.getFlg_like();
		
		try {
			
			if (saleSrvc.delLike(saleDto)) {
				response.put("flg_like", flg_like);
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".delLike()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:기능별 상품 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/function_list.web", method = RequestMethod.POST)
	public ModelAndView functionList(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, PagingDto pagingDto, String type) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if ("bld".equals(type)) {
				pagingDto.setCd_ctg_m("1");
			} else if ("imu".equals(type)) {
				pagingDto.setCd_ctg_m("2");
			} else if ("inf".equals(type)) {
				pagingDto.setCd_ctg_m("3");
			} else if ("jnt".equals(type)) {
				pagingDto.setCd_ctg_m("4");
			} else if ("rec".equals(type)) {
				pagingDto.setCd_ctg_m("5");
			} else if ("eye".equals(type)) {
				pagingDto.setCd_ctg_m("6");
			} else if ("col".equals(type)) {
				pagingDto.setCd_ctg_m("7");
			} else if ("brn".equals(type)) {
				pagingDto.setCd_ctg_m("8");
			} else if ("stm".equals(type)) {
				pagingDto.setCd_ctg_m("9");
			}
			
			pagingDto.setCd_ctg_b("1");
			
			PagingListDto pagingListDto = saleSrvc.functionList(pagingDto);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/sale/function_list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".functionList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:성분별</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/ingredient_list.web", method = RequestMethod.POST)
	public ModelAndView ingredientList(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, PagingDto pagingDto, String type) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if ("pol".equals(type)) {
				pagingDto.setCd_ctg_m("1");
			} else if ("omg".equals(type)) {
				pagingDto.setCd_ctg_m("2");
			} else if ("min".equals(type)) {
				pagingDto.setCd_ctg_m("3");
			} else if ("bac".equals(type)) {
				pagingDto.setCd_ctg_m("4");
			} else if ("msm".equals(type)) {
				pagingDto.setCd_ctg_m("5");
			} else if ("rut".equals(type)) {
				pagingDto.setCd_ctg_m("6");
			} else if ("kou".equals(type)) {
				pagingDto.setCd_ctg_m("7");
			} else if ("arg".equals(type)) {
				pagingDto.setCd_ctg_m("8");
			} else if ("mik".equals(type)) {
				pagingDto.setCd_ctg_m("9");
			}
			
			pagingDto.setCd_ctg_b("2");
			
			PagingListDto pagingListDto = saleSrvc.ingredientList(pagingDto);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/sale/ingredient_list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".ingredientList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:대상별</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/gender_list.web", method = RequestMethod.POST)
	public ModelAndView genderList(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, SaleDto saleDto, String type) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if ("M".equals(type)) {
				pagingDto.setCd_ctg_m("1");
			} else if ("F".equals(type)) {
				pagingDto.setCd_ctg_m("2");
			}
			
			pagingDto.setCd_ctg_b("3");
			
			PagingListDto pagingListDto = saleSrvc.genderList(pagingDto);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/sale/gender_list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".genderList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:대상별</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/total_list.web", method = RequestMethod.POST)
	public ModelAndView totalList(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, String type) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (pagingDto.getCorp_nm() == null || "undefined".equals(pagingDto.getCorp_nm())) {
				pagingDto.setCorp_nm("");
			}
			if (pagingDto.getPrd_type() == null || "undefined".equals(pagingDto.getPrd_type())) {
				pagingDto.setPrd_type("");
			}
			if (pagingDto.getFilter() == null || "undefined".equals(pagingDto.getFilter())) {
				pagingDto.setFilter("");
			}
			if (type == null || "undefined".equals(type)) {
				type = "";
			}
			
			if (pagingDto.getCd_ctg_b().equals("") || pagingDto.getCd_ctg_b() == null) {
				
				pagingDto.setCd_ctg_m("10");
				pagingDto.setCd_ctg_b("9");
			}
			
			PagingListDto pagingListDto = saleSrvc.totalList(pagingDto);
			
			if (pagingDto.getCd_ctg_b().equals("1")) {
				
				if (pagingDto.getCd_ctg_m().equals("10")) {
					
					pagingDto.setCd_ctg_m("0");
				}
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				mav.setViewName("front/sale/function_list");
			}
			else if (pagingDto.getCd_ctg_b().equals("2")) {
				
				if (pagingDto.getCd_ctg_m().equals("10")) {
					
					pagingDto.setCd_ctg_m("0");
				}
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				mav.setViewName("front/sale/ingredient_list");
			}
			else if (pagingDto.getCd_ctg_b().equals("3")) {
				
				if (pagingDto.getCd_ctg_m().equals("10")) {
					
					pagingDto.setCd_ctg_m("0");
				}
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				mav.setViewName("front/sale/gender_list");
			}
			else if (pagingDto.getCd_ctg_b().equals("9")) {
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				mav.setViewName("front/sale/total_list");
			}
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".totalList()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
