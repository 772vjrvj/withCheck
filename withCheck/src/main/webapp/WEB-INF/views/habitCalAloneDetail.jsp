<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>habitCalAloneDetail</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/slider.css">
<script src="js/slider.js"></script>
<script type="text/javascript">
	$(function(){
		if($("#switchCheck").attr("checked")=="checked")   {
			$("#switchText").css('color','black').text("공개");         
		}else{
			$("#switchText").css('color','red').text("비공개");         
		}
	    $("#switchCheck").change(function(){
	       if($("#switchCheck").is(":checked"))   {
	          $("#switchText").css('color','black').text("공개");         
	       }else{
	          $("#switchText").css('color','red').text("비공개");         
	       }
	    });
	});
</script>
</head>
<body>
	<jsp:include page="style.jsp"/>
	<jsp:include page="head.jsp"/>

	<div id="container">
		<form action="insertCheck.do" method="post">
			<jsp:useBean id="Cal" class="com.hk.toCheckFinal.utils.cal"/>
			<jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>	   
			
			<input type="hidden" name="pKey" value="${dto.pKey}"/>
			<input type="hidden" name="id" value="${dto.id}"/>
			
			<table style="border-collapse: collapse; border: white">
				<col width="188px">
				<col width="188px">
				<col width="188px">
				
				<tr><th colspan="3" style="color:#245682; text-align: center; font-size: 20px;">${dto.title}</th></tr>
				<tr><td style="color: white">&nbsp;</td></tr>
			</table>  
			<table id="calendartitle" border="1" style="border: 3px solid #000000;">
				<col width="188px">
				<col width="188px">
				<col width="188px">
				
				<tr>
					<th style="background-color:#000000; color:white; text-align: center;">시작일</th>
		            <th style="background-color:#000000; color:white; text-align: center;">종료일</th>
		            <th style="background-color:#000000; color:white; text-align: center;">기간</th>
				</tr>
				<tr>
		            <td style="color:#245682; text-align: center; ">${map.stYear}/  ${map.stMonth}/  ${map.stDate}</td>
		            <td style="color:#245682; text-align: center;">${map.edYear}/  ${map.edMonth}/  ${map.edDate}</td>
		            <td style="color:red; text-align: center;">${map.term}</td>
				</tr>
				<tr><td colspan="3" style="color:#245682; text-align: center;">${dto.content}</td></tr>
			</table>	
			<img alt="image" src="${dto.photo}" >
			<table id="calendartitle" style="border-collapse: collapse; border: white; height: 30px;">
				<col width="188px">
				<col width="188px">
				<col width="188px">
				<tr>
					<td colspan="3" style="text-align: right;">
					<input type="submit" class="btn btn-default btn-xs" value="확인"/>
		 			<input type="button" class="btn btn-default btn-xs" value="삭제" onclick="location.href='habitCalDeleteAlone.do?pKey=${dto.pKey}&id=${dto.id}&which=main'"/>
					<label class="switch">
						<input type="checkbox" ${dto.calWith eq 'Y' ? 'checked':''} id="switchCheck" name="switchCheck">
						<span class="slider round"></span>
					</label>
					<div style="font-size: 12px; vertical-align:text-top; color: #245682; font-weight: bolder; " id="switchText"></div>
					</td>
				</tr>
			</table>
			
			
			<div class="view">
			
			<div class="cal_wrap">
			<c:set var="st" value="0"/><c:set var="ed" value="0"/>
			
			<c:forEach var = "i" begin = "${map.stYear}" end = "${map.edYear}">   
   
		        <c:choose>
					<c:when test="${map.stYear eq map.edYear}">
						<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="${map.edMonth}"/>
					</c:when>
					<c:otherwise>
						<c:choose>
					        <c:when test="${i eq map.stYear}">
								<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="12"/>
					        </c:when>               
					        <c:when test="${i gt map.stYear and i lt map.edYear}">
								<c:set var="st" value="1"/><c:set var="ed" value="12"/>
					        </c:when>               
					        <c:when test="${i eq map.edYear}">
								<c:set var="st" value="1"/><c:set var="ed" value="${map.edMonth}"/>
					        </c:when>               
						</c:choose>
					</c:otherwise>
		        </c:choose>
		
				<c:forEach var = "j" begin = "${st}" end = "${ed}">
				<div class="cal">
					<table id="calendar" border="1">
						<tr><th style="color: white; text-align: center;">${i} 년</th></tr>
					</table>    
					<table id="calendar" border="1" style="text-align: center;">
						<caption style="font-weight:bolder; text-align: center; color:#245682;">${j} 월</caption>
						<tr style="color: white;">
							<th >일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
						</tr>
						
						<c:forEach var = "k" begin = "1" end = "${Cal.dayOfWeek(i,j,1)-1}">
							<c:choose>
								<c:when test="${k eq 1}">
									<tr>
								</c:when>
							</c:choose>
						
							<td>&nbsp;</td>
						</c:forEach>
		
						<c:forEach var = "n" begin = "1" end = "${Cal.lastDay(i,j,1)}">
							<c:choose>
								<c:when test="${Util.fontColor(Cal.dayOfWeek(i,j,1), n) eq 'red'}">
									<tr>	
								</c:when>
							</c:choose>
							
							<td>
								<c:choose>
			                		<c:when test="${(i==map.stYear&&j==map.stMonth&&n<map.stDate)||(i==map.edYear&&j==map.edMonth&&n>map.edDate)}">
				            			<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">${n}</p>
			                		</c:when>
									<c:otherwise>
						     			<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">${n}</p>
				                		<input  class="option-input checkbox" type="checkbox" name="chk" value='${Util.substring(i)}${Util.isTwoInt(j)}${Util.isTwoInt(n)}'
				                		${Util.checked(chkList, Util.substring(i),Util.isTwoInt(j),Util.isTwoInt(n))} 
				                		${Util.today(Util.substring(i),Util.isTwoInt(j),Util.isTwoInt(n))}/>
									</c:otherwise>
								</c:choose>
							</td>
							
		            		<c:choose>
								<c:when test="${Util.fontColor(Cal.dayOfWeek(i,j,1), n) eq 'blue'}">
									</tr>	
								</c:when>
							</c:choose>
						</c:forEach>
						
						<c:forEach var = "m" begin = "1" end = "${Util.blank(Cal.dayOfWeek(i,j,1),Cal.lastDay(i,j,1))}">
							<td>&nbsp;</td>
							
							<c:choose>
								<c:when test="${m eq Util.blank(Cal.dayOfWeek(i,j,1),Cal.lastDay(i,j,1))}">
									</tr>	
								</c:when>
							</c:choose>
						</c:forEach>
					</table>     
				</div>    
				</c:forEach>
			</c:forEach>
			</div>

			<div class="control_wrap">
			</div>

			</div>
		</form>
	</div>
</body>
</html>