<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			if(confirm("<spring:message code='confirm.delete' />")){
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
		document.querySelector("#btnins").addEventListener("click",function(e){
			frm.action="insertBoard.do";
			frm.submit();
		});
		var result = '${result }';
		if(result!=''){
			alert(result);
		}
	}
</script>
</head>
<body>
	<div>게시판</div>
	<div>
		<div>
			<table border="1px">
				<thead>
					<tr>
						<td><spring:message code="board.no" /></td>
						<td><spring:message code="board.title" /></td>
						<td><spring:message code="board.author" /></td>
						<td><spring:message code="board.createdDate" /></td>
						<td><spring:message code="board.delete" /></td>
					</tr>
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
		</div>
		<div>
			<button id="btnins">
				<spring:message code="button.create" />
			</button>
			<button id="btndel">
				<spring:message code="button.delete" />
			</button>
		</div>
	</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="id" name="id"> <input type="hidden"
			id="check" name="check">
	</form>
</body>
</html>