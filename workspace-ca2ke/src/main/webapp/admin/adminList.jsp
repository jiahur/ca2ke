<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/memberList.css">
</head>
<body>
<div class='searchbox'>
    <form name="membersearchf" class="form-inline" action="">
        <input type="hidden" name="orderby" value="<?php echo $xorderby;?>" />
        <select name="where" class="form-control input-sm">
            <option value="unify">통합</option>
            <option value="m_name">이름</option>
            <option value="m_id">아이디</option>
        </select>
        <div class="input-group input-group-sm">
            <input type="text" name="keyword" value="" class="form-control input-search" placeholder="검색어">
            <span class="input-group-btn">
                <button type="reset" class="btn btn-default" title="리셋"><i class="glyphicon glyphicon-repeat"></i></button>
                <button type="button" class="btn btn-info" title="검색" onclick=""><i class="glyphicon glyphicon-search"></i></button>
            </span>
        </div>
    </form>
</div>

<table id="membertable" class="table table-bordred table-striped table-hover">
   <thead>
        <th align="center" width="50"><strong>회원번호</strong></th>
        <th align="center"><strong>회원이름</strong></th>
        <th align="center"><strong>회원아이디</strong></th>
        <th align="center"><strong>회원연락처</strong></th>
        <th align="center"><strong>회원이메일</strong></th>
        <th align="center"><strong>가입날짜</strong></th>      
   </thead>
   <tbody>
<c:forEach var="memberDTO" items="${list}">
<tr id="<?php echo $R['idx']; ?>">
		<td align="center" scope="row">${memberDTO.m_num}</td>
		<td align="center" scope="row"><a id="subjectA" href="#" onclick="isLogin(${memberDTO.m_name})"> 
			${memberDTO.m_name}</a></td>
		<td align="center" scope="row">${memberDTO.m_id}</td>
		<td align="center" scope="row">${memberDTO.m_phone}</td>
		<td align="center" scope="row">${memberDTO.m_email}</td>
		<td align="center" scope="row">${memberDTO.m_logtime}</td>
</tr>
</c:forEach>
</tbody>
</table>
<div class="pull-right info">
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
</div>

</body>
</html>