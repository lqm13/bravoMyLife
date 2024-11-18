package kr.co.bravomylife.backoffice.common.component;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.bravomylife.util.Datetime;
import kr.co.bravomylife.util.servlet.Request;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Component("kr.co.bravomylife.backoffice.common.component.SessionCmpn")
public class SessionCmpn {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SessionCmpn.class);
	
	@Autowired
	private Properties staticProperties;
	
	/**
	 * @param request [요청 서블릿]
	 * @return boolean
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public boolean isSession(HttpServletRequest request) {
		
		boolean isExist = true;
		
		String fullURL = Request.getFullURL(request);
		
		try {
			String seq_user		= Request.getSession(request, "SEQ_MBR", "", false);
			String dt_login		= Request.getSession(request, "DT_LOGIN", "", false);
			String ip			= Request.getRemoteAddr(request, staticProperties.getProperty("common.server.web", "[UNDEFINED]"));
			
			String prefixSession = staticProperties.getProperty("backoffice.logging.session", "[UNDEFINED]");
			
			if (seq_user == null || seq_user.equals("")
					|| dt_login == null || dt_login.equals("")) {
				
				logger.error("# REGION ***************************" + prefixSession + "***************************");
				logger.error("# DENY DESC: SESSION DOES NOT EXIST");
				logger.error("# IP       : " + ip);
				logger.error("# URL      : " + fullURL);
				logger.error("# TIME     : " + Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
				logger.error("# END REGION ***********************" + prefixSession + "***************************\n");
				
				isExist = false;
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".isSession()] " + e.getMessage(), e);
		}
		
		return isExist;
	}
}
