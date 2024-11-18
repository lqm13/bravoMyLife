package kr.co.bravomylife.util.tags;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION: 마스킹 태그 유틸리티 클래스</p>
 * <p>IMPORTANT:</p>
 */
public class MaskingTag extends TagSupport {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20170420174900L;
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MaskingTag.class);
	
	/** Masking Count */
	private int count = 0;
	
	/** Masking Letter */
	private String letter = "";
	
	/** Mode */
	private String mode	 = "";
	
	/** Text */
	private String text = "";
	
	
	/**
	 * @throws JspException [JSP 예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 입력 받은 문자열을 원하는 갯수만큼 지정한 문자로 좌측/우측/랜덤하게 치환한다.</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public int doEndTag() throws JspException {
		
		String returnString = "";
		
		try {
			int countValue		= getCount();
			String letterValue	= getLetter();
			String modeValue	= getMode();
			String textValue	= getText();
			
			int textLength = textValue.length();
				
			String letterAll	= "";
			for (int loop = 0; loop < countValue; loop++) {
				letterAll += letterValue;
			}
			
			if (modeValue.equals("left")) {
				if (textLength >= countValue) {
					
					returnString = textValue.substring(countValue, textLength);
					returnString = letterAll + returnString;
				}
				else {
					returnString = letterAll;
				}
			}
			else if (modeValue.equals("right")) {
				if (textLength >= countValue) {
					
					returnString = textValue.substring(0, textLength - countValue);
					returnString = returnString + letterAll;
				}
				else {
					returnString = letterAll;
				}
			}
			else {
				Random random = new Random();
				List<Integer> positionList = new ArrayList<Integer>();
				for (int loop = 0; loop < countValue; loop++) {
					
					if (loop >= textLength)
						break;
					while (true) {
						Integer next = random.nextInt(textLength);
						if (!positionList.contains(next)) {
							positionList.add(next);
							break;
						}
					}
				}
				
				for (int loop = 0; loop < textLength; loop++) {
					if (positionList.contains(loop)) {
						returnString = returnString + letterValue;
					}
					else {
						returnString = returnString + textValue.charAt(loop);
					}
				}
			}
			
			pageContext.getOut().print(returnString);
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".doEndTag()] Error occurred while process 'dotcom:page' tag: " + e.getMessage(), e);
		}
		
		return SKIP_BODY;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLetter() {
		return letter;
	}
	public void setLetter(String letter) {
		this.letter = letter;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
}