package kr.co.bravomylife.common.controller;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.common.dto.SystemErrorDto;
import kr.co.bravomylife.util.Datetime;
import kr.co.bravomylife.util.Files;
import kr.co.bravomylife.util.servlet.Request;
/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@ControllerAdvice
public class SystemExceptionCtrl {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SystemExceptionCtrl.class);
	
	@Autowired
	Properties staticProperties;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param exception [예외]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@ExceptionHandler(Exception.class)
	public ModelAndView systemException(HttpServletRequest request, HttpServletResponse response, Exception exception) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			String uri			= request.getRequestURI();
			String extension	= Files.getFileExtention(uri);
			
			SystemErrorDto systemErrorDto = new SystemErrorDto();
			
			if (exception.getMessage().indexOf("No handler found for") == 0) {
				systemErrorDto.setCode("S404");
				systemErrorDto.setCode_desc("FILE NOT FOUND");
			}
			else if (exception.getMessage().indexOf("Request method '") == 0) {
				systemErrorDto.setCode("S405");
				systemErrorDto.setCode_desc("METHOD NOT ALLOWED");
			}
			else {
				systemErrorDto.setCode("???");
				systemErrorDto.setCode_desc("UNKNOWN");
			}
			
			if (extension == null || extension.equals("")) {
				systemErrorDto.setCode("S404");
				systemErrorDto.setCode_desc("FILE NOT FOUND");
			}
			
			mav.addObject("systemErrorDto", systemErrorDto);
			
			if (extension.equals("api"))		mav.setViewName("common/error-api");
			else if (extension.equals("json"))	mav.setViewName("common/error-json");
			else								mav.setViewName("common/error-web");
			
			logger.error("# REGION ***************************" + staticProperties.getProperty("common.logging.system.exception", "[UNDEFINED]") + "***************************");
			logger.error("# MESSAGE  : " + exception.getMessage());
			logger.error("# URL      : " + Request.getFullURL(request));
			logger.error("# IP       : " + Request.getRemoteAddr(request, staticProperties.getProperty("common.server.web", "[UNDEFINED]")));
			logger.error("# TIME     : " + Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
			logger.error("# END REGION ***********************" + staticProperties.getProperty("common.logging.system.exception", "[UNDEFINED]") + "***************************\n");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".systemException()] " + e.getMessage(), e);
		}
		
		return mav;
	}
}
