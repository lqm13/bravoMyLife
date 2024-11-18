package kr.co.bravomylife.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Datetime {
	
	/*
	public static void main(String[] args) {
		System.out.println("현재 시각은 " + Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
	}
	*/
	
	/**
	 * @param datetimeFormat [날짜/시간 형식]
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 현재 날짜/시각을 지정한 형식(datetimeFormat)의 문자열로 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE: <code>datetimeFormat = "yyyy-MM-dd" or "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd HH:mm:ss SSS"</code></p>
	 */
	public static String getNow(String datetimeFormat) {
		
		Calendar currentDate		= Calendar.getInstance();
		SimpleDateFormat formatter	= new SimpleDateFormat(datetimeFormat);
		
		return formatter.format(currentDate.getTime());
	}

}