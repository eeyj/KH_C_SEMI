<%@ page import="com.kh.member.model.vo.Member, com.kh.pet.model.vo.Pet, com.kh.board.model.vo.Attachment, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String alertMsg = (String) session.getAttribute("alertMsg");
	Pet updatePet = (Pet) session.getAttribute("pet");
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
        width: 80px;
        height: 80px;
        border-radius: 70%;
        margin: 0 auto;
        overflow: hidden;
    }
    #profile_img{
    	width: 100%;
    	height: 100%;
   		object-fit: cover;
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
    #admin_profile_title{
    	font-weight: bold;
    	text-align: center;
    }
   
</style>
</head>
<body>

<%@ include file= "adminMenubar.jsp" %>

<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		String userNickname = loginUser.getUserNickname();
		String userPwd = loginUser.getUserPwd();
		String phone = loginUser.getPhone();
		String email = loginUser.getEmail();
		String address = loginUser.getAddress();
		int userNo =  loginUser.getUserNo();
		String fileName = loginUser.getFileName();
%>

	<div class="container">
        <div class="item profile">
        	<form class="master_profile_img" action="<%= contextPath %>/profileImg" method="post" enctype="multipart/form-data">
	            <input type="hidden" name="userNo" value="<%= userNo %>">
	            <div class="profile_img" style="background-color: gray;">
	            	<%if(fileName != null) { %>
		            	<img id="profile_img" src="<%= request.getContextPath() %>/<%= fileName %>">
	            	<% } else {  %>
	            		<img id="profile_img" src="resources/profile_basic.png">
	            	<% } %>
	            </div>
	            <div style="font-weight: bold;">관리자님</div>
	            <div>
	                <input type="file" name="file" id="file" onchange="loadImg(this)">
	                <label for="file"  class="btn-upload">이미지 변경</label>
	            </div>
	            <div>
	            	<button type="submit" class="btn-upload" id="admin_img_up">변경하기</button>
	            </div>
        	</form>
        </div>
        <div class="item">
            <form class="master_update" action="<%=contextPath %>/adminProfile" method="post">
           		<input type="hidden" name="userNo" value="<%= userNo %>">
                <h2 id="admin_profile_title">관리자님의 프로필</h2>
                <br>
    	
                <table class="profile_table">
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="userName" value="<%= userName %>"></td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td><input type="text" name="userNickname" value="<%= userNickname %>"></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" name="userId" value="<%= userId %>" readonly></td>
                    </tr>
                    <tr>
                        <td>신규 비밀번호</td>
                        <td><input type="password" id="newPwd" name="newPwd" value="<%= userPwd %>"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" id="checkPwd"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="email" name="email" value="<%= email == null ? "" : email %>"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                       	<td><input type="text" name="address" value="<%= address == null ? "" : address %>"></td>
                    </tr>
                    <tr>
                        <td>반려동물</td>
                        <td>
                            <input type="radio" name="pet" id="dog" value="dog">
                            <label for="dog">강아지</label>
                            <input type="radio" name="pet" id="cat" value="cat">
                            <label for="cat">고양이</label>
                            <input type="radio" name="pet" id="etc" value="etc">
                            <label for="etc">기타</label>
                        </td>
    
                    </tr>
                </table>
    
    
                <br>
                <div class="btn-area">
                    <button type="submit" class="btn btn-primary" id="update_profile">수정하기</button>
                    <button type="reset" class="btn btn-secondary">취소하기</button>
                </div>
                <br>
            </form>


        </div>
       
    </div>
    
    <script>
   	 	$(function(){
			$("#update_profile").submit(function(){
				$("#admin_img_up").submit();
			});
	    
    	$(function(){
    		let pet = "<%= loginUser.getPet() == null ? "" : loginUser.getPet()%>";
    		
    		$("input[name='pet']").each(function(){
    			
    			if(pet.search($(this).val()) >= 0 ){
    				$(this).attr("checked", true);
    			}
    		})
    		
    	});	
    
    	function loadImg(input){
    		
    		if(input.files && input.files[0]){
	    		var reader = new FileReader();
	    		reader.onload = function(e){
	    			document.getElementById('profile_img').src = e.target.result;
	    		};
	    		reader.readAsDataURL(input.files[0]);
	    	} else {
	    		document.getElementById('profile_img').src="resources/chatbot.png";
	    	}
    		
    	}
    </script>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>