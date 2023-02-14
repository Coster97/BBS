<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href= "css/bootstrap.css">
<link rel="shortcut icon" type="image⁄x-icon" href="images/lo.png">
<style type ="text/css">
.jumbotron {
	background-color: white;
}

.button1, .button2 {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.button2, .image-div, .welcome-div {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.welcome-div {
	padding-top: 3%;
	font-weight: bold;
}

.buttons {
	margin: 3%;
	padding: 4%;
	background-color: white;
	color: #80CAFF;
	border: 1px solid #e9e9e9;
	border-radius: 10px;
	width: 30%;
	height: 2%;
}

.buttons:hover {
	background-color: #abc192;
	transition: 0.3s;
}

header {
	position: fixed;
	top: 0;
	left: 0;
	height: 20px;
	width: 100%;
	background-color: #ddd;
}

.form-control {
	background-color: white;
	color: black;
	border: 1px solid black;
	border-radius: 10px;
}

.sns-join, .id-join {
	padding-bottom: 7%;
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
<title>오공이</title>
</head>
<body>
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
				<li><a href = "bbs.jsp">커뮤니티</a><li>
				<li><a href = "notice.jsp">공지사항</a><li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href = "#" class="dropdown-toggle" data-toggle="dropdown" role="buton" aria-haspopup="true"
				 	aria-expanded="false">시작하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				<li>
			</ul>
		</div>
	</nav>
	<div class= "container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style = "padding-top:20px">
				<form method="post" action="joinAction.jsp">
					<div class="image-div">
						<img src=images/lo.png style="width: 50%">
					</div>
					<div class="welcome-div">
						<span>오공이에 오신것을 환영합니다.</span>
					</div>
					<br></br>
					
					<div class="sns-join">
						<span>SNS 회원가입</span>
					</div>
					<div class="button1">
						<button class = "buttons"><img src="images/github.png" style="width: 50%"></button>
						<button class = "buttons"><img src="images/google.png" style="width: 50%"></button>
						<button class = "buttons"><img src="images/facebook.png" style="width: 50%"></button>
					</div>
					<div class="button2">
						<button class = "buttons"><img src="images/naver.png" style="width: 48%"></button>
						<button class = "buttons"><img src="images/kakao.png" style="width: 49%"></button>
					
					</div>
					
					<hr style="border: solid 0.4px black;">
					<div class="id-join">
						<span>회원가입에 필요한 기본정보 입니다.</span>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name = "userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name = "userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name = "userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name = "userEmail" maxlength="50">
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name = "userGender" autocomplete="off" value="Man" checked>남자
							</label>
							<label class="btn btn-primary active">
								<input type="radio" name = "userGender" autocomplete="off" value="Woman" checked>여자
							</label>
						</div>
					</div>
					<br></br>
					<input type="submit" class="btn btn-success form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>