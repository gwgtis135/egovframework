<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	게시판
	<div>
		<a href="insertBoard.do"><button>글작성</button></a>
	</div>
	<table border="1px">
		<thead>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</thead>
		<tbody>
			<c:forEach var="board" items="boardlist">
				<tr>
					<!--  <td>${board.id }</td>-->
					<td>${board.title }</td>
					<td>${board.author_id }</td>
					<td>${board.created_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>