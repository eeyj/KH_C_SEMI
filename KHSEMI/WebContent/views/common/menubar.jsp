<%@ page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
html, body {height: 100%;}

.nav-area {
	background-color: #E6F2FF;
	align-items: center;
	margin: auto;
}

.menu {
	display: table-cell;
	height: 80px;
	width: 250px;
}

#nav {
	color: #FFD133;
	font-size: 20px;
}
#nav:hover{
	font-weight:bold;
}
.menu a:hover {
	font-weight: bold;
}

.logo {
	display: flex;
	justify-content: center;
	margin-left: 250px;
}

.login-area>ul>li a {
	color: gray;
	font-weight: bold;
}

.after-login {
	border: 1px solid black;
	visibility: hidden;
	width: 250px;
	height: 100px;
	float: right;
	margin-top: 30px;
	margin-right: 10px;
}

.after-login>table tr, .after-login>table td {
	padding-top: 5px;
}
.after-login a{
	text-decoration : none;
	color : black;
}
#profile_img{
	width:80px;
}
.note-num {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 3;
    height: 20px;
    width: 20px;
    line-height: 20px;
    text-align: center;
    background-color: red;
    border-radius: 15px;
    display: inline-block;
}

</style>
</head>
<body>

	<div class="login-area">
		<% if (loginUser == null) { %>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" href="<%= contextPath %>/login.me">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="<%=contextPath%>/views/member/memberEnroll.jsp">회원가입</a></li>
			</ul>
			<!-- 로그인시 프로필창 -->
			<div class="after-login">
				<table>
					<tr>
						<td rowspan="3" width="100px"><img src="resources/profile_basic.png" width="80px"></td>
						<td colspan="2" width="50px" style="font-weight: bold; color: #FFD133;"></td>
					</tr>
					<tr>
						<td colspan="2"><a href="<%= contextPath%>/mypageTest">마이페이지</a></td>
					</tr>
					<tr>
						<td><a href=""><img src="resources/notification.png" width="25px"></a></td>
						<td><a href=""><img src="resources/chat-balloon.png" width="15px"></a></td>
					</tr>
				</table>
			</div>
		<% } else { %>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" href="<%= contextPath %>/logout.me">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link">또오개냥입니다.</a></li>
			</ul>
			<!-- 로그인시 프로필창 -->
			<div class="after-login">
				<table>
					<tr>
						<td rowspan="3" width="100px">
							<%if(loginUser.getFileName() != null) { %>
			            		<img id="profile_img" src="<%= request.getContextPath() %>/<%= loginUser.getFileName() %>">
		            		<% } else {  %>
		            			<img id="profile_img" src="resources/profile_basic.png">
		            		<% } %>	
						</td>
						<td colspan="2" width="50px" style="font-weight: bold; color: #FFD133;"><%= loginUser.getUserNickname() %>님</td>
					</tr>
					<tr>
						<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
							<td colspan="2"><a href="<%=contextPath%>/adminProfile">마이페이지</a></td>
						<% }else{ %>
							<td colspan="2"><a href="<%=request.getContextPath()%>/Mypage.me">마이페이지</a></td>
						<% } %>
					</tr>
					<tr>
						<td><a href=""><img src="resources/notification.png" width="25px"></a></td>
						<td><a href=""><img src="resources/chat-balloon.png" width="15px"></a></td>
					</tr>
				</table>
			</div>
		<% } %>
	</div>
	<script>
		<% if(loginUser != null) { %>
			$(function(){
				$('.after-login').css("visibility","visible");
			});
		
		<% } %>
	</script>

	<div class="logo">
		<a href=""><img src="resources/logo.png" width="200px"></a>
	</div>

	<div class="nav-area">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link" id="nav" href="#">같이걷개</a></li>
			<li class="nav-item"><a class="nav-link" id="nav" href="#">멍냥수다</a></li>
			<li class="nav-item"><a class="nav-link" id="nav" href="#">나눔&거래</a></li>
			<li class="nav-item"><a class="nav-link" id="nav" href="<%=request.getContextPath()%>/dbti">DBTI</a></li>
		</ul>
	</div>
	
	
</body>
</html>