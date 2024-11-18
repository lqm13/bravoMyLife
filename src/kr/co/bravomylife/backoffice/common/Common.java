package kr.co.bravomylife.backoffice.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(Common.class);
	
	protected static String getSession(HttpServletRequest request, String key) {
		
		String value = "";
		
		HttpSession session = request.getSession(false);
		value = (String) session.getAttribute(key);
		
		if (value == null) value = "[UNDEFINED]";
		
		return value;
	}
	
	protected static void printClientIp(HttpServletRequest request) {
		logger.debug(request.getRemoteAddr());
	}
	
	/**
	 * @param object [오브젝트]
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public static void debuggingJSON(Object object) throws Exception {
		
		ObjectMapper objectMapper = new ObjectMapper();
		logger.debug(objectMapper.writeValueAsString(object));
	}
	
}