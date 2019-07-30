<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

article {
	width: 650px;
	height: 650px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}
table.fileUpForm {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
  	margin : 10px 10px;
  	font-size: 13px;
}
table.fileUpForm th {
    /* width: 147px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-bottom: 1px solid #ccc;
    border-right: 2px solid #369;

}
table.fileUpForm td {
    /* width: 349px; */
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    width: 500px;
}

</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
//카테고리 전달
  $(document).ready(function() {
	  
	   $("input[name=category]").change(function() {
		  /*  $("#cate1").val(""); */
		    $("#cate1").detach(); 
			});
		}); 

  
	//삭제버튼
	$(function() {
		$('#btn1').click(function() {
			$("span[id^='file1']").empty();
/* 			$("input[id^='file1a']").empty(); */
		});
	});
	$(function() {
		$('#btn2').click(function() {
			$("span[id^='file2']").empty();

		});
	});
	
	/* 파일전달 작동안함
	 $( document ).ready( function() {
            $("input[id^='file1a']").hide();
            $("input[id^='file2a']").hide();
            
        } );  */
            
      
	
	function chk() {
		/* var str = "분류 선택\n";
		for (var i=0; i<frm.category.length; i++)	{
			if (frm.category[i].checked)	{
				str+=frm.category[i].value+" ";
				break;
			}
		} */
		// 체크된 것이 하나기 때문에 for문 필요없음
		if (!frm.category.value)	{			
			alert("분류를 선택하세요");
			return false;
		}
	}
        //버튼
        function del(file_num,id) {
        	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        		location.href="fileDelete.up?file_num="+file_num+"&id="+id ;    
        	}else{   //취소
        	    return;
        	}
        	
    		
    	}
        $(function () {
			$('#closebtn').click(function() {
				self.close();
			});
		});

	</script>



</head>
<body>
	<!-- ====================== 사이드 메뉴 시작 ====================== -->
	<!-- ====================== 사이드 메뉴 끝 ====================== -->
<article>
	<form action="fileUpdate.up" method="post" name="frm"
		onsubmit="return chk()" enctype="multipart/form-data">
		<input type="hidden" name="mem_id" value="${sessionScope['id']}">
		
		<input type="hidden" name="file_num" value="${fileup.file_num}">
		<input type="hidden" name="file_size" value="${fileup.file_size}">
		<input type="hidden" name="file_del" value="${fileup.file_del}">
		<input type="hidden" name="file_date" value="${fileup.file_date}">
		<input type="hidden" name="file_down" value="${fileup.file_down}">
		<input type="hidden" name="category" id="cate1" value="${fileup.category}">
		<!-- id를 표현식으로 수정할 것 -->
		<table border="1" class="fileUpForm">
			<tr>
				<td colspan="2"><font size="4" style="font-weight: bold">업로드 수정</font></td>
			<tr>
				<th>파일 제목</th>
				<td><input type="text" name="file_name" required="required"
					autofocus="autofocus" size="45" value="${fileup.file_name}">
			</tr>
			<tr>
				<th>카테고리</th>
				
				<td id="cateradio">
				<c:forTokens var="n" items="도서,이미지,동영상,음악,교육,유틸,기타" 
					delims=",">
				<c:if test="${n == fileup.category }">
					<label for="c1">${n }</label> <input type="radio"
					name="category" id="c1" value="${n}" checked="checked"></c:if>
				<c:if test="${n != fileup.category }">
					<label for="c1">${n }</label> <input type="radio"
					name="category" id="c1" value="${n}" ></c:if>
				</c:forTokens>
			</td>				
			</tr>
			<tr>
				<th>파일 설명</th>
				<td><textarea name="file_desc" rows="8" cols="50"
						required="required" >${fileup.file_desc}</textarea></td>
			</tr>
			 <tr>
				<th>파일</th>
				<td><input type="file" name="file1">
					<span id="file1"><button type="button" id="btn1">현재파일</button>${fileup.file_upload}</span></td>
		
			</tr>
			<tr>
				<th>파일 스크린샷</th>
				<td><input type="file" name="file2"> 
					<span id="file2"><button type="button" id="btn2">현재파일</button>${fileup.file_upload}</span></td>
				
				<%-- <td><input type="file" name="file2">${fileup.file_shot}</td>
				<span><button type="button" id="btn2">현재파일</button></span> --%>
			</tr>
			
			<tr>
				<th>파일 포인트</th>
				<td><input type="number" name="file_point" required="required" value="${fileup.file_point}"></td>
			</tr>
			
                
		</table>
		<p align="center"><input type="submit" value="확인"></p>
		
	</form>
	<button id="closebtn">닫기</button>
	<button onclick="del('${fileup.file_num}','${id}')">삭제</button>
	
</article>

</body>
</html>