<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<jsp:include page="head.jsp" />
<jsp:include page="style.jsp"/>
<style type="text/css">
table {
	margin: auto;
	border-top: solid 1px #c0c0c0;
}

th {
	border-bottom: 1px solid #c0c0c0;
	color: black;
	text-align: center;
	height: 35px;
	padding: 2px;
}

td {
	border-bottom: 1px solid #c0c0c0;
	text-align: center;
	height: 35px;
	padding: 2px;
}

h4 {
	text-align: center;
	color: black;
	font-weight: bolder;
}

h5 {
	text-align: center;
	color: #245682;
	font-weight: bold;
}

#container {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}
#replyForm{
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#container > form").submit(function(){
		var bool=true;
		$("tr>td").each(function(){ //[td,td,td,td,td,td,td,td,td,....]길이만큼 each가 function를 실행
			if($(this).children().val()==""){//.children(input)이렇게 하면 content가 안걸린다. 왜냐면 textarea니까
				alert($(this).children().attr("name")+"을 입력하세요");
				$(this).children().focus();//바로입력할 수 있는 포커스(커서)
				bool=false;//submit이벤트 취소를 위한 값저장
				return false;//each에 구현된 함수 종료
			}
		});//each종료
		return bool; //bool의 값이 false면 submit이벤트 취소됨
	});
});
function noticeBoardList(){
	location.href="noticeBoardList.do";
}
</script>

</head>
<body>
<div id="container">
<br>
<br>
<h4>게시글 상세보기</h4>
<br>
<form action="noticeBoardUpdate.do" method="post">
<input type="hidden" name="id" value="${HcAnsDto.id}"/>
<input type="hidden" name="seq" value="${HcAnsDto.seq}"/>
<table>
	<col width="100px">
	<col width="400px">
	<col width="200px">
	<tr>
		<th >아이디</th>
		<td colspan="2">${HcAnsDto.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="2"><input style="text-align: center; width: 600px;" type="text" name="title" value="${HcAnsDto.title}"/></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td colspan="2">${HcAnsDto.regdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="2"><textarea class="form-control" rows="10" cols="63" name="content">${HcAnsDto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: right;">
			<input class="btn btn-default btn-xs" type="submit" value="수정완료"/>
			<input class="btn btn-default btn-xs" type="button" value="목록" onclick="noticeBoardList()"/>
		</td>
	</tr>
</table>
</form>
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>