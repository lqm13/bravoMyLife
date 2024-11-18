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
 *				: [20241008110249][lcm991224#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.center.controller;



import java.io.File;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.center.dto.BoardDto;
import kr.co.bravomylife.backoffice.center.service.BoardSrvc;
import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.common.component.SessionCmpn;
import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;

import kr.co.bravomylife.common.dto.FileDownloadDto;
import kr.co.bravomylife.common.dto.FileDto;
import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;
import kr.co.bravomylife.util.security.SKwithAES;



/**
 * @version 1.0.0
 * @author lcm991224#gmail.com
 * 
 * @since 2024-10-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.center.controller.BoardWeb")
public class BoardWeb extends Common{
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BoardWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	BoardSrvc boardSrvc;

	/**
	 * @param type
	 * @param sequence
	 * @param model
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 파일 다운로드</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/download.web", method = RequestMethod.POST)
	public ModelAndView download(String type, long sequence, Model model) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto boardDto = new BoardDto();
			
			FileDownloadDto fileDownloadDto = new FileDownloadDto();
			File file = null;
			
			// [TODO-개선: 타입이 정의되어 있지 않을 경우 처리]
			if (type.equals("BbsNotice")) boardDto.setCd_bbs_type(1);
			else if (type.equals("BbsFaq")) boardDto.setCd_bbs_type(2);
			else if (type.equals("BbsQuestion")) boardDto.setCd_bbs_type(3);
			else if (type.equals("BbsNews")) boardDto.setCd_bbs_type(4);
			else if (type.equals("BbsIntroduce")) boardDto.setCd_bbs_type(5);
			else if (type.equals("BbsHealth")) boardDto.setCd_bbs_type(6);
			else if (type.equals("BbsIngred")) boardDto.setCd_bbs_type(7);
			
			boardDto.setSeq_bbs((int)sequence);
			
			boardDto	= boardSrvc.select(boardDto);
			boardDto.setFile_orig(boardDto.getFile_orig());
			boardDto.setFile_save(boardDto.getFile_save());
			
			if (boardDto.getCd_bbs_type() == 1) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_notice", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 2) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_faq", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 3) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 4) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_new", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 5) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_introduce", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 6) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_health", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			else if (boardDto.getCd_bbs_type() == 7) {
				String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_ingred", "[UNDEFINED]");
				file = new File(pathBase + "" + File.separator + boardDto.getFile_save());
				}
			
			
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/remove.web", method = RequestMethod.POST)
	public ModelAndView remove(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (boardSrvc.deleteFlag(boardDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/console/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
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
	 * <p>DESCRIPTION: 고객센터 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			mav.addObject("boardDto", _boardDto);
			
			if (boardDto.getCd_bbs_type() == 1) {
				mav.setViewName("backoffice/center/board/notice/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				mav.setViewName("backoffice/center/board/faq/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				
				BoardDto boardQuestionDto = boardSrvc.selectQuestion(_boardDto);
				mav.addObject("boardQuestionDto", boardQuestionDto);
				mav.setViewName("backoffice/center/board/question/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				mav.setViewName("backoffice/center/board/news/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 5) {
				mav.setViewName("backoffice/center/board/introduce/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 6) {
				mav.setViewName("backoffice/center/board/health/modifyForm");
			}
			else if (boardDto.getCd_bbs_type() == 7) {
				mav.setViewName("backoffice/center/board/ingred/modifyForm");
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
	 * <p>DESCRIPTION: 고객센터 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	@RequestMapping(value = "/console/center/board/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto,FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			String pathBase = null;
			String maxSize = null;
			String allowedExt = null;
			
			if (boardDto.getCd_bbs_type() == 1) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_notice"			, "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_faq"				, "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_news", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			
			else if (boardDto.getCd_bbs_type() == 5) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_introduce", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 5) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_health", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 5) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_ingred", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else {
				request.setAttribute("script"	, "alert('게시판 타입이 이상합니다.');");
			}

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
			
			if (boardSrvc.update(boardDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/console/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (boardDto.getCd_bbs_type() == 1) {
				mav.setViewName("backoffice/center/board/notice/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				mav.setViewName("backoffice/center/board/faq/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				
				BoardDto _boardDto = boardSrvc.select(boardDto);
				
				// 대칭키 암호화(AES-256)
				String staticKey = staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
				SKwithAES aes = new SKwithAES(staticKey);
				
				_boardDto.setMbr_nm(aes.decode(_boardDto.getMbr_nm()));
				
				mav.addObject("boardDto", _boardDto);
				mav.setViewName("backoffice/center/board/question/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				mav.setViewName("backoffice/center/board/news/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 5) {
				mav.setViewName("backoffice/center/board/introduce/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 6) {
				mav.setViewName("backoffice/center/board/health/writeForm");
			}
			else if (boardDto.getCd_bbs_type() == 7) {
				mav.setViewName("backoffice/center/board/ingred/writeForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
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
	 * @param fileUploadDto [파일 업로드 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	@RequestMapping(value = "/console/center/board/writeProc.web", method = RequestMethod.POST)
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			//String contents = boardDto.getContent();
			
			//contents = contents.replaceAll("<\\s*/?\\s*p\\s*>", "");
			//contents = contents.replace("<p>", "").replace("</p>", "");
			//contents = contents.replace("<span>", "").replace("</span>", "");
			boardDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			// **************************
			// For Board File
			// **************************
			String pathBase = null;
			String maxSize = null;
			String allowedExt = null;

			
			if (boardDto.getCd_bbs_type() == 1) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_notice"			, "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 2) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_faq"				, "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 3) {
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_question", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 4) {
				
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_news", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 5) {
				
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_introduce", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 6) {
				
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_health", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else if (boardDto.getCd_bbs_type() == 7) {
				
				pathBase	= dynamicProperties.getMessage("backoffice.upload.path_ingred", "[UNDEFINED]");
				maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
				allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			}
			else {
				request.setAttribute("script"	, "alert('게시판 타입이 이상합니다.');");
			}
			
			// String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			// String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			// String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			
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
				
				/*
				if (totalSize > 0) {
					boardSrvc.insert(boardDto, boardFileDto);
				}
				else {
					boardSrvc.insert(boardDto);
				}
				*/
				
				boardDto.setFile_orig(fileNameSrc);
				boardDto.setFile_save(fileNameSve);
				
				if (boardDto.getCd_bbs_type() == 3) {
					// 답변글(상위 일련번호에 문의글 번호를 저장)
					boardDto.setSeq_bbs_parent(boardDto.getSeq_bbs());
					boardDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
				}
				
				if (boardSrvc.insert(boardDto)) {
					
					if (boardDto.getCd_bbs_type() == 1) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "1";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);
					}
					
					else if (boardDto.getCd_bbs_type() == 2) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "2";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);

					}
					
					else if (boardDto.getCd_bbs_type() == 3) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "3";
						
						request.setAttribute("script"	, "alert('답변했습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);
					}
					
					else if (boardDto.getCd_bbs_type() == 4) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "4";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);

					}
					
					else if (boardDto.getCd_bbs_type() == 5) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "5";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);
					
					}
					
					else if (boardDto.getCd_bbs_type() == 6) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "6";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);
					
					}
					
					else if (boardDto.getCd_bbs_type() == 7) {
						
						String[] arrName = new String[1];
						String[] arrValue = new String[1];
						
						arrName[0] = "cd_bbs_type";
						arrValue[0] = "7";
						
						request.setAttribute("script"	, "alert('등록되었습니다.');");
						request.setAttribute("post"		, "/console/center/board/list.web");
						request.setAttribute("name"		, arrName);
						request.setAttribute("value"	, arrValue);
					
					}
					else {
						request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
						request.setAttribute("redirect"	, "/");
					}
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
	 * <p>DESCRIPTION:고객센터 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/center/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey = staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes = new SKwithAES(staticKey);

			// 페이징 리스트 조회
			PagingListDto pagingListDto = boardSrvc.list(pagingDto);

			// BoardDto 리스트 가져오기
			@SuppressWarnings("unchecked")
			List<BoardDto> list = (List<BoardDto>) pagingListDto.getList();

			for (int loop = 0; loop < list.size(); loop++) {
				BoardDto _boardDto = list.get(loop);

				if (_boardDto != null && _boardDto.getMbr_nm() != null) {
					// mbr_nm 복호화하여 설정
					_boardDto.setMbr_nm(aes.decode(_boardDto.getMbr_nm()));
				}
			}
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			if (pagingDto.getCd_bbs_type() == 1) {
				mav.setViewName("backoffice/center/board/notice/list");
			}
			else if (pagingDto.getCd_bbs_type() == 2) {
				mav.setViewName("backoffice/center/board/faq/list");
			}
			else if (pagingDto.getCd_bbs_type() == 3) {
				mav.setViewName("backoffice/center/board/question/list");
			}
			else if (pagingDto.getCd_bbs_type() == 4) {
				mav.setViewName("backoffice/center/board/news/list");
			}
			else if (pagingDto.getCd_bbs_type() == 5) {
				mav.setViewName("backoffice/center/board/introduce/list");
			}
			else if (pagingDto.getCd_bbs_type() == 6) {
				mav.setViewName("backoffice/center/board/health/list");
			}
			else if (pagingDto.getCd_bbs_type() == 7) {
				mav.setViewName("backoffice/center/board/ingred/list");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
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
	@RequestMapping(value = "/console/center/board/view.web", method = RequestMethod.POST)
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			BoardDto _boardDto = boardSrvc.select(boardDto);
			
			// 조회수 증가 실패 시
			if (_boardDto == null ) {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
			else {
				
				// 대칭키 암호화(AES-256)
				String staticKey = staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
				SKwithAES aes = new SKwithAES(staticKey);
				
				_boardDto.setMbr_nm(aes.decode(_boardDto.getMbr_nm()));
				
				mav.addObject("boardDto", _boardDto);
				
				if (boardDto.getCd_bbs_type() == 1) {
					mav.setViewName("backoffice/center/board/notice/view");
				}
				else if (boardDto.getCd_bbs_type() == 2) {
					mav.setViewName("backoffice/center/board/faq/view");
				}
				else if (boardDto.getCd_bbs_type() == 3) {
					
					// DB 부하 감소를 위해 답변이 있을 때만
					if (_boardDto.getSeq_reply() > 0) {
						BoardDto boardReplyDto = boardSrvc.selectReply(boardDto);
						mav.addObject("boardReplyDto", boardReplyDto);
					}
					
					mav.setViewName("backoffice/center/board/question/view");
				}
				else if (boardDto.getCd_bbs_type() == 4) {
					mav.setViewName("backoffice/center/board/news/view");
				}
				else if (boardDto.getCd_bbs_type() == 5) {
					mav.setViewName("backoffice/center/board/introduce/view");
				}
				else if (boardDto.getCd_bbs_type() == 6) {
					mav.setViewName("backoffice/center/board/health/view");
				}
				else if (boardDto.getCd_bbs_type() == 7) {
					mav.setViewName("backoffice/center/board/ingred/view");
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
}
