<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
[
<c:forEach var="r" items="${list}" varStatus="status">
<c:if test="${not status.first }">,</c:if>
{num:${r.num }, repro_num:${r.repro_num }, repro_content:'${r.repro_content }', repro_writer_id:'${r.repro_writer_id }'}
</c:forEach>
]
