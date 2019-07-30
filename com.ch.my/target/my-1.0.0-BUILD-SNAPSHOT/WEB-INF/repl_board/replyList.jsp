<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rDelete(bno, rno) {
		var sendData="bno="+bno+"&rno="+rno;
		$.post('rDelete.rb', sendData, function(data) {
			alert("삭제 되었습니다");
			$('#rbdListDisp').html(data);
			
		});
		}
	function rUpdate(bno,rno) {
		var txt =$('#td_'+rno).text();
		$('#td_'+rno).html(
				'<textarea rows="3" cols="30" id="rt">'+txt+'</textarea>');
		$('#btn_'+rno).html(
			'<button onclick="up('+bno+','+rno+
					')"	class="btn btn-sm btn-danger">확인</button>'+
			'<button onclick="lst('+bno+
					')"	class="btn btn-sm btn-info">취소</button>'
		);
	}
	function up(bno, rno) {
		var sendData="replytext="+$('#rt').val()+
		"&bno="+bno+"&rno="+rno;
		$.post('rUpdate.rb', sendData, function(data) {
			alert('댓글 수정 되었습니다');
			
			$('#rbdListDisp').html(data);
		});
	}
	function lst(bno) {
	
		$('#rbdListDisp').load('replyList.rb?bno='+bno);
		
	}
</script>
<style type="text/css">
#sidemenu {
	width: 250px;
	height: 400px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	text-align: center;
	background-color: white;
}
</style>
</head><body>
<div class="container" align="center" style="width: 800; text-align: left; float: left;">
<c:if test="${not empty rbdList }">
<table class="table table-striped" style="width: 800; text-align: left; float: left;">
	<tr><td>작성자</td><td>내용</td><td>수정일</td><td></td></tr>
<c:forEach var="rbd" items="${rbdList}">
	<c:if test="${rbd.del=='y'}">
		<tr><td colspan="4">삭제된 댓글입니다</td></tr>
	</c:if>
	<c:if test="${rbd.del!='y'}">
		<tr>
			<td>${rbd.replyer}</td>
			<td id="td_${rbd.rno}">${rbd.replytext}</td>
			<td>${rbd.updatedate}</td>
			<!-- 원래는 댓글작성자와 로그인한 사람과 비교 -->
			<c:if test="${rbd.replyer != member.mem_name}">
				<td></td>
			</c:if>
			<c:if test="${rbd.replyer == member.mem_name}">
				<td id="btn_${rbd.rno}">
					<button class="btn btn-sm btn-warning"
					onclick="rUpdate(${rbd.bno},${rbd.rno})">수정</button>
					<button class="btn btn-sm btn-danger"
					onclick="rDelete(${rbd.bno},${rbd.rno})">삭제</button>
				</td>
			</c:if>
		</tr>
	</c:if>
</c:forEach>	
</table>
</c:if>	
</div>
</body>
</html>