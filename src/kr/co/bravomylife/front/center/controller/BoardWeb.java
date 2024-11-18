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
 * File			: BoardWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004150812][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.front.center.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;

import kr.co.bravomylife.front.center.service.BoardSrvc;
import kr.co.bravomylife.front.common.Common;
import kr.co.bravomylife.front.common.component.SessionCmpn;
import kr.co.bravomylife.front.common.dto.PagingDto;
import kr.co.bravomylife.front.common.dto.PagingListDto;
import kr.co.bravomylife.front.sale.dto.ResponseInfosDto;
import kr.co.bravomylife.front.sale.dto.RowDataDto;
import kr.co.bravomylife.common.dto.FileDownloadDto;
import kr.co.bravomylife.common.dto.FileDto;
import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;
import kr.co.bravomylife.common.interfaces.JsonItrf;
import kr.co.bravomylife.front.center.dto.BoardDto;

/**
 * 
 * @since 2024-10-10
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.front.center.controller.BoardWeb")
public class BoardWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BoardWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	@Inject
	BoardSrvc boardSrvc;
	
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
	@RequestMapping(value = "/front/center/board/personalHealth/searchView.web", method = RequestMethod.POST)
	public ModelAndView searchView(HttpServletRequest request, HttpServletResponse response, String prdlst_report_no) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String keyId = "3b028aec34844276be28";
			String serviceId = "C003";
			String dataType = "json";
			String startIdx = "1";
			String endIdx = "100";
			String _prdlst_report_no = URLEncoder.encode(prdlst_report_no, "UTF-8");
			
			String url = "http://openapi.foodsafetykorea.go.kr/api/" + keyId + "/" + serviceId + "/" + dataType + "/" + startIdx + "/" + endIdx + "/PRDLST_REPORT_NO=" + _prdlst_report_no;
			
			ResponseInfosDto responseDto = (ResponseInfosDto) JsonItrf.connectGet(
					null, 
					new TypeReference<ResponseInfosDto>() {}, 
					url
				);
			
			debuggingJSON(responseDto);
			debuggingJSON(responseDto.getC003().getRow());
			
			RowDataDto rowDataDto = new RowDataDto();
			
			rowDataDto.setBssh_nm(responseDto.getC003().getRow()[0].getBssh_nm());
			rowDataDto.setPrdlst_nm(responseDto.getC003().getRow()[0].getPrdlst_nm());
			rowDataDto.setPrdlst_report_no(responseDto.getC003().getRow()[0].getPrdlst_report_no());
			rowDataDto.setPrms_dt(responseDto.getC003().getRow()[0].getPrms_dt());
			rowDataDto.setPog_daycnt(responseDto.getC003().getRow()[0].getPog_daycnt());
			rowDataDto.setDispos(responseDto.getC003().getRow()[0].getDispos());
			rowDataDto.setNtk_mthd(responseDto.getC003().getRow()[0].getNtk_mthd());
			rowDataDto.setPrdt_shap_cd_nm(responseDto.getC003().getRow()[0].getPrdt_shap_cd_nm());
			rowDataDto.setCstdy_mthd(responseDto.getC003().getRow()[0].getCstdy_mthd());
			rowDataDto.setIftkn_atnt_matr_cn(responseDto.getC003().getRow()[0].getIftkn_atnt_matr_cn());
			rowDataDto.setPrimary_fnclty(responseDto.getC003().getRow()[0].getPrimary_fnclty());
			rowDataDto.setStdr_stnd(responseDto.getC003().getRow()[0].getStdr_stnd());
			rowDataDto.setRawmtrl_nm(responseDto.getC003().getRow()[0].getRawmtrl_nm());
			
			mav.addObject("rowDataDto", rowDataDto);
			mav.setViewName("front/center/board/personalHealth/searchView");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".searchView()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-25
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	 
	@RequestMapping(value = "/front/board/searchItem.json", method = RequestMethod.POST, headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> searchItem(HttpServletRequest request, @RequestBody Map<String, String> item) {
		
		Map<String, Object> response = new HashMap<>();
		
		try {
			
			String keyId = "3b028aec34844276be28";
			String serviceId = "C003";
			String dataType = "json";
			String startIdx = "1";
			String endIdx = "100";
			String prdlst_nm = URLEncoder.encode(item.get("prdlst_nm"), "UTF-8");
			
			String url = "http://openapi.foodsafetykorea.go.kr/api/" + keyId + "/" + serviceId + "/" + dataType + "/" + startIdx + "/" + endIdx + "/PRDLST_NM=" + prdlst_nm;
			
			ResponseInfosDto responseDto = (ResponseInfosDto) JsonItrf.connectGet(
					null, 
					new TypeReference<ResponseInfosDto>() {}, 
					url
				);
			
			debuggingJSON(responseDto);
			
			response.put("responseDto", responseDto);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".searchItem()] " + e.getMessage(), e);
		}
		finally {}
		
		return response;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-25
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/personalHealth/searchForm.web", method = RequestMethod.POST)
	public ModelAndView searchForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/center/board/personalHealth/searchForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".searchForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
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
	@RequestMapping(value = "/front/center/board/personalHealth/index.web", method = RequestMethod.POST)
	public ModelAndView personalHealth(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/center/board/personalHealth/index");
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
	 * @since 2024-11-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/introduce/index.web", method = RequestMethod.POST)
	public ModelAndView introduce(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.introduceSelect(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			mav.setViewName("front/center/board/introduce/index");
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
	 * @since 2024-11-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/health/list.web", method = RequestMethod.POST)
	public ModelAndView health(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			List<BoardDto> _boardDto = boardSrvc.healthSelect(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			mav.setViewName("front/center/board/health/list");
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
	 * @since 2024-11-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/ingred/list.web", method = RequestMethod.POST)
	public ModelAndView ingred(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			List<BoardDto> _boardDto = boardSrvc.ingredSelect(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			mav.setViewName("front/center/board/ingred/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".main()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param type
	 * @param sequence
	 * @param model
	 * @return ModelAndView
	 * 
	 * @since 2024-09-04
	 * <p>DESCRIPTION: 파일 다운로드</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/download.web", method = RequestMethod.POST)
	public ModelAndView download(String type, long sequence, Model model) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto boardDto = new BoardDto();
			
			FileDownloadDto fileDownloadDto = new FileDownloadDto();
			File file = null;
			
			// [2018-11-05][pluto@plutozone.com][TODO-개선: 타입이 정의되어 있지 않을 경우 처리]
			//if (type.equals("BbsNotice")) boardDto.setCd_bbs_type(1);
			//else if (type.equals("BbsQuestion")) boardDto.setCd_bbs_type(3);
			if ("BbsNotice".equals(type)) {
				boardDto.setCd_bbs_type(1);
			} else if ("BbsQuestion".equals(type)) {
				boardDto.setCd_bbs_type(3);
			} else if ("BbsNews".equals(type)) {
				boardDto.setCd_bbs_type(4);
			}
			
			boardDto.setSeq_bbs((int)sequence);
			
			boardDto	= boardSrvc.select(boardDto);
			boardDto.setFile_orig(boardDto.getFile_orig());
			boardDto.setFile_save(boardDto.getFile_save());
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
			
			file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
			
			fileDownloadDto.setFile_original(boardDto.getFile_orig());
			fileDownloadDto.setFile_size(file.length());
			
			if (file == null || file.exists() == false ) {
				mav.setViewName("redirect:/error.web?code=404");
				
				return mav;
			}
			else {
				model.addAttribute("file", file);
				model.addAttribute("filename", fileDownloadDto.getFile_original());
				model.addAttribute("filesize", fileDownloadDto.getFile_size());
				
				mav.setViewName("fileDownloadView");
			}
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".download()] " + e.getMessage(), e);
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
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/remove.web", method = RequestMethod.POST)
	public ModelAndView remove(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (boardSrvc.deleteFlag(boardDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/front/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String contents = boardDto.getContent();
			
			contents = contents.replace("<p>", "").replace("</p>", "");
			
			boardDto.setContent(contents);

			boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (boardSrvc.update(boardDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			if (boardDto.getCd_bbs_type() == 3) {
				mav.setViewName("front/center/board/question/modifyForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/view.web", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			if (boardDto.getCd_bbs_type() == 1) {
				mav.setViewName("front/center/board/notice/view");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				mav.setViewName("front/center/board/faq/view");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				
				// DB 부하 감소를 위해 답변이 있을 때만
				if (_boardDto.getSeq_reply() > 0) {
					BoardDto boardReplyDto = boardSrvc.selectReply(boardDto);
					mav.addObject("boardReplyDto", boardReplyDto);
				}
				
				mav.setViewName("front/center/board/question/view");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				mav.setViewName("front/center/board/news/view");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	@RequestMapping(value = "/front/center/board/writeProc.web", method = RequestMethod.POST)
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			String contents = boardDto.getContent();
			
			contents = contents.replace("<p>", "").replace("</p>", "");
			
			boardDto.setContent(contents);
			
			boardDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			// **************************
			// For Board File
			// **************************
			
			/*
			if (boardDto.getCd_bbs_type() == 3) {
			
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			} else if (boardDto.getCd_bbs_type() == 1) {
				
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.pathn", "[UNDEFINED]");
			}
			*/
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);
					fileDto[loop].setFileNameSave(fileNameSve);
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));
					totalSize += Long.parseLong(fileSize);
				}
				
				
				boardDto.setFile_orig(fileNameSrc);
				boardDto.setFile_save(fileNameSve);
				
				if (boardSrvc.insert(boardDto)) {
					// GET에서 POST로 변경
					String[] arrName = new String[1];
					String[] arrValue = new String[1];
					
					arrName[0] = "cd_bbs_type";
					arrValue[0] = "3";
					
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("post"		, "/front/center/board/list.web");
					request.setAttribute("name"		, arrName);
					request.setAttribute("value"	, arrValue);
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/");
			}
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	//GET 방식으로는 사용자가 게시글 작성 폼을 열 수 있고, POST 방식은 작성한 게시글을 저장
	@RequestMapping(value = "/front/center/board/writeForm.web", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, kr.co.bravomylife.front.center.dto.BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		
		try {
			if ("GET".equalsIgnoreCase(request.getMethod())) {
				mav.setViewName("front/center/board/question/writeForm");
			}
			else if ("POST".equalsIgnoreCase(request.getMethod())) {
			if (boardDto.getCd_bbs_type() == 3) {
				mav.setViewName("front/center/board/question/writeForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
				}
			}
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
	 * @since 2024-10-07
	 * <p>DESCRIPTION: 고객센터 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			/* 로그인 세션 체크가 정상적으로 동작하지 않던 코드 수정 */
			/*이 주석을 풀시 이 코드를 사용하거나 아래의 코드 하나만을 사용해야 됨 */
			
			if (pagingDto.getCd_bbs_type() == 3 && !sessionCmpn.isSession(request)) {
				request.setAttribute("script"	, "alert('로그인이 필요합니다!');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web?url=/front/center/board/list.web");
				mav.setViewName("forward:/servlet/result.web");
			}
			else {
				// 로그인 성공 후 세션에 사용자 정보 저장
				if (pagingDto.getCd_bbs_type() == 3) {
					
					HttpSession session = request.getSession();
					session.setAttribute("sessionUser", "SEQ_MBR");
				}
				
				if (pagingDto.getCd_bbs_type() == 3) {
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
					
				}
			}
				String check = "[UNDEFINED]";
				
				if (pagingDto.getCd_bbs_type() == 3 && check.equals(getSession(request, "SEQ_MBR"))) {
					pagingDto.setRegister(0);
				} else if (pagingDto.getCd_bbs_type() == 3 && !check.equals(getSession(request, "SEQ_MBR"))) {
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				}
				
				PagingListDto pagingListDto = boardSrvc.list(pagingDto);
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				if (pagingDto.getCd_bbs_type() == 1) {
					mav.setViewName("front/center/board/notice/list");
				}
				else if (pagingDto.getCd_bbs_type() == 2) {
					mav.setViewName("front/center/board/faq/list");
				}
				else if (pagingDto.getCd_bbs_type() == 3) {
					mav.setViewName("front/center/board/question/list");
				}
				else if (pagingDto.getCd_bbs_type() == 4) {
					mav.setViewName("front/center/board/news/list");
				}
				else {
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".totalList()] " + e.getMessage(), e);
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
	 * @since 2024-10-16
	 * <p>DESCRIPTION: 마이페이지 문의 이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/myPageNotice/list.web")
	public ModelAndView myPageNoticeList(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			PagingListDto pagingListDto = boardSrvc.list(pagingDto);
				
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
				
			
			mav.setViewName("front/center/board/myPageNotice/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".totalList()] " + e.getMessage(), e);
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/myPageNotice/view.web", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPageNoticeView(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			if (boardDto.getCd_bbs_type() == 1) {
				mav.setViewName("front/center/board/notice/view");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				mav.setViewName("front/center/board/faq/view");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				
				// DB 부하 감소를 위해 답변이 있을 때만
				if (_boardDto.getSeq_reply() > 0) {
					BoardDto boardReplyDto = boardSrvc.selectReply(boardDto);
					mav.addObject("boardReplyDto", boardReplyDto);
				}
				
				mav.setViewName("front/center/board/myPageNotice/view");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				mav.setViewName("front/center/board/news/view");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 마이페이지 고객센터 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/myPageNotice/remove.web", method = RequestMethod.POST)
	public ModelAndView myPageNoticeRemove(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (boardSrvc.deleteFlag(boardDto)) {
				String[] arrName = new String[1];
				String[] arrValue = new String[1];
				
				arrName[0] = "cd_bbs_type";
				arrValue[0] = "3";
				
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/front/center/board/myPageNotice/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
				request.setAttribute("name"		, arrName);
				request.setAttribute("value"	, arrValue);
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 마이페이지 고객센터 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/center/board/myPageNotice/writeForm.web", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myPageNoticeWriteForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			if ("GET".equalsIgnoreCase(request.getMethod())) {
				mav.setViewName("front/center/board/myPageNotice/writeForm");
			}			
			else if ("POST".equalsIgnoreCase(request.getMethod())) {
				if (boardDto.getCd_bbs_type() == 3) {
					
					mav.addObject("boardDto", boardDto);
					
					BoardDto _boardDto = boardSrvc.mySelect(boardDto);
					mav.addObject("boardDtoNm", _boardDto);
					
					mav.setViewName("front/center/board/myPageNotice/writeForm");
				}
				else {
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
			}
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
	 * @return ModelAndView
	 * 
	 * @since 2024-10-16
	 * <p>DESCRIPTION: 마이페이지 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	@RequestMapping(value = "/front/center/board/myPageNotice/writeProc.web", method = RequestMethod.POST)
	public ModelAndView myPageNoticeWriteProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			String contents = boardDto.getContent();
			
			contents = contents.replace("<p>", "").replace("</p>", "");
			
			boardDto.setContent(contents);
			
			boardDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			// **************************
			// For Board File
			// **************************
			
			/*
			if (boardDto.getCd_bbs_type() == 3) {
			
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			} else if (boardDto.getCd_bbs_type() == 1) {
				
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.pathn", "[UNDEFINED]");
			}
			*/
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);
					fileDto[loop].setFileNameSave(fileNameSve);
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));
					
					totalSize += Long.parseLong(fileSize);
				}
				
				
				boardDto.setFile_orig(fileNameSrc);
				boardDto.setFile_save(fileNameSve);
				
				if (boardSrvc.insert(boardDto)) {
					// GET에서 POST로 변경
					String[] arrName = new String[1];
					String[] arrValue = new String[1];
					
					arrName[0] = "cd_bbs_type";
					arrValue[0] = "3";
					
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("post"		, "/front/center/board/myPageNotice/list.web");
					request.setAttribute("name"		, arrName);
					request.setAttribute("value"	, arrValue);
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/");
			}
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/myPageNotice/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView myPageNoticeModifyForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			BoardDto myBoardDto = boardSrvc.mySelect(boardDto);
			mav.addObject("boardDtoNm", myBoardDto);
			
			if (boardDto.getCd_bbs_type() == 3) {
				mav.setViewName("/front/center/board/myPageNotice/modifyForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
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
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/center/board/myPageNotice/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView myPageNoticeModifyProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String contents = boardDto.getContent();
			
			contents = contents.replace("<p>", "").replace("</p>", "");
			
			boardDto.setContent(contents);

			boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (boardSrvc.update(boardDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/center/board/myPageNotice/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
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
}
