<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function CallNotice(id){
		if(event.target.type != "checkbox"){
			frm.id.value=id;
			frm.submit();	
		}
	}
</script>
</head>
<body>
	게시판
	<div>
		<a href="insertBoard.do"><button>글작성</button></a>
		<a href="deleteBoard.do"><button>글삭제</button></a>
	</div>
	<table border="1px">
		<thead>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>삭제</td>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardlist }">
				<tr onclick="CallNotice(${board.id })">
					<td>${board.id }</td>
					<td>${board.title }</td>
					<td>${board.author_id }</td>
					<td>${board.created_date }</td>
					<td><input type="checkbox"
						id="delbox${board.id }" name="delbox" value="${board.id }"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form id="frm" name="frm" method="post" action="selectBoard.do">
		<input type="hidden" id="id" name="id">
	</form>
</body>
</html>