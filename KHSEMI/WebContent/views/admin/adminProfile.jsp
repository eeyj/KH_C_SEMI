<%@ page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
 	
	.container{
        display: flex;
        justify-content: space-evenly;
        align-items: flex-start;
        padding: 10px;
        width: 1000px;
    }
    #file {
        display: none;
    }
    .btn-upload {
        width: 100px;
        height: 30px;
        background: rgb(211, 207, 207); 
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        border-radius: 10px;
       
    }
    .profile{
        text-align: center;
    }
    th, td{
        padding-top: 0px;
        padding-bottom: 20px;
        padding-left: 20px;
        padding-right: 50px;
    }
    .profile_img{
        background-image: url(resources/chatbot.png);
        background-size: contain;
        background-repeat: no-repeat;
        width: 80px;
        height: 80px;
        border-radius: 100%;
        margin: 0 auto;
    }
    .master_update{
        border: solid 1px gray;
        margin: 0 auto;
        width: 750px;
        padding: 5px 30px 5px 30px;
    }
    h2{
       border-bottom: #FFD133 solid;
       width: 260px;
       font-weight: bold;
    }
    .btn-area{
        text-align: center;
    }
   
</style>
</head>
<body>

<%@ include file= "adminMenubar.jsp" %>

<div class="container">
        <div class="item profile">
            <div class="profile_img" style="background-color: gray;"></div>
            <div style="font-weight: bold;">관리자님</div>
            <div>
                <input type="file" name="file" id="file">
                <label for="file"  class="btn-upload">이미지 수정하기</label>
            </div>
        </div>
        <div class="item">
            <form class="master_update" action="<%=contextPath %>/adminProfile" method="post">
                <h2>관리자님의 프로필</h2>
                <br>
    
                <table class="profile_table">
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="userName" value="<%= loginUser.getUserName() %>"></td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="userNick" value="<%= loginUser.getUserNickname() %>"></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="userId" value="<%= loginUser.getUserId() %>" readonly></td>
                    </tr>
                    <tr>
                        <td>신규 비밀번호</td>
                        <td><input type="password" id="newkPwd"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" id="checkPwd"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="email" name="email" value="<%= loginUser.getEmail() %>"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="email" name="address" value="<%= loginUser.getAddress() %>"></td>
                    </tr>
                    <tr>
                        <td>반려동물</td>
                        <td>
                            <input type="checkbox" name="pet" id="dog">
                            <label for="dog">강아지</label>
                            <input type="checkbox" name="pet" id="cat">
                            <label for="cat">고양이</label>
                            <input type="checkbox" name="pet" id="etc">
                            <label for="etc">기타</label>
    
                        </td>
    
                    </tr>
                </table>
    
                <br>
                <div class="btn-area">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="reset" class="btn btn-secondary">취소하기</button>
                </div>
                <br>
            </form>


        </div>
       
    </div>


</body>
</html>