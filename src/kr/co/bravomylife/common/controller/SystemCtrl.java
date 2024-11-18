package kr.co.bravomylife.common.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.dto.SystemErrorDto;
import kr.co.bravomylife.util.Datetime;
import kr.co.bravomylife.util.servlet.Request;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.common.controller.SystemCtrl")
public class SystemCtrl {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SystemCtrl.class);
	
	@Autowired
	Properties staticProperties;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param systemErrorDto [시스템 에러 빈(Bean)]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 시스템 에러 발생 시 로깅 후 에러 페이지로 이동</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.<br>web.xml에 에러 페이지가 설정되어야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/error.web")
	public ModelAndView errorProcWeb(HttpServletRequest request, HttpServletResponse response, SystemErrorDto systemErrorDto) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			if (systemErrorDto.getCode().equals("400")) {
				systemErrorDto.setCode_desc("BAD REQUEST");
			}
			else if (systemErrorDto.getCode().equals("401")) {
				systemErrorDto.setCode_desc("UNAUTHORIZED");
			}
			else if (systemErrorDto.getCode().equals("403")) {
				systemErrorDto.setCode_desc("ACCESS DENITED");
			}
			else if (systemErrorDto.getCode().equals("404")) {
				systemErrorDto.setCode_desc("FILE NOT FOUND");
			}
			else if (systemErrorDto.getCode().equals("405")) {
				systemErrorDto.setCode_desc("METHOD NOT ALLOWED");
			}
			else if (systemErrorDto.getCode().equals("408")) {
				systemErrorDto.setCode_desc("REQUEST TIMEOUT");
			}
			else if (systemErrorDto.getCode().equals("415")) {
				systemErrorDto.setCode_desc("FORMAT NOT SUPPORTE");
			}
			else if (systemErrorDto.getCode().equals("500")) {
				systemErrorDto.setCode_desc("INTERNAL SERVER ERROR");
			}
			else if (systemErrorDto.getCode().equals("503")) {
				systemErrorDto.setCode_desc("SERVICE UNAVAILABLE");
			}
			else if (systemErrorDto.getCode().equalsIgnoreCase("exception")) {
				systemErrorDto.setCode_desc("EXCEPTION");
			}
			else if (systemErrorDto.getCode().equalsIgnoreCase("servletException")) {
				systemErrorDto.setCode_desc("SERVLET EXCEPTION");
			}
			else {
				systemErrorDto.setCode_desc("UNKNOWN");
			}
			
			logger.error("# REGION ***************************" + staticProperties.getProperty("common.logging.system.error", "[UNDEFINED]") + "***************************");
			logger.error("# CODE: " + systemErrorDto.getCode());
			logger.error("# DESC: " + systemErrorDto.getCode_desc());
			logger.error("# IP  : " + Request.getRemoteAddr(request, staticProperties.getProperty("common.server.web", "[UNDEFINED]")));
			logger.error("# TIME: " + Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
			logger.error("# END REGION ***********************" + staticProperties.getProperty("common.logging.system.error", "[UNDEFINED]") + "***************************\n");
			
			mav.setViewName("common/error-web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".errorProcWeb()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 시스템 접근 반려 발생 시 로깅 후 반려 페이지로 이동</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/reject.web")
	public ModelAndView rejectProcWeb(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			// **************************************************************************
			// Mode
			// **************************************************************************
			((HttpServletRequest)request).setAttribute("MODE", staticProperties.getProperty("common.mode", "[UNDEFINED]"));
			
			mav.setViewName("common/reject-web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".rejectProcWeb()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
