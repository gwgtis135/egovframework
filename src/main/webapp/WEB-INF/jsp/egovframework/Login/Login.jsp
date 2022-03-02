<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	#(function(){
		$("#btn_submit").click(function(){
			var userId = $("#userId");
			var pass = $("#pass");
		})
	})
</script>
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
<form id="frm">
<table>
	<caption>로그인</caption>
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
</table>
<div class="div_button">
	<button type="button" id="btn_submit">로그인</button>
	<button type="reset">취소</button> 
</div>
</form>

</body>
</html>