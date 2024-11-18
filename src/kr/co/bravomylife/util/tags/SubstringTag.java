package kr.co.bravomylife.util.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION: 서브스트링 태그 유틸리티 클래스</p>
 * <p>IMPORTANT:</p>
 */
public class SubstringTag extends TagSupport {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20150225000004L;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SubstringTag.class);

	private String text = "";
	private int length;
	
	/**
	 * @throws JspException [JSP 예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: End Tag 처리</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public int doEndTag() throws JspException {
		
		String returnString = "";
		
		try {
			String value	= getText();
			int size		= getLength();
			
			int byteLen = 0;
			int len = value.length();
			int blen = value.getBytes().length;
			
			if (blen <= size) {
				returnString = value;
			}
			else {
				for (int i = 0; i < len; i++) {
					String temp = value.charAt(i) + "";
					byteLen += temp.getBytes().length;
					
					if (byteLen <= size) {
						returnString = returnString + temp;
					}
					else {
						returnString += "...";
						break;
					}
				}
			}
			
			pageContext.getOut().print(returnString);
			
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".doEndTag()] Error occurred while process 'dotcom:page' tag: " + e.getMessage(), e);
		}
		
		return SKIP_BODY;
	}
	
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}