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
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.member.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.component.EmailCmpn;
import kr.co.bravomylife.common.dto.EmailDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.dto.MemberListDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;
import kr.co.bravomylife.util.security.HSwithSHA;
import kr.co.bravomylife.util.security.Passwd;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	private EmailCmpn emailCmpn;
	
	@Inject
	private MemberSrvc memberSrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
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
	 
	@RequestMapping(value = "/front/member/deliveryDelCheck.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> deliveryDelCheck(HttpServletRequest request, @RequestBody MemberDto memberDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		boolean check = true;
		
		try {
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			check = memberSrvc.deliveryDelCheck(memberDto);
			
			response.put("check", check);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".deliveryDelCheck()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-011-11
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */	
	@RequestMapping(value = "/front/member/deliveryDelete.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> deliveryDelete(HttpServletRequest request, @RequestBody MemberDto memberDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
		
		try {
			
			memberDto.setSeq_mbr(seqMbr);
			memberDto.setUpdater(seqMbr);
			
			if (memberSrvc.deliveryDelete(memberDto)) {
				
				response.put("status", "success");
			}
			else {
				
				response.put("status", "fail");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".deliveryDelete()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-28
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/writeProcDelivery.web", method = RequestMethod.POST)
	public ModelAndView writeProcDelivery(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, String deliveryDefault) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			if ("true".equals(deliveryDefault)) {
				
				memberDto.setFlg_default("Y");
			}
			else {
				
				memberDto.setFlg_default("N");
			}
			
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			memberSrvc.writeProcDelivery(memberDto);
			
			request.setAttribute("script"	, "alert('배송지가 수정되었습니다.');");
			request.setAttribute("redirect"	, "/front/member/modifyDelivery.web");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProcDelivery()] " + e.getMessage(), e);
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
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/writeFormDelivery.web", method = RequestMethod.POST)
	public ModelAndView writeFormDelivery(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			MemberDto _memberDto = memberSrvc.writeFomrDelivery(memberDto);
			
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			_memberDto.setDt_reg(_memberDto.getDt_reg());
			_memberDto.setFlg_default(_memberDto.getFlg_default());
			
			mav.addObject("memberDto", _memberDto);
			mav.setViewName("front/member/writeFormDelivery");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeFormDelivery()] " + e.getMessage(), e);
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
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/modifyDeliveryProc.web", method = RequestMethod.POST)
	public ModelAndView modifyDeliveryProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			memberSrvc.modifyDeliveryProc(memberDto);
			
			request.setAttribute("script"	, "alert('배송지가 추가되었습니다.');");
			request.setAttribute("redirect"	, "/front/member/modifyDelivery.web");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyDeliveryProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-11
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/member/deliveryDefaultCheck.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> deliveryDefaultCheck(HttpServletRequest request) {
		
		Map<String, Object> response = new HashMap<>();
		MemberDto memberDto = new MemberDto();
		
		boolean check = true;
		
		try {
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			check = memberSrvc.deliveryDefaultCheck(memberDto);
			
			response.put("check", check);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".deliveryDefaultCheck()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
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
	 
	@RequestMapping(value = "/front/member/deliveryCheck.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> deliveryCheck(HttpServletRequest request) {
		
		Map<String, Object> response = new HashMap<>();
		MemberDto memberDto = new MemberDto();
		
		boolean check = true;
		
		try {
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			check = memberSrvc.deliveryCheck(memberDto);
			
			response.put("check", check);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".deliveryCheck()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-28
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/member/modifyDelivery.web")
	public ModelAndView modifyDelivery(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			MemberListDto memberListDto = memberSrvc.deliveryList(memberDto);
			
			List<MemberDto> _memberListDto = (List<MemberDto>)memberListDto.getList();
			List<MemberDto> MemberList = new ArrayList<>();
			
			for (MemberDto member : _memberListDto) {
				
				 MemberDto _MemberDto = new MemberDto();
				
				_MemberDto.setSeq_mbr_addr(member.getSeq_mbr_addr());
				_MemberDto.setPost(aes.decode(member.getPost()));
				_MemberDto.setAddr1(aes.decode(member.getAddr1()));
				_MemberDto.setAddr2(aes.decode(member.getAddr2()));
				_MemberDto.setDt_reg(member.getDt_reg());
				_MemberDto.setFlg_default(member.getFlg_default());
				
				MemberList.add(_MemberDto);
			}
			
			memberListDto.setList(MemberList);
			
			mav.addObject("list", memberListDto.getList());
			mav.setViewName("front/member/modifyDelivery");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyDelivery()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
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
	 
	@RequestMapping(value = "/front/member/currentBasket.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> currentBasket(HttpServletRequest request) {
		
		Map<String, Object> response = new HashMap<>();
		MemberDto memberDto = new MemberDto();
		
		String check = "[UNDEFINED]";
		
		try {
			
			if (!check.equals(getSession(request, "SEQ_MBR"))) {
				
				memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				MemberDto _memberDto = memberSrvc.currentBasket(memberDto);
				
				response.put("memberDto", _memberDto);
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".currentBasket()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-18
	 * <p>DESCRIPTION:찜 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/myLike.web")
	public ModelAndView myLike(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto pagingListDto = saleSrvc.listingLike(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/member/myLike");
			
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
	 * <p>DESCRIPTION:찜 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/likeRemove.web", method = RequestMethod.POST)
	public ModelAndView likeRemove(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (saleSrvc.deleteLike(saleDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/front/member/myLike.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".remove()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-14
	 * <p>DESCRIPTION:마이 페이지 회원 탈퇴 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/withdraw.web", method = RequestMethod.POST)
	public ModelAndView withdraw(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/withdraw");
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
	 * @since 2024-10-14
	 * <p>DESCRIPTION:마이 페이지 회원 탈퇴 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/withdrawProc.web", method = RequestMethod.POST)
	public ModelAndView withdrawProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			HttpSession session = request.getSession(false);
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			memberDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (memberSrvc.withdraw(memberDto)) {
				request.setAttribute("script"	, "alert('탈퇴되었습니다.');");
				session.invalidate();
				request.setAttribute("redirect"	, "/");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
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
	 * @since 2024-10-14
	 * <p>DESCRIPTION:마이 페이지 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
					
			// 대칭키 암호화(AES-256)
						String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
						SKwithAES aes		= new SKwithAES(staticKey);
						
						memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
						
						MemberDto _memberDto = memberSrvc.select(memberDto);
						
						_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
						_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
						_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
						_memberDto.setPost(aes.decode(_memberDto.getPost()));
						_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
						_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
						
						mav.addObject("memberDto", _memberDto);
						
			mav.setViewName("front/member/modifyForm");
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-14
	 * <p>DESCRIPTION: 마이페이지 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, String _hobbys, String _flg_sms, String _flg_email) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			memberDto.setSeq_mbr(seq_mbr);
			memberDto.setUpdater(seq_mbr);
			
			// SMS 또는 Email 수신 동의 정보가 없을 경우 기본값(N)로 설정
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			// 입력한 정보와 기존 정보가 같으면 업데이트를 안 하고 다르면 입력한 정보로 업데이트(시간 포함)
			if (memberDto.getFlg_email().equals(_flg_email)) memberDto.setFlg_email("");
			if (memberDto.getFlg_sms().equals(_flg_sms)) memberDto.setFlg_sms("");
			
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/myPage/");
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
	
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 임시 비밀번호 확인 및 처리 </p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findPasswdResultProc.web", method = RequestMethod.POST)
	public ModelAndView findPasswdResultProc(HttpServletRequest request, HttpServletResponse response
			, MemberDto memberDto
			, String passwd_temp
			, String passwd_input
			, String newPasswd) {
		
		// passwd_temp에는 암호화된 임시 비밀번호가 URL인코더로 인코더된 상태
		// 이메일은 ULR 인코더로만 인코더를 한다
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			// - 새 비밀번호(newPasswd)와 새 비밀번호(newPasswd_) 확인이 같은지는 폼에서 처리
			// - 폼에서 암호화된 이메일(memberDto.getEmail())과 임시 비밀번호(randomPassword)를 제공하여야 함
			String randomPassword = aes.decode(passwd_temp);
						
			// 1. 회원이 입력한 임시 비밀번호(passwd_input)와 복호화한 임시 비밀번호가 같으면
			// 2. 회원의 비밀번호를 새 비밀번호로 업데이트(복호화한 회원의 이메일 기준)
			
			if (passwd_input.equals(randomPassword)) {
					
				// 신규 비밀번호 암호화	
				memberDto.setPasswd(HSwithSHA.encode(newPasswd));
				
				memberDto.setEmail(memberDto.getEmail());
				if (memberSrvc.updatePasswd(memberDto)){
					request.setAttribute("script"	, "alert('신규 비밀번호가 재설정 되었습니다.');");
					request.setAttribute("redirect"	, "/front/login/loginForm.web");
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('현재 비밀번호가 틀립니다!');");
				request.setAttribute("redirect"	, "/front/member/findPasswdResult.web?email="
								+ memberDto.getEmail()
								+ "&passwd_temp=" + passwd_temp);
			}
			mav.setViewName("forward:/servlet/result.web");
		
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdResultProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:임시 비밀번호 확인 및 처리 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findPasswdResult.web")
	public ModelAndView findPasswdResult(HttpServletRequest request, HttpServletResponse response
			, String email
			, String passwd_temp) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.addObject("email", email);
			mav.addObject("passwd_temp", passwd_temp);
			
			mav.setViewName("front/member/findPasswdResult");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdResult()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-07
	 * <p>DESCRIPTION:비밀번호 찾기 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/findPasswProc.web", method = RequestMethod.POST)
	public ModelAndView findPasswProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
			
			// [2024-10-10][whslsl88#gmail.com][TODO-개선: 핸드폰 인증 처리]
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			//memberDto.setPhone(aes.encode(memberDto.getPhone()));
			
			int check = memberSrvc.findPasswd(memberDto);
			
			if (check == 1) {
				
				// 인증 이메일 발송
				
				String randomPassword = Passwd.generateRandomPassword(12);
				
				//System.out.println("Generated Random Password: " + randomPassword);
				
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("비밀번호 인증");
				emailDto.setMessage("<b>회원 정보가 확인되었습니다.</b> <br>아래 주소에서 비밀번호를 재설정해 주십시오.<br>"
							+ "아래 링크를 클릭하셔야 비밀번호 재설정 페이지로 이동합니다.<br><br>"
							+ "<a href=\"http://127.0.0.1:8080/front/member/findPasswdResult.web?email="
							+ URLEncoder.encode(memberDto.getEmail())
							+ "&passwd_temp=" + URLEncoder.encode(aes.encode(randomPassword))
							+ "\">링크를 클릭하세요</a><br>"
							+ "다음의 임시 비밀번호를 입력하시어 비밀번호를 재설정해주십시오.<br><br>"
							+ "<b>[임시 비밀번호: "
							+ randomPassword
							+ "]</b>");
				
				emailCmpn.send(emailDto);
				
				request.setAttribute("script"	, "alert('회원 정보가 확인되었습니다!');");
				request.setAttribute("redirect"	, "/front/member/findPasswdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
				
			}
			else {
				request.setAttribute("script"	, "alert('일치하는 정보가 없습니다!');");
				request.setAttribute("redirect"	, "/front/member/findPasswdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
			}
			
		}catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:비밀번호 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findPasswdForm.web")
	public ModelAndView findPasswdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:아이디 찾기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findIdForm.web")
	public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findIdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-06
	 * <p>DESCRIPTION:아이디 찾기 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/findIdResult.web", method = RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			
			MemberDto memberDto_ = memberSrvc.findId(memberDto);
			
			if (memberDto_ != null && memberDto_.getEmail() != null) {
				// 이메일 복호화 후 DTO에 설정
				memberDto.setEmail(aes.decode(memberDto_.getEmail()));
			
				// 아이디 찾기에 성공했을 때
				mav.addObject("findId", memberDto);
				mav.setViewName("front/member/findIdResult");
			}
			else {
				request.setAttribute("script"	, "alert('일치하는 이메일이 없습니다!');");
				request.setAttribute("redirect"	, "/front/member/findIdForm.web");
				
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findIdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-19
	 * <p>DESCRIPTION: 이메일 인증</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/confirmEmail.web")
	public ModelAndView confirmEmail(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			@SuppressWarnings("unused")
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(URLDecoder.decode(memberDto.getEmail()));
			
			if (memberSrvc.updateState(memberDto)) {
				request.setAttribute("script"	, "alert('이메일 인증이 완료되어 정상적으로 서비스를 이용할 있습니다.');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web");
			}
			else {
				// [2024-10-01][TODO: 10분 이내에 인증되지 않은 이메일이므로 '#' + SEQ_MBR + '_' + EMAIL 패턴으로 업데이트]
				request.setAttribute("script"	, "alert('회원 가입 재시도 또는 고객센터에 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".confirmEmail()] " + e.getMessage(), e);
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
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT: 이메일 인증은 가입(registerProc) 시로 변경함</p>
	 * <p>EXAMPLE:</p>
	 **/
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/checkEmail.json", headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkEmail(@RequestBody MemberDto memberDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
		
			// 인증 이메일 발송
			EmailDto emailDto = new EmailDto();
			
			emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
			emailDto.setTo(new String[] {memberDto.getEmail()});
			emailDto.setSubject("이메일 인증");
			emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
						+ "하기 인증하기를 클릭하셔야 가입이 완료됩니다.</br></br>"
						+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(aes.encode(memberDto.getEmail())));
			
			//emailCmpn.send(emailDto);
			// 이메일 전송 시도 및 예외 처리
			try {
				emailCmpn.send(emailDto);
				logger.info("Email sent successfully to: " + memberDto.getEmail());
			} catch (MailAuthenticationException e) {
				logger.error("SMTP Authentication failed: " + e.getMessage(), e);
				throw e;  // 예외를 다시 던져 처리할 수 있도록 함
			} catch (Exception e) {
				logger.error("Failed to send email to: " + memberDto.getEmail(), e);
				throw e;
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkEmail()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/member/checkDuplicate.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean isDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			
			int count = memberSrvc.selectDuplicate(memberDto);
			
			if (count == 0) isDuplicate = false;
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return isDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:회원가입 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/registerForm.web", method = RequestMethod.POST)
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
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
	 * <p>DESCRIPTION:회원가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/front/member/registerProc.web" , method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response
			, MemberDto memberDto
			, String term_1
			, String term_2
			, String term_3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (term_1 == null || term_1.equals("")) term_1 = "N";
			if (term_2 == null || term_2.equals("")) term_2 = "N";
			if (term_3 == null || term_3.equals("")) term_3 = "N";
			
			// [2024-10-01][TODO: 약관 갯수(JSP)에 무관하게 처리될 수 있도록 개선]
			String[] arrTermAgreement = {term_1, term_2, term_3};
			
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			
			if (insert) {
				
				// 인증 이메일 발송
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하 및 이메일 인증");
				emailDto.setMessage("<b>가입</b>을 축하합니다.</br>"
							+ "하기 인증하기를 10분 이내에 클릭하셔야 가입이 완료됩니다.</br></br>"
							+ "http://127.0.0.1:8080/front/member/confirmEmail.web?email=" + URLEncoder.encode(memberDto.getEmail()));
				
				emailCmpn.send(emailDto);
				
				// 가입 축하 이메일 발송
				/*
				EmailDto emailDto = new EmailDto();
				
				emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				emailDto.setTo(new String[] {aes.decode(memberDto.getEmail())});
				emailDto.setSubject("가입 축하");
				emailDto.setMessage("<b>가입</b>을 축하합니다.");
				
				emailCmpn.send(emailDto);
				*/
			}
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch  (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}