<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function formValid() {
		if (!document.updateMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.updateMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.updateMember.password.value != document.updateMember.passwordCheck.value) {
			alert("비밀번호를 다시 확인하세요");
			return false;
		}
	}
</script>	
<title>회원 수정</title>
</head>
<body>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BookMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>


<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 수정</h1>
        <%
			String error = request.getParameter("error");
      		if (error!=null && error.equals("1")){
      	%>
        <p class="col-md-8 fs-4 text-danger">회원수정오류! 다시확인해주세요.</p>      
      	<%
      		}else if(error!=null && error.equals("2")){		
      	%>
      	<p class="col-md-8 fs-4 text-danger">회원탈퇴오류! 다시확인해주세요.</p>
      	<%
      		}else{		
      	%>
      	<p class="col-md-8 fs-4">Membership Updating</p>
      	<%}%>
      </div>
    </div>
    
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="email" value="${row.mail}" />
	<c:set var="email_front" value="${email.split('@')[0]}" />
	<c:set var="email_back" value="${email.split('@')[1]}" />

	<c:set var="birth" value="${row.birth }" />
	<c:set var="b_year" value="${birth.split('\\\.')[0]}" />
	<c:set var="b_month" value="${birth.split('\\\.')[1]}" />
	<c:set var="b_day" value="${birth.split('\\\.')[2]}" />

	<div class="container">
		<form name="updateMember"action="processUpdateMember.jsp" method="post" onsubmit="return formValid()">
				<div class="mb-3 row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" value="<c:out value='${row.id }'/>" readonly>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" value="<c:out value='${row.password }'/>" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="passwordCheck" type="text" class="form-control">
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<c:out value='${row.name }'/>" >
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<c:set var="gender" value="${row.gender }" />
					<input name="gender" type="radio" value="남"	<c:if test="${gender.equals('남')}"> <c:out value="checked" /> </c:if> >남 
					<input name="gender" type="radio" value="여"	<c:if test="${gender.equals('여')}"> <c:out value="checked" /> </c:if> >여
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-10  ">
				  <div class="row">
					<div class="col-sm-2">
					<input type="text" name="b_year"  maxlength="4"  class="form-control" size="6" value="${b_year}"> 
					</div>년
					<div class="col-sm-2">
						<select name="b_month" id="b_month" class="form-select">
						    <option value="01" ${b_month == '01' ? 'selected' : ''}>1</option>
						    <option value="02" ${b_month == '02' ? 'selected' : ''}>2</option>
						    <option value="03" ${b_month == '03' ? 'selected' : ''}>3</option>
						    <option value="04" ${b_month == '04' ? 'selected' : ''}>4</option>
						    <option value="05" ${b_month == '05' ? 'selected' : ''}>5</option>
						    <option value="06" ${b_month == '06' ? 'selected' : ''}>6</option>
						    <option value="07" ${b_month == '07' ? 'selected' : ''}>7</option>
						    <option value="08" ${b_month == '08' ? 'selected' : ''}>8</option>
						    <option value="09" ${b_month == '09' ? 'selected' : ''}>9</option>
						    <option value="10" ${b_month == '10' ? 'selected' : ''}>10</option>
						    <option value="11" ${b_month == '11' ? 'selected' : ''}>11</option>
						    <option value="12" ${b_month == '12' ? 'selected' : ''}>12</option>
						</select>
					</div>월
					<div class="col-sm-2">
						<input type="text" name="b_day" maxlength="2" class="form-control" size="4" value="${b_day}">
					</div>일
				</div>
			
			</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<div class="row">
				  	<div class="col-sm-4">
						<input type="text" name="email_front" maxlength="50" value="${email_front}" class="form-control">
					</div>@
					<div class="col-sm-3" >
						<select name="email_back" id="email_back" class="form-select">
						    <option value="naver.com" ${email_back == 'naver.com' ? 'selected' : ''}>naver.com</option>
						    <option value="daum.net" ${email_back == 'daum.net' ? 'selected' : ''}>daum.net</option>
						    <option value="gmail.com" ${email_back == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
						    <option value="nate.com" ${email_back == 'nate.com' ? 'selected' : ''}>nate.com</option>
						</select>
					</div>
					</div>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" value="<c:out value='${row.phone}'/>">
				</div>
			</div>

				<div class="mb-3 row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" value="<c:out value='${row.address}'/>">
				</div>
			</div>
				<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-success" value="회원수정 "> 
					<a href="deleteMember.jsp" class="btn btn-danger" onclick="return confirm('정말 회원 탈퇴를 진행하시겠습니까?');">회원탈퇴</a>
				</div>
			</div>
		</form>	
	</div>
	</c:forEach>
		   <jsp:include page="/footer.jsp" />  
  </div>	
</body>
</html>
