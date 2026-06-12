<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	//String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.passwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>
<body>
<div class="container py-4">
	<jsp:include page="../menu.jsp" />
	
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게시판</h1>
        <p class="col-md-8 fs-4">Board</p>      
      </div>
    </div>

	<div class="row align-items-md-stretch   text-center">	 	

		<form name="newWrite" action="./BoardWriteAction.do"  method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control"
				value="${sessionId}">
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=name %>"		placeholder="name">
				</div>
			</div>
			
			
			<!-- ---------------- 비밀번호 부분---------------------- -->
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >비밀번호</label>
				<div class="col-sm-3">
					<input name="passwd" type="password" class="form-control" placeholder="글작성 비밀번호">
				</div>
			</div>
			<!-- --------------------------------------------- -->

			
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">

					<input name="subject" type="text" class="form-control"	placeholder="subject">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control"placeholder="content"></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-primary " value="등록 ">				
				<input type="reset" class="btn btn-primary " value="취소 ">
				</div>
			</div>
			
			<!-- ---------------- 댓글 관련 부분---------------------- -->
			<input name="parent_num" type="hidden" value="${param.parent_num}">
			<input name="re_ref" type="hidden" value="${param.re_ref}">
			<input name="re_lev" type="hidden" value="${param.re_lev}">
			<input name="re_seq" type="hidden" value="${param.re_seq}">
		</form>
		
		
	</div>
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>



