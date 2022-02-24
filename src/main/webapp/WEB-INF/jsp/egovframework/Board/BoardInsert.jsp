<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BoardInsert.do" method="POST" id="frmins">
		<table border="1px">
			<tr>
				<td><input type="text" name="title" id="title" placeholder="제목">
				<input type="text" name="author_id" id="author_id" placeholder="작성자"></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
				
			</tr>
		</table>
		<input type="submit" value="등록">
		<input id="btnreset"type="button" value="초기화">
	</form>
	<script>
		document.querySelector("#btnreset").addEventListener("click",function(){
			 document.getElementById("frmins").reset();
		})
	</script>
</body>
</html>