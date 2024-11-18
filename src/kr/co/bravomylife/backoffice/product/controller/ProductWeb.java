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
 * Program		: com.github.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240930153637][lcm991224@gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.product.controller;

import java.util.Hashtable;
import java.util.LinkedList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.dto.PagingDto;
import kr.co.bravomylife.backoffice.common.dto.PagingListDto;
import kr.co.bravomylife.backoffice.product.dto.ProductDto;
import kr.co.bravomylife.backoffice.product.service.ProductSrvc;
import kr.co.bravomylife.common.dto.FileDto;
import kr.co.bravomylife.common.dto.FileUploadDto;
import kr.co.bravomylife.common.file.FileUpload;

/**
 * @version 1.0.0
 * @author lcm991224@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.product.controller.ProductWeb")
public class ProductWeb {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ProductWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	ProductSrvc productSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 판매 상품 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/console/product/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			productDto.setUpdater(1);
			productDto.setRegister(1);
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_product", "[UNDEFINED]");
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max5MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.image"	, "[UNDEFINED]");
			
			//파일 개수 확인
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();

			//파일 DTO에 배열 생성
			FileDto[] fileDto = new FileDto[countFile];
			//파일 업로드 수행
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);

			//업로드 결과 확인
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");

			//성공적으로 업로드된 경우 처리
			if (message.equals("success")) {
				
				@SuppressWarnings("unchecked")
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				//파일 정보 처리 및 DTO 설정
				
					String fileNameSrc	= "";
					String fileNameSve	= "";
					
					fileNameSrc		= (String)hashtable.get("files[0]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[0]_fileSveNameRelative");
					
					// 백슬래시 제거
					fileNameSve = fileNameSve.replace("\\", "");
					
					fileDto[0] = new FileDto();
					fileDto[0].setFileNameOriginal(fileNameSrc);			// 파일 원본명
					fileDto[0].setFileNameSave(fileNameSve);				// 파일 저장명(경로 포함)
					
					fileNameSrc		= (String)hashtable.get("files[1]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[1]_fileSveNameRelative");
					
					// 백슬래시 제거
					fileNameSve = fileNameSve.replace("\\", "");
					
					fileDto[1] = new FileDto();
					fileDto[1].setFileNameOriginal(fileNameSrc);			// 파일 원본명
					fileDto[1].setFileNameSave(fileNameSve);				// 파일 저장명(경로 포함)
					
					System.out.println("File Save Name: " + fileNameSve);

				// 상품 DTO에 파일 정보 설정
				productDto.setImg(fileDto[0].getFileNameSave()); // 첫 번째 이미지
				productDto.setDesces(fileDto[1].getFileNameSave()); // 두 번째 이미지
				
			
			
				if (productSrvc.update(productDto)) {
					request.setAttribute("script"	, "alert('수정되었습니다.');");
					request.setAttribute("redirect"	, "/console/product/list.web");
				
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
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
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 상품 수정 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			productDto.setRegister(1);
			
			ProductDto _productDto = productSrvc.select(productDto);
			
			mav.addObject("productDto", _productDto);
			mav.setViewName("backoffice/product/modifyForm");
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
	 * @since 2024-10-24
	 * <p>DESCRIPTION: 판매 목록 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/out.web", method = RequestMethod.POST)
	public ModelAndView out(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			productDto.setRegister(1);
			productDto.setUpdater(1);
			
			if (productSrvc.out(productDto)) {
				request.setAttribute("script"	, "alert('품절 되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".out()] " + e.getMessage(), e);
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
	 * @since 2024-10-24
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/re.web", method = RequestMethod.POST)
	public ModelAndView re(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			productDto.setRegister(1);
			productDto.setUpdater(1);
			
			if (productSrvc.re(productDto)) {
				request.setAttribute("script"	, "alert('판매 재개가 되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".re()] " + e.getMessage(), e);
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
	 * @since 2024-10-24
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/stop.web", method = RequestMethod.POST)
	public ModelAndView stop(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			productDto.setRegister(1);
			productDto.setUpdater(1);
			
			if (productSrvc.stop(productDto)) {
				request.setAttribute("script"	, "alert('판매 중지 되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".stop()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-24
	 * <p>DESCRIPTION:상품 등록 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/console/product/view.web", method = RequestMethod.POST)
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			productDto.setRegister(1);
			
			ProductDto _productDto = productSrvc.select(productDto);
			
			mav.addObject("productDto", _productDto);
			mav.setViewName("backoffice/product/view");
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
	 * @since 2024-10-23
	 * <p>DESCRIPTION:상품 리스트 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto, ProductDto productDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			pagingDto.setRegister(1);
			
			PagingListDto pagingListDto = productSrvc.list(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/product/list");
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
	 * @return ModelAndView
	 * 
	 * @since 2024-10-23
	 * <p>DESCRIPTION:상품 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/backoffice/product/productRegProc.web", method = RequestMethod.POST)
	public ModelAndView productRegProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path_product", "[UNDEFINED]");
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max5MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.image"	, "[UNDEFINED]");
			
			//파일 개수 확인
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();

			//파일 DTO에 배열 생성
			FileDto[] fileDto = new FileDto[countFile];
			//파일 업로드 수행
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);

			//업로드 결과 확인
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");

			//성공적으로 업로드된 경우 처리
			if (message.equals("success")) {
				
				@SuppressWarnings("unchecked")
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				//파일 정보 처리 및 DTO 설정
				
				if (countFile == 2) { // 파일 개수가 2개일 경우
					// 첫 번째 파일의 원본 파일명
					
					String fileNameSrc	= "";
					String fileNameSve	= "";
					
					fileNameSrc		= (String)hashtable.get("files[0]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[0]_fileSveNameRelative");
					
					// 백슬래시 제거
					fileNameSve = fileNameSve.replace("\\", "");
					
					fileDto[0] = new FileDto();
					fileDto[0].setFileNameOriginal(fileNameSrc);			// 파일 원본명
					fileDto[0].setFileNameSave(fileNameSve);				// 파일 저장명(경로 포함)
					
					fileNameSrc		= (String)hashtable.get("files[1]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[1]_fileSveNameRelative");
					
					// 백슬래시 제거
					fileNameSve = fileNameSve.replace("\\", "");
					
					fileDto[1] = new FileDto();
					fileDto[1].setFileNameOriginal(fileNameSrc);			// 파일 원본명
					fileDto[1].setFileNameSave(fileNameSve);				// 파일 저장명(경로 포함)
					
					System.out.println("File Save Name: " + fileNameSve);

				// 상품 DTO에 파일 정보 설정
				productDto.setImg(fileDto[0].getFileNameSave()); // 첫 번째 이미지
				productDto.setDesces(fileDto[1].getFileNameSave()); // 두 번째 이미지
				}
				
				
				//상품 DTO에 파일 정보 설정
				
				//상품 등록 처리
				if (productSrvc.insert(productDto)) {
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("redirect"	, "/console/product/productReg.web");
					
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/console/product/productReg.web");
				}
			}
			else{
				request.setAttribute("script"	, "alert('상품이미지를 입력해주세요!');");
				request.setAttribute("redirect"	, "/console/product/productReg.web");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".productRegProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-22
	 * <p>DESCRIPTION:상품 등록 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/console/product/productReg.web")
	public ModelAndView productReg(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/product/productReg");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".productReg()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
