<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href= "css/bootstrap.css">
<link rel="shortcut icon" type="image⁄x-icon" href="images/lo.png">
<title>오공이</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID")); 
		}
		if(bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">오공이</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href = "main.jsp">홈</a><li>
				<li><a href = "study.jsp">예습복습</a><li>
				<li><a href = "q&a.jsp">Q&A</a><li>
				<li class = "active"><a href = "bbs.jsp">커뮤니티</a><li>
				<li><a href = "notice.jsp">공지사항</a><li>
			</ul>
			<%
				if(userID == null){
			
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class="dropdown-toggle" data-toggle="dropdown" role="buton" aria-haspopup="true"
				 	aria-expanded="false">시작하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				<li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class="dropdown-toggle" data-toggle="dropdown" role="buton" aria-haspopup="true"
				 	aria-expanded="false">설정<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my.jsp">마이페이지</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				<li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<br></br>
	<div class = "container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
					
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%">제목</td>
						<td colspan = "2"><%= bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td colspan = "2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>게시일</td>
						<td colspan = "2"><%= bbs.getBbsDate() %></td>
					</tr>
					<tr>
						<td colspan = "2" style = "padding-top:20px;padding-left:20px; height: 600px; min-height:200px; text-align:left;"><%= bbs.getBbsContent() %></td>
					</tr>
				</tbody>
			</table>
		
			<a href ="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정하기</a>
				<a onclick="return confirm('정말 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger">삭제하기</a>
			<%
				}
			%>
			<input type="submit" class="btn btn-success pull-right" value="글쓰기">
			<br></br>
			<br></br>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>