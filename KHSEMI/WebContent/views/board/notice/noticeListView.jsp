<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
            width: 900px;
        }
        .master_notice_title {
           	width: 250px;
            font-weight: bold;
            text-align: left;
        }

        .notice_table {
            width: 100%;
            padding: 0px 10px 0px 10px;
            margin-top: 20px;
            border-top: 2px solid rgb(83, 193, 243);
        }

        .notice_write_btn{
            text-align: right;
            text-decoration: none;
            padding-left: 650px;
        }
        .titleArea{
        	display:inline-flex;
        	align-content: center;
        	justify-content: center;
        	align-items: center;
        	flex-direction: row;
        	
        }
      
</style>

</head>
<body>

<%@ include file= "../../admin/adminMenubar.jsp" %>

<div class="container">
        
        <div class="item" style="width:1000px;">
	        <div class="titleArea">
	            <h2 class="master_notice_title">공지사항 관리</h2>
	            <div class="notice_write_btn">
	                <a class="btn btn-outline-warning" href="<%= request.getContextPath() %>/insert.no">글작성</a>
	            </div>
        	</div>
            <table class="notice_table table table-hover">
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">글제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일자</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <% if(list.isEmpty()){ %>
                    	<tr>
                    		<td scope="row" colspan="5">존재하는 공자사항이 없습니다.</td>
                    	</tr>
                    <% } else { %>
                    	
                    	<% for (Board b : list) { %>
							<tr>
								<td scope="row" ><%= b.getBoardNo() %></td>
								<td><%= b.getBoardTitle() %></td>
								<td><%= b.getBoardWriter() %></td>
								<td><%= b.getCreateDate() %></td>
								<td><%= b.getCount() %></td>
							</tr>                    	
                    	<% } %>
                    <% } %>
                    
                    
                    
                </tbody>
            </table>
        </div>
    </div>
	
	<script>
		$(function(){
			$(".notice_table>tbody>tr").click(function(){
				let bno = $(this).children().eq(0).text();
				
				location.href = "<%= request.getContextPath()%>/detail.no?bno="+bno;
			});
		});
		
	
	</script>
	
	
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>