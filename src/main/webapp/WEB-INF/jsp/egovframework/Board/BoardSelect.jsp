<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
</script>
		<table border="1px">
			<tr>
				<td><input type="text" name="title" id="title" value="${board.title }" readonly>
				<input type="text" name="author_id" id="author_id" value="${board.author_id }" readonly></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" id="content" name="content" readonly>${board.content }</textarea></td>
				
			</tr>
		</table>
</body>
</html>