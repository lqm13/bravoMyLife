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
 *				: [20241003231427][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.buy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;
import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDetailListDto;
import kr.co.bravomylife.front.buy.dto.BuyDto;
import kr.co.bravomylife.front.buy.dto.BuyListDto;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.front.sale.dto.ImageData;
import kr.co.bravomylife.front.sale.dto.SaleDto;
import kr.co.bravomylife.front.sale.dto.SaleFileDto;
import kr.co.bravomylife.front.sale.dto.SaleListDto;
import kr.co.bravomylife.front.sale.service.SaleSrvc;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.buy.controller.BuyWeb")
public class BuyWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	@Inject
	MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/historyDelete.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> historyDelete(HttpServletRequest request, @RequestBody BuyDto buyDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
		
		try {
			
			buyDto.setSeq_mbr(seqMbr);
			buyDto.setUpdater(seqMbr);
			
			if (buySrvc.historyDelete(buyDto)) {
				
				response.put("status", "success");
			}
			else {
				
				response.put("status", "fail");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".historyDelete()] " + e.getMessage(), e);
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
	 * @since 2024-011-04
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/buyDelivertView.web", method = RequestMethod.POST)
	public ModelAndView buyDelivertView(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			MemberDto _memberDto = memberSrvc.buyDelivertView(memberDto);
			
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setDt_reg(_memberDto.getDt_reg());
			_memberDto.setDelivery_request(_memberDto.getDelivery_request());
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			buyDto.setSeq_mbr(seqMbr);
			
			BuyListDto deliveryListDtl = buySrvc.deliveryListDtl(buyDto);
			BuyListDto deliveryListMst = buySrvc.deliveryListMst(buyDto);
			
			BuyListDto mergedbuyDelivery = buySrvc.mergedbuyDelivery(deliveryListMst, deliveryListDtl);
			
			mav.addObject("buyDelivery", mergedbuyDelivery.getList());
			mav.addObject("memberDto"	, _memberDto);
			mav.setViewName("front/buy/deliveryView");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".buyDelivertView()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/buy/deliveryChanges.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody List<Map<String, Object>> deliveryChanges(HttpServletRequest request) {
		
		List<Map<String, Object>> responseList = new ArrayList<>();
		MemberDto memberDto = new MemberDto();
		
		try {
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			List<MemberDto> memberList = memberSrvc.deliveryChanges(memberDto);
			
			for (MemberDto member : memberList) {
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("seq_mbr_addr", member.getSeq_mbr_addr());
				map.put("post", aes.decode(member.getPost()));
				map.put("addr1", aes.decode(member.getAddr1()));
				map.put("addr2", aes.decode(member.getAddr2()));
				
				responseList.add(map);
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".deliveryChanges()] " + e.getMessage(), e);
		}
		finally {}
		
		return responseList;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-12
	 * <p>DESCRIPTION: 구매 이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/pointUseHistory.web")
	public ModelAndView pointUseHistory(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
		
		try {
			
			BuyMasterDto buyMasterDto = new BuyMasterDto();
			
			buyMasterDto.setSeq_mbr(seqMbr);
			
			BuyMasterDto _buyMasterDto = buySrvc.pointUseHistoryMain(buyMasterDto);
			
			int tPoint = 0;
			int pCount = 0;
			String eDate = "";
			String lDate = "";
			
			if (_buyMasterDto != null) {
			
			tPoint		= _buyMasterDto.getTotal_use_point();
			pCount		= _buyMasterDto.getMst_count();
			eDate		= _buyMasterDto.getEarliest_date();
			lDate		= _buyMasterDto.getLatest_date();
			}
			
			mav.addObject("pCount"	, pCount);
			mav.addObject("tPoint"	, tPoint);
			mav.addObject("eDate"	, eDate);
			mav.addObject("lDate"	, lDate);
			
			pagingDto.setSeq_mbr(seqMbr);
			pagingDto.setCd_state("1");
			
			PagingListDto pointListDtl = buySrvc.pointListDtl(pagingDto);
			PagingListDto pointListMst = buySrvc.pointListMst(pagingDto);
			
			PagingListDto mergedPointList = buySrvc.mergedPointList(pointListMst, pointListDtl);
			
			mav.addObject("paging", mergedPointList.getPaging());
			mav.addObject("buyList", mergedPointList.getList());
			
			mav.setViewName("front/buy/pointUseHistory");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".pointUseHistory()] " + e.getMessage(), e);
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
	 * @since 2024-010-24
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/buy/pointHistory.web", method = RequestMethod.POST)
	public ModelAndView pointHistory(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto pagingListDto = buySrvc.pointHistory(pagingDto);
			
			List<SaleDto> check = (List<SaleDto>) pagingListDto.getList();
			
			int tPoint = 0;
			int pCount = 0;
			String eDate = "";
			String lDate = "";
			
			if (check != null && !check.isEmpty()) {
			
			tPoint		= check.get(0).getTotal_point();
			pCount		= check.get(0).getSle_count();
			eDate	= check.get(0).getEarliest_date();
			lDate	= check.get(0).getLatest_date();
			}
			
			mav.addObject("pCount"	, pCount);
			mav.addObject("tPoint"	, tPoint);
			mav.addObject("eDate"	, eDate);
			mav.addObject("lDate"	, lDate);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("front/buy/pointHistory");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".pointHistory()] " + e.getMessage(), e);
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
	 * @since 2024-010-17
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */	
	@RequestMapping(value = "/front/buy/reviewDelete.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> reviewDelete(HttpServletRequest request, @RequestBody SaleDto saleDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
		
		try {
			
			saleDto.setSeq_mbr(seqMbr);
			saleDto.setUpdater(seqMbr);
			
			if (saleSrvc.reviewDelete(saleDto)) {
				
				response.put("status", "success");
			}
			else {
				
				response.put("status", "fail");
			}
			SaleDto _saleDto = saleSrvc.reviewListCount(saleDto);
			
			response.put("reviewCount", _saleDto.getWriteReview_count()); 
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewDelete()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-23
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/front/buy/reviewModifyProc.web", method = RequestMethod.POST)
	public ModelAndView reviewModifyProc(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, FileUploadDto fileUploadDto, ImageData imagedata) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message = "";
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			saleDto.setSeq_mbr(seqMbr);
			saleDto.setRegister(seqMbr);
			
			String pathBase = dynamicProperties.getMessage("backoffice.upload.path_review", "[UNDEFINED]");
			String maxSize = dynamicProperties.getMessage("backoffice.upload.file.max10MB", "[UNDEFINED]");
			String allowedExt = dynamicProperties.getMessage("backoffice.upload.file.extension.doc", "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			SaleFileDto[] saleFileDto = new SaleFileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			List<Integer> review_imgs = imagedata.getReview_imgs();
			List<String> flg_del = imagedata.getFlg_del();
			List<Integer> review_imgIn = imagedata.getReview_imgIn();
			
			int _review_imgs = 0;
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable = (Hashtable<String, String>) uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				
					for (int loop = 0; loop < countFile; loop++) {
						
						fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
						fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
						fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
						
						int _review_imgIn = review_imgIn.get(loop);
						
						if (fileSize == null || fileSize == "") fileSize = "0";
						
						fileNameSve = fileNameSve.replace("\\", "");
						
						saleFileDto[loop] = new SaleFileDto();
						saleFileDto[loop].setFileNameOriginal(fileNameSrc);
						saleFileDto[loop].setFileNameSave(fileNameSve);
						saleFileDto[loop].setFileSize((Long.parseLong(fileSize)));
						saleFileDto[loop].setSeq_sle(saleDto.getSeq_sle());
						saleFileDto[loop].setSeq_buy_dtl(saleDto.getSeq_buy_dtl());
						saleFileDto[loop].setSeq_review(saleDto.getSeq_review());
						saleFileDto[loop].setSeq_mbr(saleDto.getSeq_mbr());
						saleFileDto[loop].setReview_imgIn(_review_imgIn);
						saleFileDto[loop].setFile_orig(fileNameSrc);
						saleFileDto[loop].setFile_save(fileNameSve);
						
					}
				}
				if (review_imgs != null && !review_imgs.isEmpty()) {
					_review_imgs = review_imgs.size();
				}
				
				SaleFileDto[] _saleFileDto = new SaleFileDto[_review_imgs];
				
				if (flg_del != null) {
					
					for (int loop = 0; loop < review_imgs.size(); loop++) {
						
						String imgFlgDel = flg_del.get(loop);
						int reviewImgValue = review_imgs.get(loop);
						
						_saleFileDto[loop] = new SaleFileDto();
						
						_saleFileDto[loop].setSeq_sle(saleDto.getSeq_sle());
						_saleFileDto[loop].setSeq_buy_dtl(saleDto.getSeq_buy_dtl());
						_saleFileDto[loop].setSeq_review(saleDto.getSeq_review());
						_saleFileDto[loop].setSeq_mbr(saleDto.getSeq_mbr());
						_saleFileDto[loop].setFlg_del(imgFlgDel);
						_saleFileDto[loop].setReview_imgs(reviewImgValue);
					}
				}
				boolean result = false;
				
				if (countFile > 0) {
					
					result = saleSrvc.modifyReview(saleDto, saleFileDto, _saleFileDto);
				} else {
					
					result = saleSrvc.modifyText(saleDto, _saleFileDto);
				}
				if (result) {
					
					request.setAttribute("script", "alert('상품 후기가 수정되었습니다.');");
					request.setAttribute("redirect", "/front/buy/reviewListPage.web");
				} else {
					
					request.setAttribute("script", "alert('시스템 관리자에게 문의하세요.');");
					request.setAttribute("redirect", "/front/buy/reviewListPage.web");
				}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewModifyProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-17
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/front/buy/reviewWriteProc.web", method = RequestMethod.POST)
	public ModelAndView reviewWriteProc(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message = "";
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			saleDto.setSeq_mbr(seqMbr);
			saleDto.setRegister(seqMbr);
			
			String pathBase = dynamicProperties.getMessage("backoffice.upload.path_review", "[UNDEFINED]");
			String maxSize = dynamicProperties.getMessage("backoffice.upload.file.max10MB", "[UNDEFINED]");
			String allowedExt = dynamicProperties.getMessage("backoffice.upload.file.extension.doc", "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			SaleFileDto[] saleFileDto = new SaleFileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable = (Hashtable<String, String>) uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				
				for (int loop = 0; loop < countFile; loop++) {
					
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileNameSve = fileNameSve.replace("\\", "");
					
					saleFileDto[loop] = new SaleFileDto();
					saleFileDto[loop].setFileNameOriginal(fileNameSrc);
					saleFileDto[loop].setFileNameSave(fileNameSve);
					saleFileDto[loop].setFileSize((Long.parseLong(fileSize)));
					saleFileDto[loop].setSeq_sle(saleDto.getSeq_sle());
					saleFileDto[loop].setSeq_buy_dtl(saleDto.getSeq_buy_dtl());
					saleFileDto[loop].setSeq_mbr(saleDto.getSeq_mbr());
					saleFileDto[loop].setFile_orig(fileNameSrc);
					saleFileDto[loop].setFile_save(fileNameSve);
					
				}
				
				boolean result = false;
				
				if (countFile > 0) {
					
					result = saleSrvc.insertReview(saleDto, saleFileDto);
				} else {
					
					result = saleSrvc.insertText(saleDto);
				}
				if (result) {
					
					request.setAttribute("script", "alert('상품 후기가 등록되었습니다.');");
					request.setAttribute("redirect", "/front/buy/reviewListPage.web");
				} else {
					
					request.setAttribute("script", "alert('시스템 관리자에게 문의하세요.');");
					request.setAttribute("redirect", "/front/buy/reviewListPage.web");
				}
			} 
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewWriteProc()] " + e.getMessage(), e);
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
	 * @since 2024-010-17
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/buy/reviewListPage.web")
	public ModelAndView reviewListPage(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, PagingDto reviewpagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			int count = 0;
			int reviwCount = 0;
			
			saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			reviewpagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			SaleListDto saleListDto = saleSrvc.reviewListPage(saleDto);
			
			List<SaleDto> saleList = (List<SaleDto>)saleListDto.getList();
			
			if (saleList != null && !saleList.isEmpty()) {
				
			SaleDto reviewCount = saleList.get(0);
			count = reviewCount.getList_count();
			}
			
			PagingListDto _reviewListImgs = saleSrvc.reviewPageListImgs(reviewpagingDto);
			PagingListDto _reviewpagingDto = saleSrvc.reviewPageList(reviewpagingDto);
			
			List<SaleDto> reviewList = (List<SaleDto>)_reviewpagingDto.getList();
			
			if (reviewList != null && !reviewList.isEmpty()) {
				
			SaleDto reviewWriteCount = reviewList.get(0);
			reviwCount = reviewWriteCount.getWriteReview_count();
			}
			
			PagingListDto mergedPagingList = saleSrvc.mergePageReviewAndImages(_reviewpagingDto, _reviewListImgs);
			
			mav.addObject("reviewList", mergedPagingList.getList());
			mav.addObject("paging"	, mergedPagingList.getPaging());
			
			mav.addObject("reviwCount"	, reviwCount);
			mav.addObject("count"	, count);
			mav.addObject("list", saleListDto.getList());
			
			mav.setViewName("front/buy/reviewList");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewListPage()] " + e.getMessage(), e);
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
	 * @since 2024-010-17
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/reviewModifyForm.web", method = RequestMethod.POST)
	public ModelAndView reviewModifyForm(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			saleDto.setSeq_mbr(seqMbr);
			saleDto.setUpdater(seqMbr);
			
			SaleListDto _saleDto = saleSrvc.reviewModify(saleDto);
			SaleListDto _saleDtoImgs = saleSrvc.reviewModifyImgs(saleDto);
			
			SaleListDto mergedReviewModify = saleSrvc.mergeReviewModify(_saleDto, _saleDtoImgs);
			
			mav.addObject("reviewList", mergedReviewModify.getList());
			mav.setViewName("front/buy/reviewModifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewModifyForm()] " + e.getMessage(), e);
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
	 * @since 2024-010-17
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/reviewWriteForm.web", method = RequestMethod.POST)
	public ModelAndView reviewWriteForm(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			SaleDto _saleDto = saleSrvc.review(saleDto);
			
			mav.addObject("saleDto", _saleDto);
			mav.setViewName("front/buy/reviewWriteForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".reviewWriteForm()] " + e.getMessage(), e);
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
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 상품 구매</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/writeProc.web", method = RequestMethod.POST)
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BuyDetailListDto buyDetailListDto, int usePoint, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String finalSleName = "";	// 마지막 판매 상품명
			
			int totalCount = 0;			// 총 갯수
			// int totalPrice = 0;
			int totalPrice = 0;			// 총 가격
			int totalPoint = 0;			// 총 포인트
			
			ArrayList<BuyDetailDto> listBuyDetailDto = new ArrayList<BuyDetailDto>();
			
			if (buyDetailListDto.getBuyList() != null) {
				for (int loop = 0; loop < buyDetailListDto.getBuyList().size(); loop++) {
					
					if (buyDetailListDto.getBuyList().get(loop).getCount() >= 1) {
						
						// 갯수가 1개 이상인 상품
						listBuyDetailDto.add(buyDetailListDto.getBuyList().get(loop));
						
						// 전체 상품 갯수 및 금액 그리고 구매명
						totalCount += buyDetailListDto.getBuyList().get(loop).getCount();
						totalPrice += buyDetailListDto.getBuyList().get(loop).getCount() * buyDetailListDto.getBuyList().get(loop).getPrice();
						totalPoint += buyDetailListDto.getBuyList().get(loop).getCount() * buyDetailListDto.getBuyList().get(loop).getPoint();
						finalSleName = buyDetailListDto.getBuyList().get(loop).getSle_nm();
						
						if (loop == buyDetailListDto.getBuyList().size() - 1) {
							
							totalPrice -= usePoint;
							if (totalPrice < 0) {
								totalPrice = 0;
							}
						}
					}
				}
			}
			// 선택된 상품이 1개 이상을 경우만 구매 실행
			if (listBuyDetailDto.size() > 0) {
				
				// 마스터 설정
				BuyMasterDto buyMasterDto = new BuyMasterDto();
				buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				buyMasterDto.setBuy_info(finalSleName + "-포함(총 개수: " + totalCount + ")");
				buyMasterDto.setBuy_count(totalCount);
				buyMasterDto.setBuy_price(totalPrice);
				buyMasterDto.setTotal_point(totalPoint);
				buyMasterDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				if (buySrvc.insert(buyMasterDto, listBuyDetailDto, "N/A",memberDto)) {
					request.setAttribute("script"	, "alert('추후 결제 페이지로 이동 예정');");
					request.setAttribute("redirect"	, "/");
				}
				else {
					request.setAttribute("script"	, "alert('구매에 실패했습니다! 잠시 후에 이용 바랍니다!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('선택된 상품이 없습니다!');");
				request.setAttribute("redirect"	, "/");
			}
			
			request.setAttribute("redirect"	, "/");
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param saleDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-13
	 * <p>DESCRIPTION: 상품 상세 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/buy/writeForm.web", method = RequestMethod.POST)
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, PagingDto reviewpagingDto, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String check = "[UNDEFINED]";
			
			if (check.equals(getSession(request, "SEQ_MBR"))) {
				
				reviewpagingDto.setSeq_mbr(0);
				saleDto.setSeq_mbr(0);
			} else {
				
				reviewpagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				saleDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			}
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			SaleDto _saleDto	= saleSrvc.select(saleDto);
			
			mav.addObject("saleDto"		, _saleDto);
			
			SaleDto reviewCount = saleSrvc.reviewCounts(saleDto);
			mav.addObject("reviewCount"		, reviewCount);
			
			PagingListDto _pagingListDto = saleSrvc.detailList(pagingDto);
			mav.addObject("list"	, _pagingListDto.getList());
			
			PagingListDto _reviewListImgs = saleSrvc.reviewListImgs(reviewpagingDto);
			PagingListDto _reviewpagingDto = saleSrvc.reviewList(reviewpagingDto);
			
			PagingListDto mergedPagingList = saleSrvc.mergeReviewAndImages(_reviewpagingDto, _reviewListImgs);
			
			List<SaleDto> reviewList = (List<SaleDto>) mergedPagingList.getList();
			
			for (int loop = 0; loop < reviewList.size(); loop++) {
				reviewList.get(loop).setMbr_nm(aes.decode(reviewList.get(loop).getMbr_nm()));
			}
			
			mav.addObject("paging"	, mergedPagingList.getPaging());
			mav.addObject("reviewList", mergedPagingList.getList());
			
			mav.setViewName("front/buy/writeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
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
	 * @since 2024-11-03
	 * <p>DESCRIPTION: 구매 이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/cancelhistory.web", method = RequestMethod.POST)
	public ModelAndView cancelhistory(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto buyListDtl = buySrvc.buyListDtl(pagingDto);
			PagingListDto buyListMst = buySrvc.buyListMst(pagingDto);
			
			PagingListDto mergedBuyList = buySrvc.mergedBuyList(buyListMst, buyListDtl);
			
			mav.addObject("paging", mergedBuyList.getPaging());
			mav.addObject("buyList", mergedBuyList.getList());
			
			mav.setViewName("front/buy/cancelHistory");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".cancelhistory()] " + e.getMessage(), e);
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
	 * @since 2024-11-03
	 * <p>DESCRIPTION: 구매 이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/history.web")
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			pagingDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			pagingDto.setCd_state("1");
			
			PagingListDto buyListDtl = buySrvc.buyListDtl(pagingDto);
			PagingListDto buyListMst = buySrvc.buyListMst(pagingDto);
			
			PagingListDto mergedBuyList = buySrvc.mergedBuyList(buyListMst, buyListDtl);
			
			mav.addObject("paging", mergedBuyList.getPaging());
			mav.addObject("buyList", mergedBuyList.getList());
			
			mav.setViewName("front/buy/history");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".history()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}