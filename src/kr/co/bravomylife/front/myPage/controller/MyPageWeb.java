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
 * File			: HpSurWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241010143328][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.myPage.controller;

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
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.front.sale.service.SaleSrvc;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-14
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.myPage.controller.MyPageWeb")
public class MyPageWeb extends Common{
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MyPageWeb.class);

	@Inject
	SaleSrvc saleSrvc;
	
	@Inject
	BuySrvc buySrvc;
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-14
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/myPage/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, BuyDetailDto buyDetailDto
			, MemberDto memberDto,BuyMasterDto buyMasterDto ) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			BuyMasterDto _buyMasterDto = memberSrvc.selectBuyMst(buyMasterDto);
			mav.addObject("buyMasterDto", _buyMasterDto);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			MemberDto _memberDto = memberSrvc.selectIndex(memberDto);
			
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			mav.addObject("memberDto", _memberDto);
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			PagingListDto pagingListDto = saleSrvc.listingMyLike(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			buyDetailDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			List<BuyDetailDto> historyList = buySrvc.historyList(buyDetailDto);
			String total_price = buySrvc.selectTotal(buyDetailDto);
			
			mav.addObject("historyList", historyList);
			mav.addObject("total_price", total_price);
			
			mav.setViewName("front/myPage/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".main()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}
