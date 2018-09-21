package member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.bean.MemberDTO;

public class KakaoLogin {
	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		
		
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "932d24d1f08eed4c99715e58f3028cbc"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http%3A%2F%2Flocalhost%3A8080%2Fca2ke%2Fmember%2FkakaoLogin"));
		postParams.add(new BasicNameValuePair("code", autorize_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post  = new HttpPost(RequestUrl);
		JsonNode returnNode =null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL :" + RequestUrl);
			System.out.println("Post parameters :" + postParams);
			System.out.println("Response Code : " + responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return returnNode;
	}
	
	public static JsonNode getKakaoMemberInfo(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v1/uset/me";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		post.addHeader("Authorization", "Bearer" + autorize_code);
		
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL :" + RequestUrl);
			System.out.println("Response Code : " + responseCode);
			
			ObjectMapper mapper =  new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnNode;
	}
	
	public static MemberDTO changeData(JsonNode userInfo) {
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setM_id(userInfo.path("id").asText());
		
		if(userInfo.path("kaccount_email_verified").asText().equals("true")) {
			memberDTO.setM_email(userInfo.path("kaccount_email").asText());
		}else {
			System.out.println("이메일거부");
		}
		
		JsonNode properties = userInfo.path("properties");
		if(properties.has("nickname"))
			memberDTO.setM_name(properties.path("nickname").asText());
		return memberDTO;
	}
	
}
