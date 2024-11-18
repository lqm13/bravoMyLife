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
 * File			: BuyWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241024162536][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.buy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;

import kr.co.bravomylife.backoffice.buy.dto.BuyDto;
import kr.co.bravomylife.util.security.SKwithAES;
import kr.co.bravomylife.backoffice.buy.service.BuySrvc;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-24
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.buy.controller.BuyWeb")
public class BuyWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	BuySrvc buySrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-02
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/buy/updateDeliveryStatus.json", method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> updateDeliveryStatus(@RequestBody Map<String, List<Integer>> seq_buy_mst) {
		
		Map<String, Object> response = new HashMap<>();
		
		int result = 0;
		
		try {
			
			List<Integer> _seq_buy_mst = seq_buy_mst.get("seq_buy_mst");
			
			for (Integer seqBuyMst : _seq_buy_mst) {
				
				BuyDto buyDto = new BuyDto();
				buyDto.setSeq_buy_mst(seqBuyMst);
				
				result += buySrvc.updateDeliveryStatus(buyDto);
				
				if (result >= 1) {
					
					response.put("message", "배송중으로 변경되었습니다.");
				}
				else {
					
					response.put("message", "배송중으로 변경할 수 있는 상품이 없습니다.");
				}
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".updateDeliveryStatus()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	@RequestMapping(value = "/console/buy/updateDeliveryStatusAll.web", method = RequestMethod.POST)
	public ModelAndView updateDeliveryStatusAll(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (buySrvc.updateDeliveryStatusAll(buyDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/console/buy/list.web");
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

	
	@RequestMapping(value = "/console/buy/view.web", method = RequestMethod.POST)
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			//System.out.println("Received seq_buy_dtl: " + buyDto.getSeq_buy_dtl());
			//System.out.println(buyDto);
			
			// 매개변수로 전달된 buyDto를 이용해 구매 정보 조회
			BuyDto _buyDto = buySrvc.select(buyDto); 
			mav.addObject("buyDto", _buyDto);
			
			List<BuyDto> buyDtoList = buySrvc.selectList(buyDto);
			mav.addObject("buyDtoList", buyDtoList);
			// 구매 상세 내역 리스트 조회 및 추가
			//List<BuyDetailDto> buyDetailList = buySrvc.select(new BuyDetailDto());
			//mav.addObject("buyDetailList", buyDetailList);
			
			mav.setViewName("backoffice/buy/view");  // JSP 파일 설정
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/buy/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			String searchWord = pagingDto.getSearchWord();
			
			if ("mbr_nm".equals(pagingDto.getSearchKey()) || ("email".equals(pagingDto.getSearchKey()))) {
				if (searchWord != null && !searchWord.equals("")) {
					pagingDto.setSearchWord(aes.encode(searchWord));
				} 
			}
			
			PagingListDto pagingListDto = buySrvc.list(pagingDto);
			
			@SuppressWarnings("unchecked")
			List<BuyDto> list = (List<BuyDto>) pagingListDto.getList();
			
			for (int loop = 0; loop < list.size(); loop++) {
				BuyDto currentBuyDto = list.get(loop);
				String encodedEmail = currentBuyDto.getEmail();
				String decodedEmail = null;

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
				currentBuyDto.setEmail(decodedEmail);
				
				// 회원 이름 디코딩 처리
				String encodedMbrNm = currentBuyDto.getMbr_nm();
				String decodedMbrNm = null;
				try {
					decodedMbrNm = aes.decode(encodedMbrNm);
				} catch (Exception e) {
					logger.error("회원 이름 디코딩 오류: " + e.getMessage(), e);
					decodedMbrNm = "디코딩 실패"; // 기본값 설정
				}
				currentBuyDto.setMbr_nm(decodedMbrNm);
			}
			
			pagingDto.setSearchWord(searchWord);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/buy/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/buy/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav	= new ModelAndView("redirect:/error.web");
		
		try {
			
			BuyDto _buyDto = buySrvc.select(buyDto);
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			_buyDto.setEmail(aes.decode(_buyDto.getEmail()));
			_buyDto.setMbr_nm(aes.decode(_buyDto.getMbr_nm()));
			
			
			mav.addObject("buyDto", _buyDto);
			
			mav.setViewName("backoffice/buy/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/buy/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto, @RequestParam("seq_buy_mst") List<Integer> seq_buy_mst) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			buyDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (buyDto.getCd_state().equals("NULL")) {
				
				buyDto.setCd_state(null);
			}
			if (buyDto.getCd_state_delivery().equals("NULL")) {
				
				buyDto.setCd_state_delivery(null);
			}
			
			if (buySrvc.update(buyDto)) {
				request.setAttribute("script"	, "alert('적용되었습니다.');");
				request.setAttribute("redirect"	, "/console/buy/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/console/buy/list.web");
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
