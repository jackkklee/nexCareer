<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.Select_Desc {
	
	overflow: hidden;
	white-space: normal;
	word-break: keep-all;
}
</style>

<script type="text/javascript">

 	function down(name, memPoint, filePoint)	{
		if (memPoint < filePoint)	{
			alert("잔여 포인트가 부족합니다. 충전하세요.");
			return false;
		}
		else	{
			alert("다운이 진행됩니다");
 			window.open("fileSave/"+name, '_blank');
		}
	} 	
// url로 시작하는 텍스트 오토링크
 	function autolink(id) {

 	        var container = document.getElementById(id);

 	        var doc = container.innerHTML;

 	        var regURL = new RegExp("(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)","gi");

 	        var regEmail = new RegExp("([xA1-xFEa-z0-9_-]+@[xA1-xFEa-z0-9-]+\.[a-z0-9-]+)","gi");

 	        container.innerHTML = doc.replace(regURL,"<a href='$1://$2' target='_blank'>$1://$2</a>").replace(regEmail,"<a href='mailto:$1'>$1</a>");

 	}
 	


	function chk1(file_num,id) {
		
		location.href="fileUpdateForm.up?file_num="+file_num+"&id="+id ;
	}

	function del(file_num,id) {
    	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    		location.href="fileDelete.up?file_num="+file_num+"&id="+id ;    
    	}else{   //취소
    	    return;
    	}
    	
		
	}
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


	<form action="fileDown.up" name="frm"
		onsubmit="return down('${fileup.file_upload }',${member.mem_point },${fileup.file_point })">
		<input type="hidden" name="mem_id" value="${sessionScope['id']}">
		<input type="hidden" name="file_num" value="${fileup.file_num }">
		<table border="1">
			<caption>파일 등록 정보</caption>
			<tr style="background-color: #BDBDBD;">
				<th colspan="6">${fileup.file_name }</th>
			</tr>
			<tr>
				<th>포인트</th>
				<td>${fileup.file_point }point</td>
				<th>용량</th>
				<td>${fileup.file_size/1000 }KB</td>
				<th>등록자</th>
				<td>${fileup.mem_id }</td>
			</tr>
			<tr>
				<th>파일/폴더명</th>
				<td colspan="5">${fileup.file_upload }</td>
			</tr>
			<tr>
				<td colspan="6" align="center">${fileup.file_date }</td>
				<%-- <input style="background-color: #4374D9; color: white; border: none;" type="submit" value="${fileup.file_date }"> --%>
			</tr>
			<tr>
				<th colspan="6"><img width="100%" alt="파일 없음"
					src="fileSave/${fileup.file_shot }"></th>
			</tr>
			<tr>
			
				<th colspan="6" ><pre class="Select_Desc" id="desc">${fileup.file_desc } </pre></th>
				
				
			</tr>
			<tr>
				<td colspan="6" align="center"><input
					style="background-color: #4374D9; color: white; border: none;"
					type="submit" value="내려받기"></td>
			</tr>
		</table>
		<p>
	</form>
	<script>autolink('desc');</script> <!-- 오토링크적용 -->
	
</body>

<button id="closebtn">닫기</button>

<c:if test="${sessionScope['id'] == fileup.mem_id}">
<button class="update" onclick="chk1('${fileup.file_num}','${id}')">수정</button> 
<button onclick="del('${fileup.file_num}','${id}')">삭제</button>
</c:if>

</html>