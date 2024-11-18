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
 * File			: PasswdWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241031172439][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.manager.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.manager.controller.PasswdWeb;
import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.backoffice.manager.service.ManagerSrvc;


/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-31
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.manager.controller.PasswdWeb")
public class PasswdWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(PasswdWeb.class);

	
	@Inject
	ManagerSrvc managerSrvc;
	
	
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
	@RequestMapping(value = "/console/manager/passwd/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/manager/passwd/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/manager/passwd/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto, String confirmPasswd) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			managerDto.setSeq_mng(Integer.parseInt(getSession(request, "SEQ_MNG")));
			//managerDto.setPasswd(getSession(request, "PASSWD"));
			
			
			String passwd_ =(managerDto.getPasswd());
			
			// 암호화된 비밀번호
			String passwd = managerSrvc.selectMyPasswd(managerDto).getPasswd();
			if (passwd_.equals(passwd)) {
				
				
				managerDto.setPasswd(confirmPasswd);
				
				
				if (managerSrvc.updateMyPasswd(managerDto)){
					request.setAttribute("script"	, "alert('비밀번호가 수정되었습니다.');");
					request.setAttribute("redirect"	, "/console/myPage/index.web");
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('현재 비밀번호가 틀립니다!');");
				request.setAttribute("redirect"	, "/console/manager/passwd/modifyForm.web");
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



