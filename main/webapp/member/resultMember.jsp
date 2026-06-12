<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
<div class="container py-4">
   <jsp:include page="/menu.jsp" />
   
   <%!
	String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market!";
   %>
   	
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">
        	<%
        	String msg = request.getParameter("msg");
        	if(msg!=null){
        		if(msg.equals("0")){
        			out.println("<span class='text-success'>회원가입</span>이 완료되었습니다.");
        		}else if(msg.equals("1")){
        			out.println("<span class='text-success'>로그인</span>이 완료되었습니다.");
        		}else if(msg.equals("2")){
        			out.println("<span class='text-primary'>회원수정</span>이 완료되었습니다.");
        			greeting = "회원정보가 정상적으로 반영되었습니다.";
        		}else if(msg.equals("3")){
        			out.println("<span class='text-danger'>회원탈퇴</span>가 완료되었습니다.");
        			greeting = "서비스를 이용해 주셔서 감사합니다.";
        		}else{
        			out.println("멤버 결과 페이지");
        		}
        	}
        	%>
        </h1>
        <p class="col-md-8 fs-4"><%=greeting%></p>
      </div>
    </div>
    
    <div class="row align-items-md-stretch   text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
          <h3><%=tagline%></h3>     
          <%
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속  시각: " + CT + "\n");
			%>    
        </div>
      </div>   
 	</div> 
   
   <jsp:include page="/footer.jsp" />	
</div>	
</body>
</html>