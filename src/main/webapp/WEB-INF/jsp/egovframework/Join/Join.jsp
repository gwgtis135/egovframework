<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
</head>
<style>
body {
	font-size:9pt;
	font-family:맑은고딕;
}
table {
	width:600px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	padding:3px;
	line-height:2.0;
}
caption	{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px
}

.div_button	{
	width:600px;
	text-align:center;
	margin-top:5px;
}

</style>
<body>

<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="selectAllBoard.do">게시판</a></th>
		<th width="25%"><a href="join.do">회원가입</a></th>
		<th width="25%"><a href="login.do">로그인</a></th>
	</tr>
</table>

<form id="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userId">아이디</label></th>
		<td>
		<input type="text" name="userId" id="userId" placeholder="아이디입력">
		<button type="button">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>
		<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">남
		<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
		<input type="text" name="birth" id="birth" readonly>
		</td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
		<input type="text" name="phone" id="phone"> (예:010-1234-1234)
		</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode">
		<button type="button">우편번호 찾기</button>
		<br>
		<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="submit">저장</button>
	<button type="reset">취소</button> 
</div>
</form>
</body>
</html>