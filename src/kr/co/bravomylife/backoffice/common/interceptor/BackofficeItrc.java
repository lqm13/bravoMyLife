package kr.co.bravomylife.backoffice.common.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.bravomylife.backoffice.common.component.SessionCmpn;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BackofficeItrc extends HandlerInterceptorAdapter {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BackofficeItrc .class);
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param handler [핸들러]
	 * @throws IOException [IO 예외]
	 * @throws ServletException [서블릿 예외]
	 * @return boolean
	 * 
	 * @since 2024-10-01
	 * <p>DESCRIPTION: 컨트롤러 접근 전에 가로채기 위해 preHandle 오버라이드</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException, ServletException {
		
		try {
			if (!sessionCmpn.isSession(request)) {
				// response.sendRedirect(request.getContextPath() + "/reject.web");
				response.sendRedirect(request.getContextPath() + "/backoffice/login/main.web?url=" + request.getRequestURI());
				return false;
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".preHandle()] " + e.getMessage(), e);
		}
		
		return true;
	}
}
