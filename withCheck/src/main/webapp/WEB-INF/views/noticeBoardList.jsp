<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 목록</title>
<jsp:include page="head.jsp" />
<jsp:include page="style.jsp"/>
<style type="text/css">
   table{
      margin: auto;
      border-collapse: collapse;
      border-radius: 30px;
      font-size: 17px;
      border-top: 1px solid #c0c0c0;
      
   }
   
   th{
      border-bottom: 1px solid #c0c0c0;
      text-align: center;   
      width: 100px;
      height:35px;
      padding-top:10px;
      padding-bottom:10px;
   }
   td{
  	  border-bottom: 1px solid #c0c0c0;
      text-align: center;   
      height:35px;
      font-weight: normal;
      padding-top:10px;
      padding-bottom:10px;
   }	   
	   
	   
</style>
<script type="text/javascript">
	$(function(){

	});


	//새글작성 폼으로 이동
	function noticeBoardInsertform(){
		location.href="noticeBoardInsertform.do";
	}

</script>
</head>
<body>
<div id="container">
	<br>
	<br>

         <h3 style="text-align: center;">Notice</h3>	
         <br>	<br>
	<table >
		<col width="50px"/>
		<col width="150px"/>
		<col width="450px"/>
		<col width="80px"/>
		<col width="50px"/>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty lists }">
				<tr><td style="text-align: center;" colspan="9">----작성된 글이 없습니다.----</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${lists}" >
					<tr>
						<td>${dto.seq}</td>
						<td>${dto.id}</td>
						<c:choose>
							<c:when test="${dto.delflag=='Y'}">
								<td style="text-align: center;" class="delboard">---삭제된 글입니다.---</td>
							</c:when>
							<c:otherwise>
								<td style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:forEach var = "i" begin = "1" end = "${dto.depth}">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</c:forEach>
								<c:if test="${dto.depth >= 1}"><img style="width: 20px;" src='img/right-arrow.svg' alt='image'/></c:if>
									<a href="noticeBoardDetail.do?seq=${dto.seq}">
										${dto.title}
									</a>
								</td>							
							</c:otherwise>
						</c:choose>
						<td>${dto.regdate}</td>
						<td>${dto.readcount}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="10" style="text-align: right;">
				<input type="button" class="btn btn-default btn-xs" value="글추가" onclick='noticeBoardInsertform()'/>
			</td>
		</tr>
	</table>
</div>
<jsp:include page="foot.jsp"/>
</body>
</html>