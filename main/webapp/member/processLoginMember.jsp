<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BookMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   	SELECT * FROM MEMBER WHERE ID=? and password=?  
   	<sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:choose>
	<c:when test="${resultSet.rowCount > 0}">
		<c:set var="sessionId" value="${param.id}" scope="session" />
		<c:redirect url="resultMember.jsp?msg=1" />
	</c:when>
	<c:otherwise>
		<c:redirect url="loginMember.jsp?error=1" />
	</c:otherwise>
</c:choose>
