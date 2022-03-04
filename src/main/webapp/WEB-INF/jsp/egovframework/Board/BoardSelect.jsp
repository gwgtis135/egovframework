<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload = function(){
		document.querySelector("#btndel").addEventListener("click",function(e){
			if(confirm("<spring:message code="confirm.delete" />")){
				frm.action="deleteBoard.do";
				frm.submit();
			}
		});
		document.querySelector("#btnupd").addEventListener("click",function(e){
			frm.action="updateBoard.do";
			frm.submit();	
		});
	}
</script>
		<div>	
			<table border="1px solid">
				<tr>
					<td><input type="text" name="title" id="title" value="${board.title }" readonly>
					<input type="text" name="userid" id="userid" value="${board.userid }" readonly></td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty board.filevo }">
							<td>
								<c:forEach var="file" items="${board.filevo }">
									<a href="filedown.do?name=${file.fileName }">${file.fileName }</a><br>
								</c:forEach>
							</td>
						</c:when>
						<c:otherwise>
							<td><spring:message code="board.noneattach" /></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td><textarea rows="10" cols="50" id="content" name="content" readonly style="resize:none;">${board.content }</textarea></td>
				</tr>
			</table>
			<div style="text-align:right;">
				<button id="btnupd"><spring:message code="button.modify" /></button>
				<button id="btndel"><spring:message code="button.delete" /></button>
			</div>
		</div>
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="id" name="id" value="${board.id }">
		<input type="hidden" id="check" name="check">
	</form>
</body>
</html>