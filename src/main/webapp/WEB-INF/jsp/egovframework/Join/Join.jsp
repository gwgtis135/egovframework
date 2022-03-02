<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
body {
	font-size:9pt;
	font-family:맑은고딕;
}
table {
	width:600px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	padding:3px;
	line-height:2.0;
}
caption	{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px
}
.div_button	{
	width:600px;
	text-align:center;
	margin-top:5px;
}
</style>
<body>
<div class="col-lg-9">
<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="selectAllBoard.do">게시판</a></th>
		<th width="25%"><a href="join.do">회원가입</a></th>
		<th width="25%"><a href="login.do">로그인</a></th>
	</tr>
</table>

<form id="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userId">아이디</label></th>
		<td>
		<input type="text" name="userId" id="userId" placeholder="아이디입력">
		<button type="button">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>
		<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">남
		<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
		<input type="text" name="birth" id="birth">
		</td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
		<input type="text" name="phone" id="phone"> (예:010-1234-1234)
		</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode">
		<button type="button">우편번호 찾기</button>
		<br>
		<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button> 
</div>
</form>
</div>
 <script>
$( function() {
  $( "#birth" ).datepicker({
    changeMonth: true,
    changeYear: true
  });
  //버튼을 클릭했을 때 유효성 검사하기 
  $("#btn_submit").click( function(){
	  
	  let userId  = $("#userId").val();
	  let pass = $("#pass").val();
	  let name = $("#name").val();
	  //공백제거
	  userId = $.trim(userId);
	  pass = $.trim(pass);
	  name = $.trim(name);
	  console.log(userId);
	  console.log(pass);
	  console.log(name);
	  if(userId == ""){
		  alert("아이디를 입력해주세요");
		  $("#userId").focus();
		  return false;
	  }
	  if(pass == ""){
		  alert("패스워드 입력해주세요");
		  $("#pass").focus();
		  return false;
	  }
	  if(name == ""){
		  alert("이름을 입력해주세요");
		  $("#name").focus();
		  return false;
	  }
	  //입력태그 안의 값 공백제거
	  $("#userId").val(userId);
	  $("#pass").val(pass);
	  $("#name").val(name);
	  
	  let formData = $("#frm").serialize();
	  console.log(formData)
	  
	  $.ajax({
		  url:"JoinInsert.do",
		  method:"POST",
		  data: formData,
		  dataType:"Text",	//리턴타입
		  success: function(result){
			  console.log('성공했어요')
			  console.log(result)
			  if(result == "ok"){
				  alert("저장완료");
				  location="login.do";	//회원등록 성공시 로그인 페이지 이동
			  }else{
				  alert("회원등록 실패");
			  }
		  },
		  error: function(){	//장애발생
			  alert("오류발생");
		  }
	  })
	  
  })
});
$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};
  </script>
</body>
</html>