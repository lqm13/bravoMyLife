package kr.co.bravomylife.util.net;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class HttpJson {
	
	/** URL */
	private URL url = null;
	
	/**
	 * @param url [요청할 경로]
	 * @throws MalformedURLException 
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: HTTP Client 유틸리티 클래스 생성자</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public HttpJson(String url) throws MalformedURLException {
		this.url = new URL(url);
	}
	
	/**
	 * @param timeout [타임아웃(초)]
	 * @return String
	 * @throws IOException 
	 * @since 2017-07-28
	 * <p>DESCRIPTION: 특정 URL로 요청(GET 방식)하고 텍스트로 응답</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public String connectGet(int timeout) throws IOException {
		
		String response = "";
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		/*
		System.out.println("-------------------------");
		System.out.println(url);
		System.out.println("-------------------------");
		*/
		
		conn.setConnectTimeout(timeout);
		conn.setReadTimeout(timeout);
		
		conn.setRequestMethod("GET");
		
		conn.setRequestProperty("accept", "*/*");
		conn.setDoInput(true);
		/* Only POST
		conn.setDoOutput(true);
		
		OutputStream os = conn.getOutputStream();
		os.write(requestJSON.getBytes("UTF-8"));
		os.flush();
		os.close();
		*/
		
		if (conn.getResponseCode() != 200) {
			/** 필요 시 에러 상세는 별도 확인할 것 */
			throw new RuntimeException("HTTP Error Code: " + conn.getResponseCode());
		}
		
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream()), "UTF-8"));
		
		String line = "";
		while ((line = br.readLine()) != null) {
			response += line;
		}
		
		br.close();
		conn.disconnect();
		
		return response;
	}
	
	/**
	 * @param requestJSON [요청 JSON]
	 * @param timeout [타임아웃(초단위)]
	 * @return String
	 * @throws IOException 
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: JSON 문자열(requestJSON)로 요청(POST 방식)하여 문자열로 응답 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.<br>타임아웃(timeout) 값을 지정할 수 있다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public String connectPost(String requestJSON, int timeout) throws IOException {
	
		String responseJSON = "";
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setConnectTimeout(timeout);
		conn.setReadTimeout(timeout);
		
		conn.setRequestMethod("POST");
		conn.setRequestProperty("content-type", "application/json; charset=UTF-8");
		conn.setRequestProperty("accept", "application/json");
		conn.setDoInput(true);
		conn.setDoOutput(true);
		
		OutputStream os	= conn.getOutputStream();
		os.write(requestJSON.getBytes("UTF-8"));
		os.flush();
		os.close();
		
		if (conn.getResponseCode() != 200) {
			/** 필요 시 에러 상세는 별도 확인할 것 */
			throw new RuntimeException("HTTP Error Code: " + conn.getResponseCode());
		}
		
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream()), "UTF-8"));
		
		String line = "";
		while ((line = br.readLine()) != null) {
			responseJSON += line;
		}
		
		br.close();
		conn.disconnect();
		
		return responseJSON;
	}
}
