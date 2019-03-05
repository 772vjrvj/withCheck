<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Imotion</title>
<style type="text/css">
	div{
      margin: auto;
      text-align: center;
      
	}
	
	table{
   	  border: 1px solid black;
      margin: auto;
      border-collapse: collapse;
   }
   tr{
      border: 1px solid black;
      width:80px;
      height:35px;
      text-align: center;
      padding-top:5px;
      padding-bottom:5px;
   }
   td{
   	  border: 1px solid black;
      height: 32px;
      text-align: left;
      padding-top: 5px;
      padding-bottom: 5px;
      width:100px;
      height:100px;
   }
   
   input{
      width:100px;
      height:100px;
   
   }
    body{
	  	position: absolute; 
   	  	background: url("img/background.jpg") fixed center center;   
   	  	background-size: cover;  
    	width: 100%; 
    	height: 100%; 
	}
	a{
	font-size: 20px;
	}
</style>
<script type="text/javascript">

	var totalData = 500;    // 총 데이터 수
	var dataPerPage = 25;    // 한 페이지에 나타낼 데이터 수
	var pageCount = 5;        // 한 화면에 나타낼 페이지 수

	$("document").ready(function(){        
	    paging(totalData, dataPerPage, pageCount, 1);
	});

    function paging(totalData, dataPerPage, pageCount, currentPage){
        
        console.log("currentPage : " + currentPage);
        
        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수 500/25= 20개          1페이지당 25개 총 20페이지  페이지 그룹 4개   
        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹  1	1/5(2/5...5/5 = 1 1구릅)   (6/5....10/5) 2구릅 .... ceil 올림
        console.log("pageGroup : " + pageGroup);
        
        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = pageCount*(pageGroup-1)+1;    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;
        
        console.log("last : " + last);
        console.log("first : " + first);
        console.log("next : " + next);
        console.log("prev : " + prev);
 
        var $pingingView = $("#paging");
        
        var html = "";
        
        if(prev > 0)
            html += "<a href=# id='prev'>◀</a> ";
        
        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }
        
        if(last < totalPage)
            html += "<a href=# id='next'>▶</a>";
        
        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "black");
        $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                           "color":"red", 
                                           "font-weight":"bold"});    // 현재 페이지 표시
                                           
                   
                                           
         var pageStartNum = dataPerPage*(currentPage-1)+1;
         var pageEndNum = currentPage*dataPerPage;
         $("tbody").empty();
         var $tr="";

         for(var i = pageStartNum; i <=pageEndNum; i++){
        	 
        	 if(i%5 == 1){
        		 $tr=$('<tr>').append($('<td>').html("<input type='image'  src=\'icon/Shape "+ i+".png\' onclick=\"ff(\'icon/Shape " + i+".png\')\">"));
        	 }else if(i%5 == 0 ||i==pageEndNum){
        		 $tr.append($('<td>').html("<input type=\'image\'   src=\'icon/Shape "+ i+".png\'" +  "onclick=\"ff(\'icon/Shape "+ i+".png\')\">")).appendTo('tbody');

        	 }else{
        		 $tr.append($('<td>').html("<input type=\'image\'   src=\'icon/Shape "+ i+".png\'" +  "onclick=\"ff(\'icon/Shape "+ i+".png\')\">"));
        	 }

         }
                                                                       
                                           
        $("#paging a").click(function(){

            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            
            
            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
                                           
    }

</script>



<script type="text/javascript">




	function ff(ts){
		opener.document.getElementById("image").src=ts;
		opener.document.getElementsByName("photo")[0].value=ts;
		close();
	}
	
	
	
	
	
</script>
</head>
<body>
<table>
<tbody></tbody>

</table>
	<div id="paging">1</div>
</body>
</html>