<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");

	if(sessionId==null || !sessionId.equals("admin1")){
		response.sendRedirect("noAccessRight.jsp");
		return;
	}
	
	String deleteId = request.getParameter("deleteId");
	if(deleteId == null || deleteId.trim().equals("")){
		response.sendRedirect("memberList.jsp?msg=noDID");
		return;
	}
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BookMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=deleteId%>" />
</sql:update>

<c:choose>
	<c:when test="${resultSet>=1}">
		<c:if test="${sessionId == param.deleteId}">
			<c:set var="sessionId" value="" scope="session" />
		</c:if>
		<c:redirect url="memberList.jsp?msg=1" />
	</c:when>
	<c:otherwise>
		<c:redirect url="memberList.jsp?error=1" />
	</c:otherwise>
</c:choose>
