<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판도라 박스에 오신 것을 환영합니다</title>
<style type="text/css">
article {
	width: 650px;
	height: 800px;
	float: left;
	margin-left: 5px;
	margin-top: 10px;
	border-radius: 10px;
}

#tframe {
	width: 1000px;
	height: 170px;
	border: none;
	clear: both;
}

#weather {
	width: 200px;
	height: 170px;
	border: none;
	position: absolute;
}

#slide {
	width: 1000px;
	height: 140px;
	margin-left: 15px;
	/* border: 2px solid red; */
	clear: both;
}

#disp {
	width: 650px;
	height: 800px;
}

#top {
	text-align: right;
	font-size: 12px;
	height: 20px;
	background-color: #EAEAEA;
}

#logo {
	width: 120px;
	height: 40px;
	float: left;
	margin-top: 30px;
	margin-left: 230px;
}

#search {
	margin-left: 80px;
	margin-top: 30px;
	float: left;
	border: 3px solid navy;
	width: 486px !important;
	height: 23px !important;
}

#category {
	width: 90%;
	margin-top: 20px;
	float: left;
}

#category ul {
	margin-left: 10px;
	text-align: center;
	float: center;
	list-style-type: none;
}

#category ul li {
	display: inline;
	margin: 20px;
	font-size: 16px;
}

#category ul li a {
	text-decoration: none;
	color: black;
}

#category ul li a:visited {
	display: inline;
	margin: 20px;
	font-size: 16px;
	background-color: #5882FA;
	text-decoration: none;
}

#category ul li a:hover {
	color: grey;
}

button.sub_button {
	background-color: white;
	color: black;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	border-style: hidden;
	border-radius: 10px;
}

button.top_button {
	color: black !important;
	cursor: pointer !important;
	font-size: 11px !important;
	font-weight: bold !important;
	border-style: hidden !important;
	border-radius: 10px !important;
}

.cursor {
	cursor: pointer;
}

#footer {
	width: 1000px;
	text-align: right;
	font-size: 8px;
	font-weight: lighter;
	clear: both;
	background-color: #EAEAEA;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	/* 미들 바 */
	$(document).ready(function() {	
		$.post('fileListSlide.up', 'category=' + $('#btn').val(),
		/* frm.category.value */
		function(data) {		$('#slide').html(data);		});
		/* 		return false; */
		/* 검색 페이징 끝 */
		$.post('fileList.up', 'category=' + $('#btn').val(), function(data) {
			//$('#disp').html(data);
			$('#disp').html(data);
		});
		$('#submit').click(function() {
			var sendData = $('#form').serialize();
			$.post('fileSearch.up', sendData,/* frm.cate.value */
			function(data) {
				$('#disp').html(data);
			});
			return false;
		});
	});
	$.post('weather.up', function(data) {
		$("#weather1").html(data);
	});

	function chk(file_num, id) {
		if (id == null || id == "") {
			alert("로그인이 필요한 서비스입니다");
			location.href = "logonForm.lo";
			return;
		}
		window.open("fileSelect.up?file_num=" + file_num + "&id=" + id, "",
				"width=500 height=600");
	}
	/* 페이징 시작 */
	function a1(ca, n) {
		$('#disp').load("fileList.up?category=" + ca + "&pageNum=" + n);
	}
	function a2(ca, n) {
		$('#disp').load("fileList.up?category=" + ca + "&pageNum=" + n);
	}
	function a3(ca, n) {
		$('#disp').load("fileList.up?category=" + ca + "&pageNum=" + n);
	}
	/* 페이징 끝 */

	/* 검색 페이징 시작 */
	function s1(ca, sub, key, n) {
		$('#disp').load(
				"fileSearch.up?cate=" + ca + "&subject=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	function s2(ca, sub, key, n) {
		$('#disp').load(
				"fileSearch.up?cate=" + ca + "&subject=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	function s3(ca, sub, key, n) {
		$('#disp').load(
				"fileSearch.up?cate=" + ca + "&subject=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	/* 요청게시판 페이징 시작 */
 	function r1(n) {
		$('#disp').load(
				"reqBoardList.up?pageNum=" + n);
	}
	function r2(n) {
		$('#disp').load(
				"reqBoardList.up?pageNum=" + n);
	}
	function r3(n) {
		$('#disp').load(
				"reqBoardList.up?pageNum=" + n);
	} 
	/* 자유게시판 페이징 시작 */
	function f1(n, sub, key) {
		$('#disp').load(
				"list.rb?search=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	function f2(n, sub, key) {
		$('#disp').load(
				"list.rb?search=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	function f3(n, sub, key) {
		$.post("list.rb","search="+sub+"&keyword="+key+"&pageNum="+n, function(data) {
			$('#disp').html(data);
		});
	}
	function f4(n, sub, key) {
		$.post("list.rb","search="+sub+"&keyword="+key+"&pageNum="+n, function(data) {
			$('#disp').html(data);
		});
	}
	function f5(n, sub, key) {
		$('#disp').load(
				"list.rb?search=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	function f6(n, sub, key) {
		$('#disp').load(
				"list.rb?search=" + sub + "&keyword="
						+ key + "&pageNum=" + n);
	}
	

	$(function() {
		$('#repl_Board').click(function() {
			$.post('list.rb', 
			function(data) {
				$('#disp').html(data);
			});
		});
		$('#btn0').click(function() {
			$.post('fileList.up', 'category=' + $('#btn0').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn').click(function() {
			$.post('fileList.up', 'category=' + $('#btn').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn1').click(function() {
			$.post('fileList.up', 'category=' + $('#btn1').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});

			return false;
		});
		$('#btn2').click(function() {
			$.post('fileList.up', 'category=' + $('#btn2').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn3').click(function() {
			$.post('fileList.up', 'category=' + $('#btn3').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn4').click(function() {
			$.post('fileList.up', 'category=' + $('#btn4').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn5').click(function() {
			$.post('fileList.up', 'category=' + $('#btn5').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#btn6').click(function() {
			$.post('fileList.up', 'category=' + $('#btn6').val(),/* frm.category.value */
			function(data) {
				//$('#disp').html(data);
				$('#disp').html(data);
			});
			return false;
		});
		$('#chargeForm').click(function() {
			$.post('chargeForm.do', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#mypage').click(function() {
			$.post('myPage.up', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#chargeF').click(function() {
			$.post('chargeForm.do', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#chargeForm1').click(function() {
			$.post('chargeForm.do', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#request').click(function() {
			$.post('reqBoardList.up', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#myPage1').click(function() {
			$.post('myPage.up', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#vipApplyForm').click(function() {
			$.post('vipApplyForm.up', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#fileUploadForm').click(function() {
			$.post('fileUploadForm.up', function(data) {
				$('#disp').html(data);
			});
			return false;
		});
		$('#request2').click(
			function() {
				$.post('reqBoardList.up', 'writer=' + $('#request2').val(),
						function(data) {
							$('#disp').html(data);
						});
				return false;
			});
	});
</script>
</head>
<body>
	<div id="tframe">
		<div id="weather1">
	</div>
		<div id="top">
			또다른 세상의 시작. 판도라의 상자가 열리다.&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="chargeForm" class="top_button">캐시 충전</button>
			||
			<button id="mypage" class="top_button">내정보 관리</button>
		</div>
		<div id="logo">
			<a href="main.do"><img alt="" src="images/2010.jpg" width="180px"></a>
		</div>
		<div id="search">
			<form action="" name="frm" method="post" id="form">
				<select style="height: 22px" name="cate" id="cate">
					<optgroup label="카테고리">
						<option value="">전체</option>
						<option>도서</option>
						<option>이미지</option>
						<option>동영상</option>
						<option>음악</option>
						<option>교육</option>
						<option>유틸</option>
					</optgroup>
				</select> <select style="height: 22px" name="subject" id="subject">
					<optgroup label="선택">
						<option value="file_name">제목</option>
						<option value="mem_id">판매자</option>
					</optgroup>
				</select> <input type="text" name="keyword" id="keyword" size="35"
					placeholder="검색한 후에 새로운 정렬기능을 이용해 보세요" required="required"> <input
					type="submit" id="submit" value="검색">
			</form>
		</div>
		<div id="category">
			<ul>
				<li><button id="b" name="category" class="sub_button"></button></li>
				<li><button id="btn0" name="category" value="Top15"
						class="sub_button">Top15</button></li>
				<li><button id="btn" class="sub_button">전체</button></li>
				<li><button id="btn1" name="category" value="도서"
						class="sub_button">도서</button></li>
				<li><button id="btn2" name="category" value="이미지"
						class="sub_button">이미지</button></li>
				<li><button id="btn3" name="category" value="동영상"
						class="sub_button">동영상</button></li>
				<li><button id="btn4" name="category" value="음악"
						class="sub_button">음악</button></li>
				<li><button id="btn5" name="category" value="교육"
						class="sub_button">교육</button></li>
				<li><button id="btn6" name="category" value="유틸"
						class="sub_button">유틸</button></li>
			</ul>
		</div>
	</div>
	<!-- =========================tframe 끝================================== -->
	<div id="slide"></div>
	<!-- ====================== 사이드 메뉴 시작 ====================== -->
	<jsp:include page="../logon/logonSide.jsp"></jsp:include>
	<!-- ====================== 사이드 메뉴 끝 ====================== -->
	<article>
		<div id="disp"></div>
	</article>
	<div id="footer">
		(주) 판도라 웹하드 | 서울시 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:이지운 <br> /
		TEL:02-561-1911 / FAX:02-538-2613
	</div>
</body>
</html>