<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
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
		
		<!-- 수정 폼 -->
		<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"  method="post">
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value=" <%=notice.getName()%>">
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value=" <%=notice.getSubject()%>" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getContent()%></textarea>
				</div>
			</div>
			<input name="passwd" type="hidden" id="updatePw">
		</form>

		<!-- 삭제 폼 -->		
		<form name="deleteForm" action="./BoardDeleteAction.do" method="post">
		    <input type="hidden" name="num" value="<%=notice.getNum()%>">
		    <input type="hidden" name="pageNum" value="<%=nowpage%>">
		    <input type="hidden" name="passwd" id="deletePw">
		</form>
		
		<!-- 수정,삭제,목록 -->
		<div class="mb-3 row">
			<div class="col-sm-offset-2 col-sm-10 ">
				<c:set var="userId" value="<%=notice.getId()%>" />
				<c:if test="${sessionId==userId || sessionId=='admin1'}">
					<p>
						<input type="button" class="btn btn-danger" value="삭제"  onclick="confirmDelete()">
						<input type="button" class="btn btn-success" value="수정"  onclick="confirmUpdate()">
				</c:if>
				
				<a href="./BoardListAction.do?pageNum=<%=nowpage%>"		class="btn btn-primary"> 목록</a>
				
				<c:if test="${not empty sessionId}">
				    <a href="./BoardWriteForm.do?id=${sessionId}&parent_num=<%=notice.getNum()%>&re_ref=<%=notice.getRe_ref()%>&re_lev=<%=notice.getRe_lev()%>&re_seq=<%=notice.getRe_seq()%>"
				       class="btn btn-secondary">댓글</a>
				</c:if>
			</div>
		</div>
		
	</div>
	<jsp:include page="../footer.jsp" />
</div>

<script>	
	<c:if test="${not empty errorMsg}">
		alert("${errorMsg}");
	</c:if>
	
	function confirmDelete() {
	    const passwd = prompt("비밀번호를 입력하세요.");
	    if (passwd === null) return;
	    document.getElementById('deletePw').value = passwd;
	    document.deleteForm.submit();
	}
	
	function confirmUpdate() {
	    const passwd = prompt("비밀번호를 입력하세요.");
	    if (passwd === null) return;
	   	document.getElementById('updatePw').value = passwd;
	    document.newUpdate.submit();
	}
</script>
</body>
</html>


