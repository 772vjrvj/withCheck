<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 상세보기</title>
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
function noticeBoardList(){
	location.href="noticeBoardList.do";
}

	var slide=0;

	function replayForm(){
		if(slide==0){			
			$("#replyForm").slideDown( "fast" );
			slide++;
		}else{
			$("#replyForm").slideUp( "fast" );
			slide--;
		}

	}
	
	$(function(){
		$("#container form").submit(function(){ //"#container>form"이거 아니고 "#container form"이거 이유는 바로 아래 아니니깐 
			var bool=true;
			$("#replyForm tr>td").each(function(){ //[td,td,td,td,td,td,td,td,td,....]길이만큼 each가 function를 실행   + tr>td그냥 이렇게 하면 모든 tr>tr니깐
				if($(this).children().val()==""){//.children(input)이렇게 하면 content가 안걸린다. 왜냐면 textarea니까
					alert($(this).children().attr("name")+"을 입력하세요");
					$(this).children().focus();//바로입력할 수 있는 포커스(커서)
					bool=false;//submit이벤트 취소를 위한 값저장
					return false;//each에 구현된 함수 종료
				}
			});//each종료
			return bool; //bool의 값이 false면 submit이벤트 취소됨
		});//
	});
</script>
<%-- <% request.getAttribute("dto") %> 이거 안하고 객체가 이미 와있으니깐 jstl로 바로 받자--%>
</head>
<body>
<div id="container">
<br>
<br>
<c:choose>
	<c:when test="${HcAnsDto.depth >= 1}">
		<h4>댓글 상세보기</h4>
	</c:when>
	<c:otherwise>
		<h4>게시글 상세보기</h4>
	</c:otherwise>
</c:choose>
<br>

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
		<td colspan="2">${HcAnsDto.title}</td>
	</tr>	
	<tr>
		<th>작성일</th>
		<td colspan="2">${HcAnsDto.regdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td  colspan="2" ><textarea class="form-control" rows="10" cols="63" readonly="readonly">${HcAnsDto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: right;">
		
			<c:if test="${HcAnsDto.id eq loginId}">
				<a class="btn btn-default btn-xs" href="noticeBoardUpdateform.do?seq=${HcAnsDto.seq}">수정</a>
				<a class="btn btn-default btn-xs" href="noticeBoardDelete.do?seq=${HcAnsDto.seq}">삭제</a>
			</c:if>
			
			<button class="btn btn-default btn-xs" onclick="replayForm()">답글</button>
			<input class="btn btn-default btn-xs" type="button" value="목록" onclick="noticeBoardList()"/>
		</td>
	</tr>
</table>
<div id="replyForm">
<hr/>
<h4>답글달기</h4>
		<form action="replyBoardInsert.do" method="post">
			<input type="hidden" name="seq" value="${HcAnsDto.seq}"/>
			<input type="hidden" name="id" value="${loginId}"/>
			<table>
			<col width="100px">
			<col width="400px">
			<col width="200px">
				<tr>
					<th>아이디</th>
					<td colspan="3">${loginId}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input class="form-control" type="text" name="title"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea class="form-control" rows="1" cols="60" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<input class="btn btn-default btn-xs" type="submit" value="답글추가"/>
						<input class="btn btn-default btn-xs" type="button" value="목록" onclick="noticeBoardList()"/>
					</td>
				</tr>
			</table>			
		</form>
</div>
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>