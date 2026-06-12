<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel ="stylesheet" href ="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function formValid() {
		if (!document.addMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.addMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.addMember.password.value != document.addMember.passwordCheck.value) {
			alert("비밀번호를 다시 확인하세요");
			return false;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container py-4">
	<jsp:include page="/menu.jsp" />

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 가입</h1>
        <%
			String error = request.getParameter("error");
      		if (error!=null && error.equals("1")){
      	%>
        <p class="col-md-8 fs-4 text-danger">회원등록오류! 다시확인해주세요.</p>      
      	<%
      		}else{		
      	%>
      	<p class="col-md-8 fs-4">Membership Joining</p>
      	<%}%>
      </div>     
    </div>

	<div class="row align-items-md-stretch">
		<form action="processAddMember.jsp" name="addMember" method="post" onsubmit="return formValid()">
			<div class="mb-3 row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control">
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
					<input name="name" type="text" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-2">
					<input name="gender" type="radio" value="남" /> 남 
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-10  ">
				  <div class="row">
				  	<div class="col-sm-2">
						<input type="text" name="b_year" maxlength="4"  class="form-control" size="6">
					</div>년
					<div class="col-sm-2">
					<select name="b_month" class="form-select">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					</div>월
					<div class="col-sm-2">
					<input type="text" name="b_day" maxlength="2" class="form-control" size="4">
					</div>일
				</div>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
					  <div class="row">
						<div class="col-sm-4">
							<input type="text" name="email_front" maxlength="30" class="form-control">
						</div> @
						<div class="col-sm-3">
							 <select name="email_back" class="form-select">
								<option>naver.com</option>
								<option>gmail.com</option>
								<option>daum.net</option>
								<option>hansung.ac.kr</option>
							</select>
						</div>
					</div>		
				</div>		
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" >

				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control">

				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-success " value="회원가입 " > 
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</div>
</body>
</html>