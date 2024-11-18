package kr.co.bravomylife.common.interfaces;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.bravomylife.util.net.HttpJson;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class JsonItrf {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(JsonItrf.class);
	
	/**
	 * @param Object(requestSellerInfosDto 등) [요청 빈(Bean)]
	 * @param typeReference [응답 클래스]
	 * @param url [URL]
	 * @return Object(ResponseSellerInfosDto 등)
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: JSON HTTP/S Client(POST) for ResponseDto Bean</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({"rawtypes"})
	public static Object connectPost(Object requestDto, TypeReference typeReference, String url) {
		
		ObjectMapper objectMapper	= new ObjectMapper();
		String requestJSON			= "";
		String responseJSON			= "";
		Object responseDto			= new Object();
		
		try {
			requestJSON		= objectMapper.writeValueAsString(requestDto);
			
			// System.out.println("\n" + "requestJSON: " + requestJSON);
			if (url.startsWith("https")) {
				// HttpsJson httpsJson = new HttpsJson(url);
				// responseJSON		= httpsJson.connectPost(requestJSON, 3000);
			}
			else {
				HttpJson httpJson	= new HttpJson(url);
				responseJSON		= httpJson.connectPost(requestJSON, 3000);
			}
			// System.out.println("\n" + "responseJSON: " + responseJSON + "\n");
			
			responseDto = objectMapper.readValue(responseJSON, typeReference);
		}
		catch (JsonProcessingException e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectPost(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		catch (IOException e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectPost(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		catch (Exception e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectPost(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		finally {}
		
		return responseDto;
	}
	
	/**
	 * @param Object(requestSellerInfosDto 등) [요청 빈(Bean)]
	 * @param typeReference [응답 클래스]
	 * @param url [URL]
	 * @return Object(ResponseSellerInfosDto 등)
	 * 
	 * @since 2024-10-25
	 * <p>DESCRIPTION: JSON HTTP/S Client(POST) for ResponseDto Bean</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({"rawtypes"})
	public static Object connectGet(Object requestDto, TypeReference typeReference, String url) {
		
		ObjectMapper objectMapper	= new ObjectMapper();
		// String requestJSON			= "";
		String responseJSON			= "";
		Object responseDto			= new Object();
		
		try {
			// requestJSON		= objectMapper.writeValueAsString(requestDto);
			
			// System.out.println("\n" + "requestJSON: " + requestJSON);
			if (url.startsWith("https")) {
				// HttpsJson httpsJson = new HttpsJson(url);
				// responseJSON		= httpsJson.connectPost(requestJSON, 3000);
			}
			else {
				HttpJson httpJson	= new HttpJson(url);
				responseJSON		= httpJson.connectGet(3000);
			}
			// System.out.println("\n" + "responseJSON: " + responseJSON + "\n");
			
			responseDto = objectMapper.readValue(responseJSON, typeReference);
		}
		catch (JsonProcessingException e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectGet(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		catch (IOException e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectGet(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		catch (Exception e) {
			logger.error("[kr.co.bravomylife.common.interfaces.JsonItrf.connectGet(requestDto, TypeReference, String)] " + e.getMessage(), e);
		}
		finally {}
		
		return responseDto;
	}
}