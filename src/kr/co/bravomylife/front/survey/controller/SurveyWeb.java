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
 * File			: SurveyWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241104165626][cydgate4957@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.survey.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.front.basket.controller.BasketWeb;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.survey.dto.SurveyDto;
import kr.co.bravomylife.front.survey.dto.SurveyListDto;
import kr.co.bravomylife.front.survey.service.SurveySrvc;
import kr.co.bravomylife.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-11-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.survey.controller.SurveyWeb")
public class SurveyWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	private SurveySrvc surveySrvc;
	
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-06
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/front/member/surveyModifyForm.web", method = RequestMethod.POST)
	public ModelAndView surveyModifyForm(HttpServletRequest request, HttpServletResponse response, SurveyDto surveyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
		SKwithAES aes		= new SKwithAES(staticKey);
		
		try {
			
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			surveyDto.setSeq_mbr(seqMbr);
			
			SurveyDto _surveyDto = surveySrvc.selectKey(surveyDto);
			
			if (_surveyDto == null) {
				
				_surveyDto = new SurveyDto();
				
				_surveyDto.setSeq_mbr(seqMbr);
				_surveyDto.setSeq_hp_sur_dtl(0);
			}
			
			SurveyListDto surveyListDtl = surveySrvc.surveyDtl(_surveyDto);
			
			List<SurveyDto> ctgList = (List<SurveyDto>) surveyListDtl.getList();
			
			if (ctgList.size() != 0) {
				
				String cd_ctg_mG = ctgList.get(0).getCd_ctg_m();
				String cd_ctg_mF = ctgList.get(1).getCd_ctg_m();
				String cd_ctg_mI = ctgList.get(2).getCd_ctg_m();
				
				mav.addObject("cd_ctg_mG"	, cd_ctg_mG);
				mav.addObject("cd_ctg_mF"	, cd_ctg_mF);
				mav.addObject("cd_ctg_mI"	, cd_ctg_mI);
			}
			
			SurveyListDto surveyListMst = surveySrvc.surveyMst(_surveyDto);
			
			SurveyListDto mergedSurvey = surveySrvc.mergedSurveyList(surveyListMst, surveyListDtl);
			
			List<SurveyDto> mergedList = (List<SurveyDto>) mergedSurvey.getList();
			
			if (mergedList.size() != 0) {
			
				String dtReg = mergedList.get(0).getDt_reg();
				String mbrNm = aes.decode(mergedList.get(0).getMbr_nm());
				int age = Integer.parseInt(mergedList.get(0).getAge());
				String gender = mergedList.get(0).getGender();
				String dtUpt = mergedList.get(0).getDt_upt();
				
				_surveyDto.setMbr_nm(mbrNm);
				_surveyDto.setDt_reg(dtReg);
				_surveyDto.setUser_age(age);
				_surveyDto.setGender(gender);
				_surveyDto.setDt_upt(dtUpt);
			}
			
			mav.addObject("surveyDto", _surveyDto);
			mav.addObject("surveyListDto", mergedSurvey.getList());
			
			mav.setViewName("front/member/surveyModifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".surveyModifyForm()] " + e.getMessage(), e);
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
	@RequestMapping(value = "/front/center/board/surveyProc.web", method = RequestMethod.POST)
	public ModelAndView surveyProc(HttpServletRequest request, HttpServletResponse response, SurveyDto surveyDto, SurveyListDto surveyListDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		surveyDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
		
		String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
		SKwithAES aes		= new SKwithAES(staticKey);
		
		try {
			
			if (surveyDto.getCd_survey_type().equals("2")) {
				
				SurveyDto _surveyDto = surveySrvc.userInfo(surveyDto);
				
				_surveyDto.setMbr_nm(aes.decode(_surveyDto.getMbr_nm()));
				String userBirth = _surveyDto.getAge();
				
				DateTimeFormatter ageFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate userAge  = LocalDate.parse(userBirth, ageFormatter);
				
				LocalDate today = LocalDate.now();
				
				_surveyDto.setUser_age(Period.between(userAge, today).getYears()+1);
				
				mav.addObject("surveyDto"	, _surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/surveyInfo");
			}
			else if (surveyDto.getCd_survey_type().equals("3")) {
				
				surveyDto.setCd_ctg_b(surveyDto.getCd_ctg().substring(0, 1));
				surveyDto.setCd_ctg_m(surveyDto.getCd_ctg().substring(1, 2));
				
				List<SurveyDto> surveyList = new ArrayList<>();
				surveyList.add(surveyDto);
				
				surveyListDto.setSurveyList(surveyList);
				
				mav.addObject("surveyListDto"	, surveyListDto.getSurveyList());
				mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/surveyFunction");
			}
			else if (surveyDto.getCd_survey_type().equals("4")) {
				
				surveyDto.setCd_ctg_b(surveyDto.getCd_ctg().substring(0, 1));
				surveyDto.setCd_ctg_m(surveyDto.getCd_ctg().substring(1, 2));
				
				List<SurveyDto> surveyList = surveyListDto.getSurveyList();
				
				SurveyDto _SurveyDto = new SurveyDto();
				
				_SurveyDto.setCd_ctg_b(surveyDto.getCd_ctg_b());
				_SurveyDto.setCd_ctg_m(surveyDto.getCd_ctg_m());
				
				surveyList.add(_SurveyDto);
				
				mav.addObject("surveyListDto"	, surveyListDto.getSurveyList());
				mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/surveyIngred");
			}
			else if (surveyDto.getCd_survey_type().equals("5")) {
				
				surveyDto.setCd_ctg_b(surveyDto.getCd_ctg().substring(0, 1));
				surveyDto.setCd_ctg_m(surveyDto.getCd_ctg().substring(1, 2));
				surveyDto.setAge(Integer.toString(surveyDto.getUser_age()));
				
				List<SurveyDto> surveyList = surveyListDto.getSurveyList();
				
				SurveyDto _SurveyDto = new SurveyDto();
				
				_SurveyDto.setCd_ctg_b(surveyDto.getCd_ctg_b());
				_SurveyDto.setCd_ctg_m(surveyDto.getCd_ctg_m());
				
				surveyList.add(_SurveyDto);
				
				SurveyListDto _surveyListDto = surveySrvc.select(surveyListDto);
				
				List<SurveyDto> _surveyList = _surveyListDto.getSurveyList();
				List<SurveyDto> List = new ArrayList<>();
				
				for (SurveyDto survey : _surveyList) {
					
					SurveyDto resultSurvey = new SurveyDto();
					
					resultSurvey.setSeq_sle(survey.getSeq_sle());
					resultSurvey.setSle_nm(survey.getSle_nm());
					resultSurvey.setDiscount_sale(survey.getDiscount_sale());
					resultSurvey.setImg(survey.getImg());
					resultSurvey.setPoint_stack(survey.getPoint_stack());
					resultSurvey.setPrice_sale(survey.getPrice_sale());
					resultSurvey.setDiscount(survey.getDiscount());
					resultSurvey.setCd_ctg_m(survey.getCd_ctg_m());
					resultSurvey.setCd_ctg_b(survey.getCd_ctg_b());
					
					List.add(resultSurvey);
				}
				
				surveyListDto.setSurveyList(List);
				
				surveySrvc.insert(surveyDto, surveyListDto);
				
				String cd_ctg_mG = surveyListDto.getSurveyList().get(0).getCd_ctg_m();
				String cd_ctg_mF = surveyListDto.getSurveyList().get(1).getCd_ctg_m();
				String cd_ctg_mI = surveyListDto.getSurveyList().get(2).getCd_ctg_m();
				
				mav.addObject("cd_ctg_mG"	, cd_ctg_mG);
				mav.addObject("cd_ctg_mF"	, cd_ctg_mF);
				mav.addObject("cd_ctg_mI"	, cd_ctg_mI);
				
				mav.addObject("surveyListDto"	, surveyListDto.getSurveyList());
				mav.addObject("surveyDto"	, surveyDto);
				mav.setViewName("front/center/board/personalHealth/survey/surveyResult");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".surveyProc()] " + e.getMessage(), e);
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
	 * @since 2024-011-04
	 * <p>DESCRIPTION: 리뷰 관리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/surveyForm.web", method = RequestMethod.POST)
	public ModelAndView surveyForm(HttpServletRequest request, HttpServletResponse response, SurveyDto surveyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.setViewName("front/center/board/personalHealth/survey/surveyStart");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".surveyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}