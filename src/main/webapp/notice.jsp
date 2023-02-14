<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.Collections" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href= "css/bootstrap.css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<link rel="shortcut icon" type="image⁄x-icon" href="images/lo.png">
<title>오공이 - 공지사항</title>
<style type ="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}

header {
	position: fixed;
	top: 0;
	left: 0;
	height: 20px;
	width: 100%;
	background-color: #ddd;
}

.search {
	display: flex;
	justify-content: flex-end;
	padding-right: 5%;
}

.search-bar {
	width: 80%;
	height: 25px;
	margin: 0 auto;
	border: none; /* <-- This thing here */
	border: solid 1px #ccc;
	border-radius: 10px;
	padding-left: 10px;
}

.icon {
	background-color: transparent;
	border: 0;
	outline: 0;
}

footer {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 20px;
	width: 100%;
	margin: 0 auto;
	text-align: center;
	color: gray;
	padding-bottom: 3%;
}
</style>

</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber =Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<header>
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">오공이</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">홈</a>
					<li>
					<li><a href="study.jsp">예습복습</a>
					<li>
					<li><a href="q&a.jsp">Q&A</a>
					<li>
					<li><a href="bbs.jsp">커뮤니티</a>
					<li>
					<li class="active"><a href="notice.jsp">공지사항</a>
					<li>
				</ul>
				<%
				if (userID == null) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="buton" aria-haspopup="true"
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
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="buton" aria-haspopup="true"
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
	</header>
	<br></br>
	<br></br>
	<div class="search">
		<form action=test()>
			<input class="search-bar" type="text" name="Name" placeholder="검색">
			<!-- 	<input type="submit" value="Search"> -->
			<button class="icon">
				<i class="fas fa-search" class="fas fa-solid fa-bars"></i>
			</button>
		</form>
	</div>
	<br></br>
	<div class="container">
		<div class="jumbotron">
			<h4>공지사항</h4>
			<span>오공이의 소식, 이벤트 정보를 공유해드립니다.</span>
		</div>	
		<div>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="buton" aria-haspopup="true"
					aria-expanded="false">필터<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">최신순</a></li>
						<li><a href="login.jsp">추천순</a></li>
						<li><a href="join.jsp">댓글순</a></li>
						<li><a href="join.jsp">스크랩순</a></li>
						<li><a href="join.jsp">조회순</a></li>
					</ul>
				<li>
			</ul>
		</div>
	</div>
	<div class = "container">
		<div class="row">
			<table class = "table table-stripsed" style = "text-align : center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style = "background-color:#abc192; text-align:center;">순서</th>
						<th style = "background-color:#abc192; text-align:center;">제목</th>
						<th style = "background-color:#abc192; text-align:center;">작성자</th>
						<th style = "background-color:#abc192; text-align:center;">게시일</th>
					</tr>
				</thead>
				<tbody>
					<%
					
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						//Collections.reverse(list);
						for(int i = 0; i < list.size(); i ++){
						
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td>관리자</td>
						<td><%= list.get(i).getBbsDate() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class = "btn btn-success btn-arraw-left">previous</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class = "btn btn-success btn-arraw-left">next</a>
			<%
				}
			%>
			<!-- <a href="write.jsp" class="btn btn-success pull-right">글쓰기</a> -->
			<br></br>
			<br></br>
			<br></br>
			<br></br>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
<footer>개발 Coster97 | 문의 ekitdevteam@gmail.com | © 2023</footer>
</html>