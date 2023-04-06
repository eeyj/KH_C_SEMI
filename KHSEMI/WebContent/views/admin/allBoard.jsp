<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	ArrayList<Board> list = (ArrayList<Board>)session.getAttribute("list");
	
 	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
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
        .container {
            display: flex;
            justify-content: space-evenly;
            /* align-items: flex-start;
            padding: 10px; */
           /*  width: 1000px; */
        }

        .allBoard_title {
            border-bottom: #FFD133 solid;
            width: 250px;
            font-weight: bold;
            text-align: center;
        }

        .allBoard_list {
            width: 750px;
            padding: 0px 10px 0px 10px;
            margin-top: 50px;
        }
        .all_search{
            text-align: right;
            text-decoration: none;
        }
        .all_search_text{
            flex: 1 1 0px;
            /* border: 0px; */
            border-right: none;
            padding: 11px 23px;
            font-style: normal;
            font-weight: 400;
            font-size: 18px;
            line-height: 23px;
            color: rgb(153, 153, 153);
            border-radius: 10px 0px 0px 10px;
        }
        .all_search_button{
            padding: 11px 33px;
            margin: -2px;
            flex: 0 0 fit-content;
            background-color: rgb(83, 193, 243);
            border-radius: 0px 10px 10px 0px;
            font-style: normal;
            font-weight: 700;
            font-size: 18px;
            line-height: 23px;
            text-align: center;
            color: rgb(255, 255, 255);
        }
        .serach_area{
        	width: 1000px;
        }
       	.pagaeBtn{
   		    overflow-clip-margin: content-box;
   			overflow: clip;
   			width: 26px;
		    height: 26px;
		    background-color: transparent;
		    border:none;
       	}
       	.prev{
       		transform: rotate(180deg);
       	}
       	.pagingArea{
       		margin: 25px auto 0px;
   		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    column-gap: 30px;
		    justify-content: center;
       	}
       	.pagingArea>button{
       	    border: 0;
		    padding: 0;
		    margin: 0;
		    background-color: transparent;
    	}
</style>
</head>
<body>

<%@ include file= "adminMenubar.jsp" %>


  <div class="container">
        <div class="item">
	        <div class="serach_area">
	            <h2 class="allBoard_title">게시글 관리</h2>
	            <div class="all_search">
	                <input class="all_search_text" type="text" placeholder="검색어를 입력해주세요">
	                <button class="all_search_button">검색</button>
	            </div>        
	        </div>
	        <div>
	            <table class="allBoard_list table table-hover">
	                <thead>
	                    <tr>
	                    	<th scope="col">번호</th>
	                        <th scope="col">카테고리</th>
	                        <th scope="col">글제목</th>
	                        <th scope="col">작성자</th>
	                        <th scope="col">작성일자</th>
	                        <th scope="col">조회수</th>
	                    </tr>
	                </thead>
	                <tbody class="table-group-divider">
	                    <c:choose>
	                    	<c:when test="${ empty list }">
	                    		<tr>
	                    			<td colspan="6">조회된 게시글이 없습니다.</td>
	                    		</tr>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="b" items="${ requestScope.list }" varStatus="status">
	                    			<tr>
	                    				<td>${b.boardNo }</td>
	                    				<c:choose>
	                    					<c:when test="${b.boardType eq 1}">
	                    						<td scope="row">같이걷개</td>
	                    					</c:when>
	                    					<c:when test="${b.boardType eq 2}">
	                    						<td scope="row">멍냥수다</td>
	                    					</c:when>
	                    					<c:when test="${b.boardType eq 3}">
	                    						<td scope="row">나눔&거래</td>
	                    					</c:when>
	                    				</c:choose>
										<td>${b.boardTitle }</td>	
										<td>${b.boardWriter }</td>
										<td>${b.createDate }</td>
										<td>${b.count }</td>                    			
	                    			</tr>
	                    		</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
	                </tbody>
	            </table>
	        </div>
        </div>
        
        
        
        
    </div>

    <!-- 페이징바 영역  -->
    <div class="pagingArea">
		
		
		<button onclick="location.href='<%=request.getContextPath()%>/allB?currentPage=<%= currentPage - 1%>'">
			<img class="pagaeBtn prev" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		
		
		<% for(int i = startPage; i<=endPage; i++) { %>
			
			<% if(i != currentPage) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/allB?currentPage=<%= i %>';"><%= i %></button>
			<% } else {%>
				<button disabled><%= i %></button>
			<% } %>
		<% } %>
		
		
		<button onclick="location.href='<%= request.getContextPath()%>/allB?currentPage=<%= currentPage + 1%>'">
			<img class="pagaeBtn next" src="https://sscampus.kr/images/notice/page-indicator-caret.png">
		</button>
		
		
		
	</div>








</body>
</html>