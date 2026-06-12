<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 목록</title>
</head>
<body>
<%
	String sessionId = (String) session.getAttribute("sessionId");

	if(sessionId==null || !sessionId.equals("admin1")){
		response.sendRedirect("noAccessRight.jsp");
		return;
	}
%>
<div class="container py-4">
   <jsp:include page="/menu.jsp" />   	
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 목록</h1>
        <%
	        String error = request.getParameter("error");
        	String msg = request.getParameter("msg");
    	
  			if (msg!=null && msg.equals("0")){
        %>
        	<p class="col-md-8 fs-4 text-success">회원정보가 수정되었습니다!</p>      
      	<% }else if(msg!=null && msg.equals("1")){%>
      		<p class="col-md-8 fs-4 text-danger">회원정보가 삭제되었습니다!</p>  
    	<% }else if(error!=null && error.equals("1")){%>
    		<p class="col-md-8 fs-4 text-danger">회원삭제 오류! 다시확인하세요.</p>   
      	<% }else {%>
      		<p class="col-md-8 fs-4">관리자 페이지</p>
      	<% }%>
      </div>
    </div>
    
    <sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BookMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
	<sql:query dataSource="${dataSource}" var="resultSet">
	   SELECT id, name, mail, regist_day, address FROM MEMBER
	</sql:query>
	    
   <div class="row align-items-md-stretch text-center">
   	<div style="padding-top: 50px">
	<table class="table table-hover">
		<tr>
			<th width="100">아이디</th>
			<th width="100">이름</th>
			<th width="100">이메일</th>
			<th width="100">가입일</th>
			<th width="100">주소</th>
			<th width="100">회원정보 수정</th>
		</tr>
		
		<c:forEach var="row" items="${resultSet.rowsByIndex}">
		<tr>
			<c:forEach var="column" items="${row}" varStatus="i">
				<td>
					<c:if test="${column!=null }">
						<c:out value="${column }"/>
					</c:if>
					<c:if test="${column==null }">
						&nbsp;
					</c:if>
				</td>
			</c:forEach>
			<td>
				<div class="d-flex gap-2">
					<form action="updateMember.jsp" method="post">
						<input type="hidden" name="updateId" value="${row[0]}">
						<input type="submit" value="수정" class="btn btn-primary">
					</form>
					<form action="deleteMember.jsp" method="post" 
						onsubmit="return confirm('정말 이 회원을 삭제시키겠습니까?');">
						<input type="hidden" name="deleteId" value="${row[0]}">
						<input type="submit" value="삭제" class="btn btn-danger">
					</form>
				</div>
			</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	</div>
   <jsp:include page="/footer.jsp" />	
</div>	
</body>
</html>
	
	