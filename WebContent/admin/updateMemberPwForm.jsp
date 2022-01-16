<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");

	//인증 방어 코드 : 로그인 후, MemgerLevel이 1이상인 경우에만 페이지 열람 가능
	// session.getAttribute("loginMember") --> null
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() <1 ){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	int memberNo = 0;
	if(request.getParameter("memberNo") != null){
		memberNo = Integer.parseInt(request.getParameter("memberNo"));
	}
	String memberName = "";
	if(request.getParameter("memberNo") != null){
		memberName = request.getParameter("memberName");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 PW 수정</title>	<!-- 관리자 회원 PW 수정 페이지 -->
</head>
<body>
<div class="container-fluid">
	<!-- 배너 -->
	<jsp:include page="/partial/banner.jsp"></jsp:include>
		<!-- 관리자 메뉴 include -->
	<div>
		<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
	</div>
		<!-- end : mainMenu include -->
	<div style="text-align: center">
		<h1><%=memberNo%> <%=memberName%> - 회원PW수정</h1>
		<br>
		<form method="post" action="<%=request.getContextPath() %>/admin/updateMemberPwAction.jsp?memberNo=<%=memberNo%>">
			<div>바꿀 비밀번호</div>
			<div><input type="password" name="memberPw"></div>
			<div><button type="submit" class="btn btn-outline-secondary">Submit</button></div>
		</form>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="/partial/footer.jsp"></jsp:include>
</div>
</body>
</html>