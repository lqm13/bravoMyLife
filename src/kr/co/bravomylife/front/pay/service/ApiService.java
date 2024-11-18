package kr.co.bravomylife.front.pay.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class ApiService {

	
	@SuppressWarnings("unchecked")
	public Map<String,Object> JsonApi(String url, Map<String,String> map) {
		
		Map<String,Object> returnMap = new HashMap<>();
		
		OkHttpClient client = new OkHttpClient();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonBody = "";
		try {
			
			jsonBody = objectMapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		MediaType JSON = MediaType.get("application/json; charset=utf-8");
		RequestBody requestBody = RequestBody.create(jsonBody, JSON);
		
		Request request = new Request.Builder()
				.url(url)
				.post(requestBody)
				.build();
		
		try {
			
			Response response = client.newCall(request).execute();
			
			returnMap = objectMapper.readValue(response.body().string(), Map.class);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> JsonApi(String url, Map<String,String> map,String Authorization) {
		
		Map<String,Object> returnMap = new HashMap<>();
		
		OkHttpClient client = new OkHttpClient();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonBody = "";
		
		try {
			
			jsonBody = objectMapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			
			e.printStackTrace();
		}
		
		MediaType JSON = MediaType.get("application/json; charset=utf-8");
		RequestBody requestBody = RequestBody.create(jsonBody, JSON);
		
		Request request = new Request.Builder()
				.url(url)
				.addHeader("Authorization", Authorization)
				.post(requestBody)
				.build();
		
		try {
			
			Response response = client.newCall(request).execute();
			
			returnMap = objectMapper.readValue(response.body().string(), Map.class);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnMap;
	}
	
	public String getSHA256Hash(String input) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		
		byte[] bytes = md.digest(input.getBytes(StandardCharsets.UTF_8));
		
		StringBuilder hexStringBuilder = new StringBuilder();
		
		for (byte b : bytes) {
			
			String hex = String.format("%02x", b);
			hexStringBuilder.append(hex);
		}
		return hexStringBuilder.toString();
	}
}