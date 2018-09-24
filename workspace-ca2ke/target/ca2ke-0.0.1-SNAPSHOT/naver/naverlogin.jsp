<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<head>
		<title>네이버로그인</title>
	</head>

	<%
		String clientId = "lmCBeDlP2a554rAl3fWq";
		String redirectURI = URLEncoder.encode("http://localhost:8080/ca2ke-0.0.1-SNAPSHOT/callback", "utf-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https:nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
