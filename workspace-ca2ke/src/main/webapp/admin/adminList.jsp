<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="noindex,nofollow"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="apple-mobile-web-app-capable" content="no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<title>Insert title here</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="<?php echo $g['path_core']?>css/topmenu.css" />
<link rel="stylesheet" href="<?php echo $g['path_core']?>css/vertical-menu.css" />
<style type="text/css">
#subjectA:link { color:black; text-decoration: none; }
#subjectA:visited { color:black; text-decoration: none; }
#subjectA:hover { color:green; text-decoration: underline; }
#subjectA:achive { color:black; text-decoration: none; }

#currentPaging { color: red;  text-decoration: underline; }
#paging { color: blue;	text-decoration: none; }
</style>
</head>
<body>
<div class='searchbox'>
    <form name="membersearch" class="form-inline" action="">
        <input type="hidden" name="orderby"  />
        <select name="where" class="form-control input-sm">
            <option value="unify">통합</option>
            <option value="userNM">이름</option>
            <option value="userID">아이디</option>
            <option value="mobileNO">휴대폰</option>
        </select>
        <div class="input-group input-group-sm">
            <input type="text" name="keyword" value="" class="form-control input-search" placeholder="검색어">
            <span class="input-group-btn">
                <button type="button" class="btn btn-default" onclick="this.form.where.value='userNM';this.form.keyword.value='',this.form.submit();" title="리셋"><i class="glyphicon glyphicon-repeat"></i></button>
                <button type="submit" class="btn btn-info" title="검색"><i class="glyphicon glyphicon-search"></i></button>
            </span>
        </div>
    </form>
</div>
<table id="membertable" class="table table-bordred -table-striped table-hover">
   <thead>
	<tr  scope="row">
		<th width="70">회원번호</th>
		<th width="200">회원이름</th>
		<th width="100">회원아이디</th>
		<th width="100">회원연락처</th>
		<th width="70">회원이메일</th> 
		<th width="70">가입날짜</th> 
	</tr>
	  </thead>
   <tbody>
<c:forEach var="memberDTO" items="${list}">
	<tr scope="row" >
		<td align="center" scope="row">${memberDTO.m_num}</td>
		<td align="center" scope="row"><a id="subjectA" href="#" onclick="isLogin(${memberDTO.m_name})"> 
			${memberDTO.m_name}</a></td>
		<td align="center" scope="row">${memberDTO.m_id}</td>
		<td align="center" scope="row">${memberDTO.m_phone}</td>
		<td align="center" scope="row">${memberDTO.m_email}</td>
		<td align="center" scope="row">${memberDTO.m_logtime}</td>
	</tr>
</c:forEach>	
	<!-- 페이징 -->
	<tr scope="row" align="center" >
		<td colspan="6" align="center"  scope="row">
		<c:if test="${startPage > 3 }">
			[<a id="paging" href="adminList?pg=${startPage-1}">이전</a>]
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${i==pg }">
				[<a id="currentPaging" href="adminList?pg=${i}" >${i}</a>]
			</c:if>
			
			<c:if test="${i!=pg }">
				[<a id="paging" href="adminList?pg=${i}" >${i}</a>]
			</c:if>
		</c:forEach>	
		
		<c:if test="${endPage < totalP}">
			[<a id="paging" href="adminList?pg=${endPage+1}">다음</a>]
		</c:if>		
		</td>
	</tr>
</tbody>
</table>
</body>
</html>