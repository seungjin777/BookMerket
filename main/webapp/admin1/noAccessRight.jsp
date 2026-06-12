<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>접근 제한</title>
</head>
<body>
	<div class="container py-4">
		<jsp:include page="/menu.jsp" />   	
	    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
	      <div class="container-fluid py-5">
	        <h1 class="display-5 fw-bold text-danger">접근 권한이 없습니다!</h1>
	      </div>
	    </div>
	    <jsp:include page="/footer.jsp" />	
    </div>
</body>
</html>