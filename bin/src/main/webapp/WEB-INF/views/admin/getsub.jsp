<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 카테고리 번호 이름  -->
[
<c:forEach var="i" items="${list }" varStatus="status">
	<c:if test="${not status.first }">,</c:if>
	{id:${i.id }, name:'${i.name }'} 
</c:forEach>
]
