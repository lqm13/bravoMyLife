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
 * File			: MemberSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021111014][alstjsrla28#gmail.com][CREATE: Initial Release]
 */
package kr.co.bravomylife.backoffice.manager.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.bravomylife.backoffice.manager.dto.ManagerDto;
import kr.co.bravomylife.backoffice.manager.dao.ManagerDao;

/**
 * @version 1.0.0
 * @author alstjsrla28#gmail.com
 * 
 * @since 2024-10-21
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.bravomylife.backoffice.manager.service.ManagerSrvc")
public class ManagerSrvc {
	
	@Inject
	ManagerDao managerDao;
	
	
	@Transactional("txFront")
	public boolean updateMyPasswd(ManagerDto managerDto) {
		
		int result = managerDao.updateMyPasswd(managerDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
public ManagerDto selectMyPasswd(ManagerDto managerDto) {
	return managerDao.selectMyPasswd(managerDto);
}
	
	@Transactional("txFront")
	public boolean update(ManagerDto managerDto) {
				
		if (managerDao.update(managerDto) == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	public int selectDuplicate(ManagerDto managerDto) {
		return managerDao.selectDuplicate(managerDto);
	}

	@Transactional("txBackoffice")
	public boolean insert(ManagerDto managerDto) {
		
		managerDto.setSeq_mng(managerDao.sequence());
		managerDto.setRegister(managerDto.getSeq_mng());
		
		int result = managerDao.insert(managerDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public ManagerDto select(ManagerDto managerDto) {
		return managerDao.select(managerDto);
	}


}
