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
 * Program		: kr.co.bravomylife
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BasketWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930144655][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.basket.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.basket.dto.BasketDto;
import kr.co.bravomylife.front.basket.dto.BasketListDto;
import kr.co.bravomylife.front.basket.service.BasketSrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.component.SessionCmpn;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.basket.controller.BasketWeb")
public class BasketWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	@Inject
	BasketSrvc basketSrvc;
	
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
	@RequestMapping(value = "/front/basket/remove.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> remove(HttpServletRequest request, @RequestBody Map<String, List<Map<String, Object>>> requestBody) {
		
		Map<String, Object> response = new HashMap<>();
		List<Integer> deletedSeqSleList = new ArrayList<>();
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			List<Map<String, Object>> items = requestBody.get("items");
			
			for (Map<String, Object> item : items) {
				
				int seqSle = Integer.parseInt((String) item.get("seq_sle"));
				
				basketSrvc.removeBasket(seqMbr, seqSle);
				
				deletedSeqSleList.add(seqSle);
			}
			response.put("deletedItems", deletedSeqSleList);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".basketCount()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/basket/setBasket.web", method = RequestMethod.POST)
	public ModelAndView setBasket(HttpServletRequest request, HttpServletResponse response, BasketListDto basketListDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			for (BasketDto basket : basketListDto.getBasketList()) {
				BasketDto basketDto = new BasketDto();
				
				basketDto.setSeq_mbr(seq_mbr);
				basketDto.setSeq_sle(basket.getSeq_sle());
				basketDto.setSle_nm(basket.getSle_nm());
				basketDto.setPrice(basket.getDiscount_sale());
				basketDto.setCount(basket.getCount());
				basketDto.setImg(basket.getImg());
				basketDto.setPoint_stack(basket.getPoint_stack());
				basketDto.setCd_ctg_m(basket.getCd_ctg_m());
				basketDto.setCd_ctg_b(basket.getCd_ctg_b());
				basketDto.setPrice_sale(basket.getPrice_sale());
				basketDto.setDiscount(basket.getDiscount());
				
				if (!basketSrvc.insert(basketDto)) {
					request.setAttribute("script", "alert('시스템 관리자에게 문의하세요');");
					mav.setViewName("forward:/servlet/result.web");
				}
			}
			request.setAttribute("script", "alert('장바구니에 저장되었습니다');");
			mav.setViewName("forward:/servlet/result.web");
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".setBasket()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/basket/main.web", method = RequestMethod.POST)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto pagingListDto = basketSrvc.listing(pagingDto);
			
			List<BasketDto> basketList = (List<BasketDto>) pagingListDto.getList();
			List<BasketDto> formattedList = new ArrayList<>();
			
			DecimalFormat formatter = new DecimalFormat("#,###");
			
			for (BasketDto item : basketList) {
				
				BasketDto formattedItem = new BasketDto();
				
				formattedItem.setSeq_sle(item.getSeq_sle());
				formattedItem.setSle_nm(item.getSle_nm());
				formattedItem.setPrice(item.getPrice());
				formattedItem.setCount(item.getCount());
				formattedItem.setImg(item.getImg());
				formattedItem.setPoint_value(item.getPoint_value());
				formattedItem.setTotal_point(item.getTotal_point());
				formattedItem.setCd_ctg_m(item.getCd_ctg_m());
				formattedItem.setCd_ctg_b(item.getCd_ctg_b());
				formattedItem.setTotal_price(item.getTotal_price());
				formattedItem.setDt_reg(item.getDt_reg());
				formattedItem.setDiscount(item.getDiscount());
				formattedItem.setPrice_sale(item.getPrice_sale());
				formattedItem.setPoint_stack(item.getPoint_stack());
				
				formattedItem.setFormat_total_price(formatter.format(item.getTotal_price()));
				formattedItem.setFormat_total_point(formatter.format(item.getTotal_point()));
				formattedList.add(formattedItem);
			}
			pagingListDto.setList(formattedList);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/basket/index");
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
	 * @since 2024-10-11
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/basket/basketCount.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody List<Map<String, Object>> basketCount(HttpServletRequest request, @RequestBody BasketDto basketDto) {
		
		List<Map<String, Object>> responseList = new ArrayList<>();
		
		try {
			
			basketDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			basketSrvc.ajaxUpdate(basketDto);
			
			List<BasketDto> basketList = basketSrvc.ajaxlisting(basketDto);
			
			for (BasketDto basket : basketList) {
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("seq_sle", basket.getSeq_sle());
				map.put("sle_nm", basket.getSle_nm());
				map.put("price", basket.getPrice());
				map.put("count", basket.getCount());
				map.put("img", basket.getImg());
				map.put("cd_ctg_m", basket.getCd_ctg_m());
				map.put("cd_ctg_b", basket.getCd_ctg_b());
				map.put("total_price", basket.getTotal_price());
				map.put("total_point", basket.getTotal_point());
				map.put("dt_reg", basket.getDt_reg());
				map.put("seq_sle_count", basket.getSeq_sle_count());
				map.put("total_price_sum", basket.getTotal_price_sum());
				map.put("total_point_sum", basket.getTotal_point_sum());
				
				responseList.add(map);
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".basketCount()] " + e.getMessage(), e);
		}
		finally {}
		
		return responseList;
	}
}
