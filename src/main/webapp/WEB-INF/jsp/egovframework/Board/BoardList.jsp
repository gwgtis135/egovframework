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
			frm.action="selectBoard.do";
			frm.id.value=id;
			frm.submit();	
		}
	}
	window.onload = function(){
		document.querySelector("#btndel").addEventListener("click",function(e){
			if(confirm("삭제하시겠습니까?")){
				var chkbox = document.querySelectorAll("input[name=delbox]:checked")
				var val =[];
				console.log(chkbox);
	 			for(i = 0; i<chkbox.length;i++){
					val.push(chkbox[i].value);
				} 
				console.log(val);
				frm.action="deleteBoards.do";
				frm.check.value=val;
				frm.submit();	
			}
		});
		var result = '${result }';
		if(result!=''){
			alert(result);
		}
	}
</script>
</head>
<body>
	게시판
	<div>
		<a href="insertBoard.do"><button>글작성</button></a>
		<button id="btndel">글삭제</button>
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
					<td>${board.userid }</td>
					<td>${board.createdDate }</td>
					<td><input type="checkbox" id="delbox${board.id }"
						name="delbox" value="${board.id }"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form id="frm" name="frm" method="post">
		<input type="hidden" id="id" name="id"> <input type="hidden"
			id="check" name="check">
	</form>
</body>
</html>