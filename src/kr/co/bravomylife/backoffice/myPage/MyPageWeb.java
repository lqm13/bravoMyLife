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
 * File			: MyPageWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241030114228][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.myPage;


import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bravomylife.backoffice.common.Common;
import kr.co.bravomylife.backoffice.buy.service.BuySrvc;
import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.backoffice.manager.service.ManagerSrvc;



/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("kr.co.bravomylife.backoffice.myPage.controller.MyPageWeb")
public class MyPageWeb extends Common{
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MyPageWeb.class);
	

	
	@Inject
	BuySrvc buySrvc;
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	private ManagerSrvc managerSrvc;
	
	@RequestMapping(value = "/console/myPage/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ManagerDto managerDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		
		
		try {
			managerDto.setSeq_mng(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			ManagerDto _managerDto = managerSrvc.select(managerDto);
			
			mav.addObject("managerDto", _managerDto);
			
			mav.setViewName("backoffice/myPage/index");
			}
			catch (Exception e) {
				logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
			}
			finally {}
			
			return mav;
		}

}
