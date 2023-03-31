<%@ page import="com.kh.member.model.vo.Member, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.container {
       		display: flex;
            justify-content: space-evenly;
            align-items: flex-start;
            padding: 10px;
            width: 1000px;
        }

        .master_profile {
            text-align: center;
        }

        .master_profile_img {
            background-image: url(resources/chatbot.png);
            background-size: contain;
            background-repeat: no-repeat;
            width: 80px;
            height: 80px;
            border-radius: 100%;
            margin: 0 auto;
        }
        .master_member_title {
            border-bottom: #FFD133 solid;
            width: 180px;
            font-weight: bold;
        }
        .member_table {
            width: 700px;
            padding: 0px 10px 0px 10px;

        }
        .member_table th, .member_table td, .member_table tr{
            text-align: center;
            border: 1px solid gray;

        }
        .modal_container{
            background-color: rgb(251, 246, 240);
            display: flex;
            justify-content: space-evenly;
            align-items: flex-start;
            padding: 10px;
          
        }
        .modal_profile{
            text-align: center;
        }
        .modal_profile_img{
            background-image: url(resources/profile_basic.png);
            background-size: contain;
            background-repeat: no-repeat;
            width: 60px;
            height: 60px;
            border-radius: 100%;
            margin: 0 auto;
        }
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background:   rgb(251, 246, 240);
            box-shadow: 0 8px 32px 0 rgba(133, 133, 134, 0.37);
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 500px;
            height: 350px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        .modal_btn-area{
            text-align: center;
            padding-right: 25px;
        }
       
        .profile_table input{
            width: 150px;
            margin-left: 50px;
        }

</style>
</head>
<body>
    
    <div id="wrap">
        <div class="header" >
            <jsp:include page="adminMenubar.jsp"/>
        </div>

        <main id="container">
            <div class="container">
                <div class="item master_profile">
                    <div class="master_profile_img" style="background-color: gray;"></div>
                    <div style="font-weight: bold;">관리자님</div>
                </div>
                <div class="item">
                    <h2 class="master_member_title" style="text-align: center;">회원관리</h2>
                    <table class="member_table">
                        <thead>
                            <tr style="background-color: rgb(190, 187, 187);">
                                <th width="100px">아이디</th>
                                <th width="100px">이름</th>
                                <th width="100px">닉네임</th>
                                <th width="150px">가입날짜</th>
                                <th width="100px">회원상태</th>
                            </tr>
                        </thead>
                        <tbody>
 
                            <% if(list.isEmpty()) { %>
                            	<tr>
                            		<td colspan="5">조회된 리스트가 없습니다.</td>
                            	</tr>
                            <% } else { %>
                            	<% for(Member m : list) { %>
                            		<tr>
                            			<td><%= m.getUserId() %></td>
                            			<td><%= m.getUserName() %></td>
                            			<td><%= m.getUserNickname() %></td>
                            			<td><%= m.getEnrollDate() %></td>
                            			<td><%= m.getStatus() %></td>
                            		</tr>
                            	<% } %>
                            <% } %> 
                            
                        </tbody>
                    </table>
                </div>
            </div>

        </main>

        <div class="footer">
          <jsp:include page="../common/footer.jsp"/>
        </div>
        
        <!-- Modal -->
        <div class="modal-overlay" id="modal">
            <div class="modal-window">
                <div class="modal-header">
                    <h3 class="modal-title" style="font-weight: bold;">회원관리 상세</h3>
                    <div type="button" class="close">X</div>
                </div>
                <div class="modal-content">
                    <div class="modal_container">
                        <div class="item modal_profile">
                            <div class="modal_profile_img" style="background-color: gray;"></div>
                        </div>
                        <div class="item">
                            <form class="member_info" action="" method="post">
                                <table class="profile_table">
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" name="userName" value="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>닉네임</td>
                                        <td><input type="text" name="userNick" value="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>아이디</td>
                                        <td><input type="text" name="userId" value="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td><input type="email" name="email" value="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>반려동물</td>
                                        <td><input type="text" name="pet" value="" readonly></td>

                                    </tr>
                                </table>
                                <br>
                                <div class="modal_btn-area">
                                    <button type="submit" class="btn btn-primary btn-sm">가입승인</button>
                                    <button type="submit" class="btn btn-primary btn-sm">가입거절</button>
                                    <button type="submit" class="btn btn-primary btn-sm">회원탈퇴</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    
        <script>
            
            $(function(){
                $(".member_table>tbody>tr").click(function(){
                    $("#modal").css("display","flex");
                })
            })
            
            $(function(){
                $(".close").click(function(){
                    $("#modal").css("display","none");
                })
            })

        </script>


    </div>
</body>

</html>