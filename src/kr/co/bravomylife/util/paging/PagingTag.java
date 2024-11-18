package kr.co.bravomylife.util.paging;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PagingTag extends TagSupport {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20150225000011L;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(PagingTag.class);
	
	/** Style id */
	private String styleID			= "";
	/** Script function */
	private String scriptFunction	= "";
	/** Page */
	private int currentPage		= 0;
	/** Lines per page */
	private int linePerPage		= 0;
	/** Total rows */
	private long totalLine			= 0;
	/** Page url */
	private String pageURL			= "";
	/** Page string */
	private String pageString		= "";
	
	/**
	 * @return int
	 * @throws JspException [JSP 예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 지정한 형태로 페이징 하기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int doStartTag() throws JspException {
		
		try {
			
			String pageNavigator = "";
			
			if (this.scriptFunction.length() > 0) {
				if (this.styleID.length() > 0)
					pageNavigator = PagingHandler.getPageNavigator(this.styleID, this.currentPage, this.linePerPage, this.totalLine, this.scriptFunction);
				else
					pageNavigator = PagingHandler.getPageNavigator(this.currentPage, this.linePerPage, this.totalLine, this.scriptFunction);
				
			}
			else if (this.pageURL.length() > 0) {
				
				if (this.pageString.length() < 1)
					this.pageString = "page";
				
				if (this.styleID.length() > 0)
					pageNavigator = PagingHandler.getPageNavigator(this.styleID, this.currentPage, this.linePerPage, this.totalLine, this.pageURL, this.pageString);
				else
					pageNavigator = PagingHandler.getPageNavigator(this.currentPage, this.linePerPage, this.totalLine, this.pageURL, this.pageString);
				
			}
			pageContext.getOut().print(pageNavigator);
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".doStartTag()] Error occurred while process 'dotcom:page' tag: " + e.getMessage(), e);
			throw new JspException("[" + this.getClass().getName() + ".doStartTag()] Error occurred while process 'dotcom:page' tag: " + e.getMessage());
		}
		
		return SKIP_BODY;
	}
	
	
	public void setStyleID(String styleID) {
		this.styleID = styleID;
	}
	
	public void setScriptFunction(String scriptFunction) {
		this.scriptFunction = scriptFunction;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	
	public void setTotalLine(long totalLine) {
		this.totalLine = totalLine;
	}
	
	public void setPageURL(String pageURL) {
		this.pageURL = pageURL;
	}
	
	public void setPageString(String pageString) {
		this.pageString = pageString;
	}
}
