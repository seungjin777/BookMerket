<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("b_year");
	String month = request.getParameter("b_month");
	String day = request.getParameter("b_day");
	String birth = year + "." + month + "." + day;
	String mail = request.getParameter("email_front") + "@" + request.getParameter("email_back");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/BookMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource }" var="resultSet">
	update member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=? where id=?
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=id%>" />
</sql:update>

<c:choose>
	<c:when test="${resultSet>=1}">
		<c:redirect url="memberList.jsp?msg=0" />
	</c:when>
	<c:otherwise>
		<c:redirect url="updateMember.jsp?error=0" />
	</c:otherwise>
</c:choose>