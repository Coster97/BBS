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
	<link rel="shortcut icon" type="image⁄x-icon" href="images/logo.png">
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href= "css/bootstrap.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<link rel="shortcut icon" type="image⁄x-icon" href="images/lo.png">
<title>오공이 - 예습복습 커뮤니티</title>
<style type ="text/css">
body {
	background-color:white;
}
a, a:hover {
	color: #000000;
	text-decoration: none;
}

.container {
	display: block;
}

.jumbotron {
	display: block;
}

#jumbotron1, #jumbotron2, #jumbotron3 {
	display: block;
	width: 40%;
	background-color: white;
}

#maininfo2 {
	display: flex;
	justify-content: space-around;
}

.qa-source {
	background-color: white;
	width: 100%;
}

span {
	display: block;
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
	background-color: white;
	border: 0;
	outline: 0;
}

.part-title {
	text-align: start;
}


footer {
	
	text-align: center;
	color: gray;
	padding-top: 1%;
	padding-bottom: 3%;
}

</style>
</head>
<body>
<%-- 	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%> --%>
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
					<li class="active"><a href="main.jsp">홈</a>
					<li>
					<li><a href="study.jsp">예습복습</a>
					<li>
					<li><a href="q&a.jsp">Q&A</a>
					<li>
					<li><a href="bbs.jsp">커뮤니티</a>
					<li>
					<li><a href="notice.jsp">공지사항</a>
					<li>
			
				</ul>
				<%
					if(userID == null){
				
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="buton" aria-haspopup="true"
						aria-expanded="false">시작하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><button>모드변경</button></li>
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
					</li>
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
			<button class = "icon"><i class="fas fa-search" class="fas fa-solid fa-bars"></i></button>
		</form>
	</div>
	<br></br>
	<div class="container">

		<div class="jumbotron">
			<div class="container"></div>
			<div class="maininfo">
				<div>
					<h3>오늘 수업에 참석하지 못한 분들 특히 주목!</h3>
					<br></br> <span>중앙정보처리학원 502호가 함께 만들어가는 예습복습 커뮤니티 오공이(502, 오늘 공부는 이렇게) 입니다.</span> <br></br>
					<span>수업 예습, 복습 등의 주제로 공부 기록 습관을 기르고 동기들과 인사이트를 공유해보세요.</span> <span>
						다양한 생각을 나누며 함께 성장하는 공간으로 활용되도록 노력하겠습니다.</span> <br></br> <a
						class="btn btn-success btn-pull" href="study.jsp" role="button">예습복습
						바로가기</a>

				</div>


			</div>
		</div>
	</div>
	
	<div class="space-container" id="maininfo2">
		<div class="container">
			<div class="jumbotron" id="jumbotron1">
				<div class="maininfo">
					<div>
						<div class="container">
							<div class="part-title">
								<hr></hr>
								<a href="q&a.jsp"><h3>Q&A</h3></a>
							</div>
							<br></br>
							<div class="row">
								<table class="table table-stripsed" style="text-align: start">
									<thead>
										<tr>

											<th style="text-align: start;">Title</th>
											<th style="text-align: start;">Name</th>


										</tr>
									</thead>
									<tbody>
										<%
										BbsDAO bbsDAO = new BbsDAO();
										ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
										//Collections.reverse(list);
										for (int i = 0; i < list.size(); i++) {
										%>
										<tr>
											<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
											<td><%=list.get(i).getUserID()%></td>

										</tr>
										<%
										}
										%>

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="space-container">
		<div class="container">
			<div class="jumbotron" id="jumbotron2">
				<div class="maininfo">
					<div>
						<div class="container">
							<div class="row">
								<div class="part-title">
									<hr></hr>
									<a href="bbs.jsp"><h3>커뮤니티</h3></a>
								</div>
								<br></br>
								<table class="table table-stripsed" style="text-align: start">
									<thead>
										<tr>

											<th style="text-align: start;">Title</th>
											<th style="text-align: start;">Name</th>


										</tr>
									</thead>
									<tbody>
										<%
									
										for (int i = 0; i < list.size(); i++) {
										%>
										<tr>
											<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
											<td><%=list.get(i).getUserID()%></td>

										</tr>
										<%
										}
										%>

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="space-container">
			<div class="container">
				<div class="jumbotron" id="jumbotron3">
					<div class="maininfo">
						<div>
							<div class="container">
								<div class="row">
									<div class="part-title">
										<hr></hr>
										<a href="notice.jsp"><h3>공지사항</h3></a>
									</div>
									<br></br>
									<table class="table table-stripsed" style="text-align: start">
										<thead>
											<tr>

												<th style="text-align: start;">Title</th>
												<th style="text-align: start;">Name</th>


											</tr>
										</thead>
										<tbody>
											<%
										
										for (int i = 0; i < list.size(); i++) {
										%>
											<tr>
												<td><a
													href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
												<td>관리자</td>

											</tr>
											<%
										}
										%>

										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- <div class = "container">
		<div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class = "active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner">
				<div class = "item active">
					<img src= "images/02.jpg">
				</div>
				<div class="item">
					<img src= "images/04.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> 
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>

		</div>
	</div> -->
		<br></br>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
<footer>개발 Coster97 | 문의 ekitdevteam@gmail.com | © 2023</footer>
</html>