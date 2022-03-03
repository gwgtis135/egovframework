<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		window.onload = function() {
			// 인서트 페이지인지 업데이트 페이지인지
			// 및 업데이트 페이지라면 내용 기본 설정
			var a = '${board}';
			if (a != '') {
				a = JSON.parse(a);
				document.getElementById("frmins").action = "BoardUpdate.do";
				document.getElementById("id").value = a.id;
				document.getElementById("userid").value = a.userid;
				document.getElementById("title").value = a.title;
				document.getElementById("content").value = a.content;
			} else {
				document.getElementById("frmins").action = "BoardInsert.do";
			}
			
			//서브밋 버튼
			document.getElementById("btnins").addEventListener("click",
					function() {
				console.log(document.getElementById("title").value)
				document.getElementById("frmins").submit();
					});
			
			
			// 리셋버튼
			document.querySelector("#btnreset").addEventListener("click",
					function() {
						document.getElementById("frmins").reset();
					});
					
			// 컨텐츠 텍스트에어리어 값 지정
			var tempcontent = ''; 
			document.getElementById("content").addEventListener("input",function(){
			    const maxByte = <spring:message code="board.content.byte" />; //최대치
			    const text_val = document.getElementById("content").value; //문자열
			    const text_len = text_val.length; //문자 수
			    let totalByte=0;
			    for(let i=0; i<text_len; i++){
			    	const each_char = text_val.charAt(i);
			        const uni_char = escape(each_char) //유니코드 형식으로 변환
			        if(uni_char.length>4){
			            totalByte += 2;
			        }else{
 			            totalByte += 1;
			        }
			    }
			    
			    if(totalByte>maxByte){
			    	 alert("<spring:message code="errors.overbyte" arguments="내용,1000" />"); 
			    	document.getElementById("content").value = tempcontent;
			        }else{
			        	tempcontent = text_val;
			        }
			    });
			var temptitle = ''; 
			document.getElementById("title").addEventListener("input",function(){
			    const maxByte = <spring:message code="board.title.byte" />; //최대치
			    const text_val = document.getElementById("temptitle").value; //문자열
			    const text_len = text_val.length; //문자 수
			    let totalByte=0;
			    for(let i=0; i<text_len; i++){
			    	const each_char = text_val.charAt(i);
			        const uni_char = escape(each_char) //유니코드 형식으로 변환
			        if(uni_char.length>4){
			            totalByte += 2;
			        }else{
			            totalByte += 1;
			        }
			    }
			    
			    if(totalByte>maxByte){
			    	 alert("<spring:message code="errors.overbyte" arguments="제목,100" />"); 
			    	document.getElementById("content").value = temptitle;
			        }else{
			        	temptitle = text_val;
			        }
			    });
		}
	</script>
	<form method="POST" id="frmins" enctype="multipart/form-data">
		<table border="1px">
			<tr>
				<td><input type="text" name="title" id="title" placeholder="제목">
					<input type="text" name="userid" id="userid" placeholder="작성자"></td>
			</tr>
			<tr>
				<td style="text-align:right"><input type="file" name="file" multiple></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
			</tr>
		</table>
		<input type="button" value="<spring:message code="button.create" />" id="btnins"> <input
			id="btnreset" type="button" value="<spring:message code="button.reset" />"> <input type="hidden"
			id="id" name="id" value="0">
	</form>
	<script>
		
	</script>
</body>
</html>