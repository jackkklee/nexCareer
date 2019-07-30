<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 * { margin:0px; padding:0px; }
        /* Animation Canvas */
        .animation_canvas  {
            overflow:hidden;
            position:relative;           
            width:1000px; height:140px;
        }    
        /* Slider Panel */
        .slider_panel { width:5000px; position:relative; }
        .slider_image { float:left; width:199px; height:140px; padding: 1px; cursor: pointer;}    
        /* Slider Text Panel */
        .slider_text_panel { width:5000px; position:absolute; top:112px; height:15px; }
        .slider_text { 	float:left; width:199px; height:20px; 
    					font-weight: bold; font-size: 14px;    	
	   					background-color: rgba( 255, 255, 255, 0.7 );
	   					border: double 2px rgba(255,255,255,0.7); 
	   					overflow: hidden; 
  						text-overflow: ellipsis;
  						white-space: nowrap; 
        			 }  
        /* Control Panel */
        .control_panel  {
            position:absolute; top:180px; 
            left:470px; height:13px; 
            overflow:hidden; 
        }
         .control_button {
            width:12px; height:46px;
            position:relative; 
            float:left; cursor:pointer;  
            background:url('images/point_button.png');
        }
        .control_button:hover { top:-16px; }
        .control_button.active { top:-31px; }
       span.slider_text {
    width: 197px;
}
/* 슬라이더 끝 */ 

	color: black;  
	cursor: pointer;
}  
</style>
<script src="../js/jquery.js"></script>
<script type="text/javascript">

 $(function () {
    // 슬라이더를 움직여주는 함수
    function moveSlider(index) {
        // 슬라이더를 이동합니다.
        var willMoveLeft = -(index * 1000);
        $('.slider_panel').animate({ left: willMoveLeft }, 'slow');
        // control_button에 active클래스를 부여/제거합니다.
        $('.control_button[data-index=' + index + ']').addClass('active');
        $('.control_button[data-index!=' + index + ']').removeClass('active');
        $('.slider_text_panel').animate({ left: willMoveLeft }, 'slow');
        // control_button에 active클래스를 부여/제거합니다.
        $('.control_button[data-index=' + index + ']').addClass('active');
        $('.control_button[data-index!=' + index + ']').removeClass('active');
    }
    // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
    $('.control_button').each(function (index) {
        $(this).attr('data-index', index);
    }).click(function () {
        var index = $(this).attr('data-index');
        moveSlider(index);
        clearInterval(playSlide); // 버튼클릭시 랜덤이동 중지
    });
 // 초기 슬라이더 위치 지정
    playSlide = setInterval(function(index){
 	var randomNumber = Math.floor(Math.random() * 5);
    moveSlider(randomNumber);
    }, 4500);
 //랜덤이동 인터벌
});
/* 슬라이더 끝 */ 
	/* filelist출신 */
	function chk(file_num,id) {
		if (id==null || id=="")	{
			alert("로그인이 필요한 서비스입니다");
			location.href="logonForm.lo";
			return;
		}
		window.open("fileSelect.up?file_num="+file_num+"&id="+id,"", "width=650 height=500");
	}
	function chk2(file_num,id) {
		if (id==null || id=="")	{
			alert("로그인이 필요한 서비스입니다");
			location.href="logonForm.lo";
			return;
		}
		window.open("fileSelect.up?file_num="+file_num+"&id="+id,"", "width=650 height=500");
	}   
</script>
</head>
<body>
<div class="animation_canvas">
    <div class="slider_panel">
    	<c:forEach var="fileup" items="${list}">
        	<c:if test="${fileup.file_del!='y' }">
            	<button class="sub_button3" onclick="chk('${fileup.file_num}','${id}')">
            		<img src="fileSave/${fileup.file_shot }" class="slider_image"/>
            	</button>
        	</c:if>
        </c:forEach>
    </div>
    <div class="slider_text_panel">
        <c:forEach var="fileup" items="${list}">
    	    <c:if test="${fileup.file_del!='y' }">
         	    <button class="sub_button4" onclick="chk2('${fileup.file_num}','${id}')">
            		<span class="slider_text">${fileup.file_name}</span>
            	</button>
            </c:if>
	    </c:forEach>
	</div>
</div>
	<div class="control_panel">
	            <div class="control_button"></div>
	            <div class="control_button"></div>
	            <div class="control_button"></div>
	            <div class="control_button"></div>
	            <div class="control_button"></div>
	</div>
</body>
</html>