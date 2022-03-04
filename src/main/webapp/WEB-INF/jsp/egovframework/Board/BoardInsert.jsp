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
	function attachfilereset(){
		var trs = document.querySelectorAll("tr");
		for(i=3;i<trs.length;i++){
			trs[i].remove();
		}
	}
		window.onload = function() {
			// 인서트 페이지인지 업데이트 페이지인지
			// 및 업데이트 페이지라면 내용 기본 설정
			var a = '${board}';
			if (a != '') {
				console.log(a);
				a = a.replace(/\\/g,'\\\\');
				console.log(a);
				a = JSON.parse(a);
				console.log(a);
				document.getElementById("frmins").action = "BoardUpdate.do";
				document.getElementById("id").value = a.id;
				document.getElementById("userid").value = a.userid;
				document.getElementById("title").value = a.title;
				document.getElementById("content").value = a.content;
				document.getElementById("file").file=a.filevo[0];
				//document.getElementById("file").filename=a.filevo.fileName;
				//document.getElementById("file").filePath=a.filevo.filePath;
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
						attachfilereset();
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
			var filelist = document.getElementById("attachfileName");
			document.getElementById("attachfileName").addEventListener("click", function(){
				file.click();
			});
			var files = document.getElementById("file");
			files.addEventListener("change", function(){
				filelist.value="";
				if(files.files.length == 0){
					attachfilereset();
				}else{
					for(ff of files.files){
						var tr = document.createElement("tr");
						var td = document.createElement("td");
						td.innerHTML="<input type='text' style='border:0px;' value='"+ff.name+"'>";
						var btn = document.createElement("button");
						btn.style="float:right;";
						btn.type="button";
						btn.innerHTML="<spring:message code='button.delete' />"
						btn.onclick=function(){
							var filelistt="";
							list = filelist.value.split("\\");
							for(i=0;i<list.length;i++){
								if(filelistt == ""){
								}else if(i+1==list.length){
								}else{
									filelistt+="\\";
								}
								if(list[i]==this.parentElement.firstChild.value){
									console.log(list);
									list.splice(i,1);
									continue;
								}
								filelistt+=list[i];
							}
							console.log(list.length);
							console.log(filelistt);
							filelist.value=filelistt;
							this.parentElement.remove();
						}
						td.append(btn);
						tr.append(td);
						document.querySelector("table").append(tr);
						if(filelist.value != ""){
							filelist.value+="\\";
						}
						filelist.value+=ff.name;
					}
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
				<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
			</tr>
			<tr>
				<td>
					<input style="width:100%;" type="text" id="attachfileName" placeholder="첨부파일" readonly />
					<input style="display:none;" type="file" id="file" name="file" multiple>
				</td>
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