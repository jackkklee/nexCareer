<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// DOM 생성 완료 시 화면 숨김 (파라미터로 전달되는 id는 제외)
		hideExclude("changeM");
		// radio change 이벤트
		$("input[name=radioName]").change(function() {
			var radioValue = $(this).val();
			if (radioValue == "M") {
				hideExclude("changeM");
			} else if (radioValue == "I") {
				hideExclude("changeI");
			} else if (radioValue == "H") {
				hideExclude("changeH");
			}
		});
		// 서버에서 전달 받은 값으로 radio 버튼 변경
		$("#changeUpdateRadio").click(function() {
			var resultValue = $("#radioId").val();
			$("input[name=radioName][value=" + resultValue + "]").attr("checked", true);
		});
		// 체크 되어 있는지 확인
		var checkCnt = $("input[name=radioName]:checked").size();
		if (checkCnt == 0) {
			// default radio 체크 (첫 번째)
			$("input[name=radioName]").eq(0).attr("checked", true);
		}
	});
	// text area 숨김
	function hideExclude(excludeId) {
		$("#changeTextArea").children().each(function() {
			$(this).hide();
		});
		// 파라미터로 넘겨 받은 id 요소는 show
		$("#" + excludeId).show();
	}
</script>
</head>
<body>

	<div id="radioArea">
		<input type="radio" name="radioName" value="M" />mWeb
		<input type="radio" name="radioName" value="I" />inApp
		<input type="radio" name="radioName" value="H" />HTML5
	</div>

	<input type="hidden" id="radioId" value="I">

	<br /><br />

	<div id="changeTextArea">
		<div id="changeM">
			<span>this is M area</span>
			<p>mobile web</p>
		</div>
		<div id="changeI">
			<span>this is I area</span>
			<p>inapp</p>
		</div>
		<div id="changeH">
			<span>this is H area</span>
			<p>html5</p>
		</div>
	</div>

	<div id="buttonArea">
		<input type="button" id="changeUpdateRadio" value="서버에서 받은 버튼 값으로 radio 체크 위치 변경">
	</div>

</body>
</html>