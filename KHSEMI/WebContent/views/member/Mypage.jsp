<%@	page import="com.kh.member.model.vo.Member, java.util.ArrayList, com.kh.board.model.vo.Board"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	String fileName = loginUser.getFileName();
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }
    .nav-area{
        background-color: #E6F2FF;
        align-items: center;
        margin: auto;
    }
    .menu{
        display:table-cell;
        height:80px;
		width:250px;
    }
    #nav{
        color: #FFD133;
        font-size: 20px;
    }

    .menu a:hover{
        font-weight: bold;
    }
    .logo{
        display: flex;
        justify-content: center;
    }

    .mypage{
        margin-top: 50px;
        height:15%;
    }

    .mypage>h1{
        text-align: center;
        font-size: xx-large;
        font-family: 'Lilita One', cursive;
        height: 20%;    
        margin-top: 20px;   
        }

     .content, .footer{
        height : 40%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 0px;
        position :relative;
    }   
     .content_2, .content_3, .content_5{  
        width:60%;
        height: 15rem; 
        border: 0px solid black;
    }

    .content_4{
        width:60%;
        height: 15rem; 
        border: 1px solid black;
    }

    .footer_1{
        height: 15rem;
        width: 60%;
        border: 1px solid black;
    }

    .myprofile_img{
        border: 1px solid black;
        height: 10rem;
        width: 30%;
        display: flex;
        flex-direction: column;
        align-items: center;
        border-top-left-radius :30px;
        border-bottom-left-radius: 30px;
    }

    .myprofile{
        width: 50%;
        height: 10rem;
        border: 1px solid black;
        border-top-right-radius: 30px;
        border-bottom-right-radius: 30px;
    }

    .content_2, .content_3,.content_5, .footer_1{ 
        display: flex;
        align-items: center;
        justify-content: center;
        
    }

   .container{
        width: 300px;
        position: relative;
        margin-bottom: -400px;
        float: left;
        margin-top: 50px;
        margin-left: 100px;
    }

    .speed{
        position: absolute;
        top: 0;
        left: 0;
        margin: 0;
        padding: 10px;
    }
    .img{
        width: 60%;
        height: 10rem;
        border-radius: 55%;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: rgba(52, 152, 219, 0.52);
        margin: 20px;
    }

    #profilechange, #rset{
        margin: 60px 0px 0px 30px;
        
    }

    #profilemessage{
        margin: 60px 0px 0px 30px;
    }

    #profilemessage-text{
        vertical-align: bottom;
    }
    
    .info{
        width: 100%;
        height: 10rem;
        border: 1px solid black; 
        border-style:inset;
        border-width: 2px;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
        border-bottom-right-radius: 30px;
        border-top-right-radius: 30px;
    }

    button{
        border-radius: 10px;
        cursor: pointer; 
    }

   #table{
    margin: 0 auto;
    border-spacing: 30px;
    border-collapse: separate;
   }

   #btn1, #btn2, #btn3, #btn4, #btn5{
    cursor: pointer;
    border-radius: 0px;
    border-color: lightgray;
    width: 140px;
   
   }
   
   button:hover {
   background-color: lightgray;
   } 

   #changebutton{
    border: 1px solid gray;
    border-width: 0.5px;
    height: 50px;
    color: black;
    margin-left: 20px;
   }
   
   #thead{
    border: 1px solid black;
   }

   #textbox{
    width: 600px;
   }


   #search_2{
    margin-right: 100px;
   }
   
   @font-face {
		font-family: 'yg-jalnan';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
		font-weight: normal;
		font-style: normal;
    }
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }
    .footer{
    	margin-bottom: 30px;
    }
     .footer>div{
        display: inline-block;
        vertical-align: middle;
        color: rgb(158, 158, 158);
        margin: 10px;
    }
    .footer2>div>li, .footer4>div>li{
        list-style-type: none;
        display: inline;
        margin: auto;
        text-decoration: none;
        
    }

    .footer4{
        float: right;
        margin: 30px;
    }
    .footer2>div>li a{
        color: rgb(158, 158, 158);
        padding-right: 20px;
    }
    .footer4>div>li a{
        padding-right: 9px;
    }
    
    #profile_img{
  		width:50px;
  		height:50px;  
    }
   
</style>
</head>
<body>

<div class="login-area" >
	<%if(loginUser == null){ %>
        <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/login.me">로그인</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">회원가입</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled">이용규칙</a>
            </li>
        </ul>
       <%}else{ %>
        <p><%=loginUser.getUserName() %>님</p>
       <%} %>
    </div>     


	<div class="logo">
		<a href=""><img src="resources/logo.png" width="200px"></a>
	</div>

    
       
	
	
    <div class="nav-area" >
        <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link active" id="nav" aria-current="page" href="#">같이걷개</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">멍냥수다</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="nav" href="#">나눔&거래</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" id="nav"  style="color: gray;">대빵용</a>
            </li>
        </ul>
    </div>
    
    <div class="mypage">
        <h1 style="color: cornflowerblue; font-size: 60px;" onclick="" >My Page</h1>
        <link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">
    </div>
    
    <div class="container">
    <div class="speed" id="speed">
        <ul style="color: rgba(52, 152, 219, 0.52) ; " ><ul style="color: rgba(52, 152, 219, 0.52); font-size: 25px;" id="board">게시판 바로가기</ul>
            <li style="color: black; font-size: 15px;"><a href="<%=contextPath%>/sellListView.jsp">산책메이트 게시판</a></li>
            <li style="color: black; font-size: 15px;"><a href="">자유게시판</a></li>
            <li style="color: black; font-size: 15px;"><a href="">중고물품 게시판</li></a>
        </ul>
        <ul style="color: rgba(52, 152, 219, 0.52) ;" ><ul style="color: rgba(52, 152, 219, 0.52); font-size: 25px;" id="board">FAQ</ul>
            <li style="color: black; font-size: 15px;"><a href="">1:1문의</li></a>
            <li style="color: black; font-size: 15px;"><a href="">간단질의문의</li></a>
        </ul>
        <ul style="color: rgba(52, 152, 219, 0.52) ;" ><ul style="color: rgba(52, 152, 219, 0.52); font-size: 25px;" id="board">공지사항</ul>
            <li style="color: black; font-size: 15px;"><a href="">공지사항 바로가기</li></a>
        </ul>
        <ul style="color: rgba(52, 152, 219, 0.52) ;" ><ul style="color: rgba(52, 152, 219, 0.52); font-size: 25px;" id="board">전화번호</ul>
            <li style="color: black; font-size: 15px;">000-000-000</li>              
        </ul> 
    </div> 
  </div>  
  
<%--   <div class="profile_img" style="background-color:gray;">
    <%if(fileName != null) { %>
    	<% }else{ %>
    	 
    <% } %>
    </div> --%>
    
    <div class="content"> 
        <div class="content_2">
            <div class="myprofile_img">
                <div class="img" >
                	<%if(fileName!= null){ %>
				    	<img id="profile_img" src="<%=request.getContextPath() %>/<%=fileName %>">
                	<%}else{ %>
	                   <img id="profile_img" src="resources/profile_basic.png">
                	<%} %>
                </div>
            </div>
            <div class="myprofile">
            	
                <input type="submit" value="프로필 수정" action=""  onclick= "imgToggle()" id="profilechange" style="font-family: Arial, Helvetica, sans-serif;">
                
                <input type="reset" value="기본이미지 변경" onclick= "imgToggle()" id="rset" style="font-family: Arial, Helvetica, sans-serif;"> <br>
                          
            </div> 
        </div>
        
        <div class="content_3">
            <div class="info">
                <table border="0px" id="table">
                    <tr id="mymenu">
                        <th id="username" style="text-align: center; color: rgba(52, 152, 219, 0.52);" width="150px">O O O님</th>
                        <th id="board" style="text-align: center; color: rgba(52, 152, 219, 0.52);" width="150px">게시글</th>
                        <th id="likelist" style="text-align: center; color: rgba(52, 152, 219, 0.52);" width="150px">찜목록</th>
                        <th id="chatting" style="text-align: center; color: rgba(52, 152, 219, 0.52);" width="150px">채팅</th><th id="walk mate" style="text-align: center; color: rgba(52, 152, 219, 0.52);">산책메이트</th>
                    </tr>
                    <tr>
                        <td ><button type="button" style="background-color: white;" id="changebutton" width="150px" ><a href="<%=contextPath%>/updateuser.me">회원정보 수정</a></button></td>
                        <td style="text-align: center;">0건</td>
                        <td style="text-align: center;">0건</td>
                        <td style="text-align: center;">0건</td>
                        <td style="text-align: center;">0건</td>
                    </tr>
                </table>
            </div>
        </div>
        
   
        <div class="content_4">
            <button id="btn1">작성글(0)</button>
            <button id="btn2">작성댓글(0)</button>
            <button id="btn3">찜목록(0)</button>
            <button id="btn4">채팅(0)</button>
            <button id="btn5">산책메이트(0)</button>
            <div id="category" >
            	<form id="free_main2" action="" method="post">
			        <table align="" border="0" >
			            <thead id="thead2">
			                        <tr align="center">
			                            <th style="width: 120px;">글번호</th>
			                            <th style="width: 600px;">제목</th>
			                            <th style="width: 150px;">작성자</th>
			                            <th style="width: 180px;">날짜</th>
			                            <th style="width: 100px;">조회수</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                     <!--    <tr align="center">
			                            <td>1</td>
			                            <td><a href="#">첫번째 게시글 댓글</a></td>
			                            <td>작성자1</td>
			                            <td>2023-03-20</td>
			                            <td>10</td>
			                        </tr> -->
			                        <%if(list != null){ %>
			                        	<%for(Board b: list) { %>
					                     	<tr align="center">
					                            <td><%= b.getBoardNo() %></td>
					                            <td><a href="#"><%= b.getBoardTitle() %></a></td>
					                            <td><%= b.getBoardWriter() %></td>
					                            <td><%= b.getCreateDate() %></td>
					                            <td><%= b.getCount() %></td>
					                        </tr>
			                        	<% } %>
			                        <%} else{ %>
		                       		 	<tr align="center">
					                            <td colspan="5">조회된 글이 없습니다.</td>
				                       	</tr>
			                        <% } %>
			                     
			                    </tbody>
			                </table>
		            </form>
            </div>

            <div id="comment" style="display: none;"></div>

            <div id="wishlist" style="display: none;"></div>

            <div id="chatting" style="display: none;"></div>

            <div id="runningmate" style="display: none;"></div>            
    
    </div>
    
     <div class="footer">
        <div class="footer1">
            <img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/logo3.png" width="200px">
        </div>
    
        <div class="footer2">
            <div>
                <li><a href="">개인정보취급방침</a></li>
                <li><a href="">청소년보호정책</a></li>   
                <li><a href="">이용약관</a></li>               
            </div>
            <div>
                문의 : ddoogaenang.naver.com            
            </div>
            <div>
                Copyrightⓒ 2023 ddooganang all rights reserved           
            </div>
        </div>

        <div class="footer3">
      

        </div>
    

        <div class="footer4">
            <div>
                <li><a href=""><img src="https://semiproject.s3.ap-northeast-2.amazonaws.com/%EC%9D%B4%EC%9C%A0%EC%A7%84/twitter.png" width="30px"></a></li>
                <li><a href=""><img src="<%= request.getContextPath() %>/resources/facebook.png" width="25px"></a></li>   
                <li><a href=""><img src="<%= request.getContextPath() %>/resources/instagram.png" width="30px"></a></li>               
            </div>

        </div>


    </div>
</div>

<script>
// 스크롤 이동 이벤트
$(document).ready(function() {
  // 초기 위치 저장
  var speedTop = $('.speed').offset().top;
  
  // 페이지 스크롤 이벤트 리스너 등록
  $(window).scroll(function() {
    // 현재 스크롤 위치 가져오기
    var scrollTop = $(window).scrollTop();
    
    // 스크롤에 따라 이동
    $('.speed').css({ top: scrollTop });
  });
});

</script>

<script>
// 내가쓴 글 확인 창
const btn1 = document.getElementById('btn1');
// const category = document.getElementById('category');

const container = document.querySelector("#category");

btn1.addEventListener('click', function() {
  if (category.style.display === 'none') {
    category.style.display = 'block';
  } else {
    category.style.display = 'none';
  }
});

</script>
</body>
</html>