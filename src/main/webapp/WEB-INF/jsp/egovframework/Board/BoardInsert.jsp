<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BoardInsert.do" method="POST">
		<table border="1px">
			<tr>
				<td><input type="text" name="title" id="title" placeholder="제목">
				<input type="text" name="author_id" id="author_id" placeholder="작성자"></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
				
			</tr>
		</table>
		<input type="submit">
	</form>
</body>
</html>