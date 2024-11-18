package kr.co.bravomylife.util.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.bravomylife.util.paging.PagingLoader;
import kr.co.bravomylife.util.property.PropertyLoader;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Config extends HttpServlet {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20110801000000L;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(Config.class);
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @throws ServletException
	 * @throws IOException
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: Get은 Post로 처리</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @throws ServletException
	 * @throws IOException
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: Post 처리</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		init(getServletConfig());
	}
	
	/**
	 * @param config [설정 서블릿]
	 * @throws ServletException [서블릿 예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: web.xml의 Servlet 설정값으로 초기화</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public void init(ServletConfig config) throws ServletException {

		super.init(config);

		try {
			// Log4J
			String log4jFileName = this.getInitParameter("log4j");
			if ((log4jFileName != null) && (log4jFileName.length() > 0)) {
				
				try {
					PropertyConfigurator.configure(getServletContext().getRealPath(log4jFileName));
					logger.info("[" + this.getClass().getName() + ".init()] " + getServletContext().getRealPath(log4jFileName) + " is loaded.");
				}
				catch (Exception e) {
					logger.error("[" + this.getClass().getName() + ".init()] Can't load " + getServletContext().getRealPath(log4jFileName) + ".", e);
					throw new Exception("[" + this.getClass().getName() + ".init()] Can't load " + getServletContext().getRealPath(log4jFileName) + ".");
				}
			}
			
			// Property
			String propertyFileNames = this.getInitParameter("property");
			if ((propertyFileNames != null) && (propertyFileNames.length() > 0)) {
				String[] propertyFileName = propertyFileNames.split(",");
				for (int index = 0; index < propertyFileName.length; index++) {
					propertyFileName[index] = getServletContext().getRealPath(propertyFileName[index].trim());
				}
				PropertyLoader.getInstance().setProperties(propertyFileName);
			}
			
			// Page navigator
			String pageNavigatorFileName = this.getInitParameter("pageNavigator");
			if ((pageNavigatorFileName != null) && (pageNavigatorFileName.length() > 0))
				PagingLoader.getInstance().setPageNavigators(getServletContext().getRealPath(pageNavigatorFileName));
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".init()] " + e.getMessage(), e);
		}
	}
}
