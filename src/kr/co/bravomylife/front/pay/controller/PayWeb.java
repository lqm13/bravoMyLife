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
 * File			: PayWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930144800][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.pay.controller;

import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.ArrayList;
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


import kr.co.bravomylife.front.buy.dto.BuyDetailDto;
import kr.co.bravomylife.front.buy.dto.BuyDetailListDto;
import kr.co.bravomylife.front.buy.dto.BuyDto;
import kr.co.bravomylife.front.buy.dto.BuyListDto;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.member.dto.MemberDto;
import kr.co.bravomylife.front.member.service.MemberSrvc;
import kr.co.bravomylife.front.pay.component.PayCmpn;
import kr.co.bravomylife.front.pay.service.ApiService;
import kr.co.bravomylife.util.security.SKwithAES;
import kr.co.bravomylife.front.buy.dto.BuyMasterDto;
import kr.co.bravomylife.front.buy.service.BuySrvc;
import kr.co.bravomylife.util.Datetime;
import kr.co.bravomylife.util.servlet.Request;
import kr.co.bravomylife.front.sale.dto.SaleDto;

/**
 * @version 1.0.0
 * @author 
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.pay.controller.PayWeb")
public class PayWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(PayWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	private PayCmpn payCmpn;
	
	@Inject
	private BuySrvc buySrvc;
	
	@Inject
	private MemberSrvc memberSrvc;
	
	@Inject
	ApiService apiService;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */

	@RequestMapping(value = "/front/pay/payup/receive.api", method = RequestMethod.POST)
	public ModelAndView receive(@RequestParam Map<String, String> param, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			if ("0000".equals(param.get("res_cd"))) {
				
				String res_cd		= param.get("res_cd");
				String ordr_idxx	= param.get("ordr_idxx");
				String res_msg		= param.get("res_msg");
				String enc_data		= param.get("enc_data");
				String enc_info		= param.get("enc_info");
				String tran_cd		= param.get("tran_cd");
				String buyr_mail	= param.get("buyr_mail");
				
				String url = "https://api.testpayup.co.kr/ap/api/payment/" + ordr_idxx + "/pay";
				Map<String,String> apiMap = new HashMap<>();		
				apiMap.put("res_cd",res_cd);
				apiMap.put("ordr_idxx",ordr_idxx);
				apiMap.put("res_msg",res_msg);
				apiMap.put("enc_data",enc_data);
				apiMap.put("enc_info",enc_info);
				apiMap.put("tran_cd",tran_cd);
				apiMap.put("buyr_mail",buyr_mail);
				
				Map<String,Object> apiResult = new HashMap<>();
				apiResult = payCmpn.JsonApi(request, url, apiMap);
				
				/** 페이업 거래번호 */
				String deal_num = (String) apiResult.get("transactionId");
				boolean isResult = true;
				
				if ("0000".equals(apiResult.get("responseCode"))) {
					
					// logger.info("[" + this.getClass().getName() + ".receiveOld().RES2nd.SUCCESS] " + apiResult.toString());
					//isResult = buySrvc.updateByDealNum(deal_num, Integer.parseInt(getSession(request, "SEQ_MBR")), "Y");
					isResult = buySrvc.updateByDealNum(deal_num, -1, "Y");
					
					request.setAttribute("script"	, "alert('정상적으로 결제되었습니다. 구매해 주셔서 감사합니다.');");
					request.setAttribute("redirect"	, "/");
					
				}
				else {
					logger.error("[" + this.getClass().getName() + ".receiveOld().RES2nd.FAILURE] " + apiResult.toString());
					//isResult = buySrvc.updateByDealNum(deal_num, Integer.parseInt(getSession(request, "SEQ_MBR")), "N");
					isResult = buySrvc.updateByDealNum(deal_num, -1, "N");
					
					request.setAttribute("script"	, "alert('[" + apiResult.get("responseCode") + "]결제가 실패되었습니다. 고객센터(=Payup)로 문의바랍니다!');");
					request.setAttribute("redirect"	, "/");
				}
				
				// 결제 결과에 대한 업데이트 실패 시
				if (!isResult) {
					request.setAttribute("script"	, "alert('[P001]결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				logger.error("[" + this.getClass().getName() + ".receiveOld().RES1st.FAILURE] " + param.toString());
				request.setAttribute("script"	, "alert('[" + param.get("res_cd") + "]결제 처리에 실패하였습니다. 고객센터(=Payup)로 문의바랍니다!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			request.setAttribute("script"	, "alert('[P000]결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!');");
			request.setAttribute("redirect"	, "/");
			mav.setViewName("forward:/servlet/result.web");
			logger.error("[" + this.getClass().getName() + ".receive()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-31
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value="/front/pay/cancelForm.web", method = RequestMethod.POST)
	public ModelAndView cancelForm(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			buyDto.setSeq_mbr(seqMbr);
			
			BuyListDto cancelListDtl = buySrvc.cancelDtl(buyDto);
			BuyListDto cancelListMst = buySrvc.cancelMst(buyDto);
			
			BuyListDto mergedcancel = buySrvc.mergedcancelList(cancelListMst, cancelListDtl);
			
			mav.addObject("cancel", mergedcancel.getBuy());
			mav.addObject("cancelList", mergedcancel.getList());
			mav.setViewName("front/buy/cancelForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".cancelForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-31
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/pay/cancleOrder.json",  method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> cancelOrder(HttpServletRequest request, @RequestBody BuyDetailDto buyDetailDto) {
		
		Map<String, Object> response = new HashMap<>();
		
		buyDetailDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
		
		try {
		
		Map<String,String> map = new HashMap<>();
		
		String url = "https://api.testpayup.co.kr/v2/api/payment/himedia/cancel2";
		
		String merchantId = "himedia";
		String transactionId = buyDetailDto.getDeal_num();
		String signature =	"";
		String apiCertKey =	"ac805b30517f4fd08e3e80490e559f8e";
		String p = "|";
		
		map.put("merchantId",merchantId);
		map.put("transactionId",transactionId);
		
		signature = apiService.getSHA256Hash(merchantId+p+transactionId+p+apiCertKey);
		
		map.put("signature",signature);
		
		Map<String,Object> apiResult = apiService.JsonApi(url, map);
		
		System.out.println(apiResult.toString());
		System.out.println(apiResult.get("responseCode"));
		System.out.println(apiResult.get("responseMsg"));
		
		if (apiResult.get("responseCode").equals("0000")) {
			
			buySrvc.updateCancle(buyDetailDto);
			
			response.put("code", "success");
			response.put("message", "주문 취소가 신청되었습니다.");
		}
		else {
			
			response.put("code", "fail");
			response.put("message", "결제 시스템 문제가 발생했습니다. 관리자에게 문의해주십시오.");
		}
		
		response.putAll(apiResult);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".cancelOrder()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	@RequestMapping(value = "/front/pay/payup/pay.web", method = RequestMethod.POST)
	public ModelAndView pay(@RequestParam Map<String,String> param, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			String res_cd		= param.get("res_cd");
			String ordr_idxx	= param.get("ordr_idxx");
			String res_msg		= param.get("res_msg");
			String enc_data		= param.get("enc_data");
			String enc_info		= param.get("enc_info");
			String tran_cd		= param.get("tran_cd");
			String buyr_mail	= param.get("buyr_mail");
			
			String url = "https://api.testpayup.co.kr/ap/api/payment/" + ordr_idxx + "/pay";
			Map<String,String> apiMap = new HashMap<>();		
			apiMap.put("res_cd",res_cd);
			apiMap.put("ordr_idxx",ordr_idxx);
			apiMap.put("res_msg",res_msg);
			apiMap.put("enc_data",enc_data);
			apiMap.put("enc_info",enc_info);
			apiMap.put("tran_cd",tran_cd);
			apiMap.put("buyr_mail",buyr_mail);
			
			Map<String,Object> apiResult = new HashMap<>();
			apiResult = payCmpn.JsonApi(request, url, apiMap);
			
			/** 페이업 거래번호 */
			String deal_num = (String) apiResult.get("transactionId");
			boolean isResult = true;
			
			if ("0000".equals(apiResult.get("responseCode"))) {
				
				// logger.info("[" + this.getClass().getName() + ".pay().RES.SUCCESS] " + apiResult.toString());
				isResult = buySrvc.update(deal_num, Integer.parseInt(getSession(request, "SEQ_MBR")), "Y");
				
				request.setAttribute("script"	, "alert('정상적으로 결제되었습니다. 구매해 주셔서 감사합니다.');");
				request.setAttribute("redirect"	, "/");
				/*
				mav.setViewName("pay/pay_s");
				mav.addObject("responseMsg"		,apiResult.get("responseMsg"));
				mav.addObject("cardName"		,apiResult.get("cardName"));
				mav.addObject("transactionId"	,apiResult.get("transactionId"));
				*/
			}
			else {
				logger.error("[" + this.getClass().getName() + ".payProcess().RES.FAILURE] " + apiResult.toString());
				isResult = buySrvc.update(deal_num, Integer.parseInt(getSession(request, "SEQ_MBR")), "N");
				
				request.setAttribute("script"	, "alert('결제가 실패되었습니다. 고객센터로 문의바랍니다!');");
				request.setAttribute("redirect"	, "/");
				
				/*
				mav.setViewName("pay/pay_f");
				mav.addObject("responseMsg"		,apiResult.get("responseMsg"));
				*/
			}
			
			// 결제 결과에 대한 업데이트 실패 시
			if (!isResult) {
				request.setAttribute("script"	, "alert('[ERROR]결제 정보 업데이트');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".pay()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;	
	}
	
	@RequestMapping(value = "/front/pay/payup/order.json", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> order(@RequestParam Map<String, String> param, HttpServletRequest request, BuyDetailListDto buyDetailListDto, MemberDto memberDto) throws NoSuchAlgorithmException {
		
		Map<String,Object> returnMap = new HashMap<>();
		// Map<String,String> map = new HashMap<>();
		
		int usePoint = Integer.parseInt(param.get("usePoint"));
		// int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
		
		try {
			// logger.info("[" + this.getClass().getName() + ".order().REQ] " + param.toString());
			
			String yyyyMMddHHmmss = Datetime.getNow("yyyyMMddHHmmss");
			
			String merchantId			= "himedia";
			String key					= "ac805b30517f4fd08e3e80490e559f8e";
			String orderNumber			= "HM-" + yyyyMMddHHmmss;
			
			// 여러 상품의 총 금액 계산
			int totalAmount = 0;
			int i = 0;

			// 반복문을 통해 각 상품의 가격과 수량을 곱한 총합을 계산
			while (param.containsKey("buyList[" + i + "].price") && param.containsKey("buyList[" + i + "].count")) {
				String priceStr = param.get("buyList[" + i + "].price");
				String countStr = param.get("buyList[" + i + "].count");

				// 가격과 수량이 null이 아닌 경우에만 계산
				if (priceStr != null && !priceStr.isEmpty() && countStr != null && !countStr.isEmpty()) {
					try {
						int price = Integer.parseInt(priceStr);
						int count = Integer.parseInt(countStr);
						totalAmount += price * count;
					} catch (NumberFormatException e) {
						logger.warn("숫자로 변환할 수 없는 값이 발견되었습니다: " + priceStr + ", " + countStr);
					}
				}
				i++; // 다음 상품으로 이동
			}

			// 계산된 총 금액을 문자열로 변환하여 amount에 저장
			String amount 				= Integer.toString(totalAmount - usePoint);

			//String amount				= "100";
			//String amount				= Integer.toString(Integer.parseInt(param.get("buyList[0].price")) * Integer.parseInt(param.get("buyList[0].count")));
																			// 금액: param.get("amount");
			String quota				= "0";								// 할부: param.get("quota")
			String itemName				= param.get("buyList[0].sle_nm");	// 판매 상품명: param.get("itemName");
			String userName				= getSession(request, "NAME");		// 구매자명 param.get("userName");
			String userAgent			= "WP";
			String returnUrl			= "returnUrl";
			String signature			= "";	//아래에서 생성
			String timestamp			= yyyyMMddHHmmss;	
			
			signature = payCmpn.getSHA256Hash(merchantId + "|" + orderNumber + "|" + amount + "|" + key + "|" + timestamp);
			
			String url = "https://api.testpayup.co.kr/ap/api/payment/" + merchantId + "/order";
			Map<String,String> apiMap = new HashMap<>();
			apiMap.put("orderNumber"	,orderNumber);
			apiMap.put("amount"			,amount);
			apiMap.put("itemName"		,itemName);
			apiMap.put("userName"		,userName);
			apiMap.put("signature"		,signature);
			apiMap.put("timestamp"		,timestamp);
			
			String finalSleName = "";
			int totalCount = 0;			// 총 갯수
			int totalPrice = 0;			// 총 가격
			int totalPoint = 0;
			
			
			String serverUrl = "";
			if (staticProperties.getProperty("common.mode", "[UNDEFINED]").equalsIgnoreCase("LOCAL")) {
				serverUrl = "http://119.71.96.251:"
							+ staticProperties.getProperty("common.server.port", "[UNDEFINED]");
			}
			else if (staticProperties.getProperty("common.mode", "[UNDEFINED]").equalsIgnoreCase("DEVELOPMENT")) {
				 // moon(8080), jupiter(8081), saturn(8082), uranus(8083)
				serverUrl = "http://119.71.96.251:8082";
			}
			else {
				serverUrl = "[UNDEFINED]";
			}
			/*
			if (Request.isDevice(request, "mobile")) {
				apiMap.put("auth_return","http://119.71.96.251:"
						+ staticProperties.getProperty("common.server.port", "[UNDEFINED]") + "/front/pay/payup/receive.api");
			}
			*/
			
			if (Request.isDevice(request, "mobile")) {
				apiMap.put("auth_return", serverUrl + "/front/pay/payup/receive.api");
			}
			else {
				apiMap.put("userAgent", userAgent);
				apiMap.put("returnUrl", returnUrl);
			}
			
			apiMap.put("quota",quota);
			apiMap.put("bypassValue","himediaValue");
			
			returnMap = payCmpn.JsonApi(request, url, apiMap);
			
			// logger.info("통신 결과[" + this.getClass().getName() + ".order().RES] " + returnMap.toString());
			
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
			if ("0000".equals(returnMap.get("responseCode"))) {
				// logger.info("[" + this.getClass().getName() + ".order().RES.SUCCESS] " + returnMap.toString());
				
				if (buyDetailListDto.getBuyList() != null) {
					
					/** 페이업 거래번호 */
					String deal_num = (String) returnMap.get("ordr_idxx");
					
					// 마스터 설정
					BuyMasterDto buyMasterDto = new BuyMasterDto();
					buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
					buyMasterDto.setBuy_info(finalSleName + "-포함(총 개수: " + totalCount + ")");
					buyMasterDto.setBuy_count(totalCount);
					buyMasterDto.setBuy_price(totalPrice);
					buyMasterDto.setTotal_point(totalPoint);
					buyMasterDto.setUse_point(usePoint);
					buyMasterDto.setSeq_mbr_addr(memberDto.getSeq_mbr_addr());
					buyMasterDto.setDelivery_request(memberDto.getDelivery_request());
					buyMasterDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
					
					if (!buySrvc.insert(buyMasterDto, (ArrayList<BuyDetailDto>) buyDetailListDto.getBuyList(), deal_num, memberDto)) {
						// 구매 정보 저장 에러
						returnMap.put("responseCode", "B001");
						returnMap.put("responseMsg", "[ERROR]구매 정보 저장");
						
						return returnMap;
					}
					if (!memberSrvc.pointInsert(buyMasterDto)) {
						
						returnMap.put("responseMsg", "[ERROR]회원 정보 저장");
						return returnMap;
					}
				}
				else {
					// 상품 정보 부재 에러
					returnMap.put("responseCode", "B000");
					returnMap.put("responseMsg", "[ERROR]구매 정보 부재");
				}
			}
			else {
				logger.error("[" + this.getClass().getName() + ".order().RES.FAILURE] " + returnMap.toString());
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".order()] " + e.getMessage(), e);
		}
		finally {}
		
		return returnMap;
	}
	
	@RequestMapping(value = "/front/pay/index.web", method = RequestMethod.POST)
	public ModelAndView index(BuyDetailListDto buyDetailListDto, HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String flgMobile	= "N";
			if (Request.isDevice(request, "mobile")) flgMobile = "Y";
			
			mav.addObject("flgMobile"	, flgMobile);
			
			String staticKey = staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes = new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			MemberDto _memberDto = memberSrvc.select(memberDto);
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			
			DecimalFormat formatter = new DecimalFormat("#,###");
			
			List<BuyDetailDto> _buyDetailListDto = buyDetailListDto.getBuyList();
			List<Map<String, Object>> responseList = new ArrayList<>();
			
			int totalPriceSum = 0;
			int totalPointSum = 0;
			int totalPrice = 0;
			int totalPoint = 0;
			
			String formatTotalPriceSum = "";
			String formatTotalPointSum = "";
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			for (BuyDetailDto detail : _buyDetailListDto) {
				
				if (detail.getCount() == 0) {
					continue;
				}
				
				detail.setSeq_mbr(seqMbr);
				
				Map<String, Object> map = new HashMap<>();
				map.put("seq_mbr", detail.getSeq_mbr());
				map.put("seq_sle", detail.getSeq_sle());
				map.put("sle_nm", detail.getSle_nm());
				map.put("price", detail.getPrice());
				map.put("count", detail.getCount());
				map.put("point", detail.getPoint());
				map.put("cd_ctg_m", detail.getCd_ctg_m());
				map.put("cd_ctg_b", detail.getCd_ctg_b());
				map.put("total_price_sum", detail.getTotal_price_sum());
				map.put("total_point_sum", detail.getTotal_point_sum());
				
				totalPrice = detail.getPrice() * detail.getCount();
				totalPoint = detail.getPoint() * detail.getCount();
				
				totalPriceSum += totalPrice;
				totalPointSum += totalPoint;
				
				formatTotalPriceSum = formatter.format(totalPriceSum);
				formatTotalPointSum = formatter.format(totalPointSum);
				
				responseList.add(map);
			}
			
			mav.addObject("buyList", responseList);
			mav.addObject("formatTotalPriceSum", formatTotalPriceSum);
			mav.addObject("formatTotalPointSum", formatTotalPointSum);
			mav.addObject("totalPriceSum", totalPriceSum);
			mav.addObject("totalPointSum", totalPointSum);
			mav.addObject("memberDto", _memberDto);
			mav.setViewName("front/pay/index");
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		return mav;
	}
}
