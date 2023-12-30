<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<html>
<head> <!-- CSS / JavaScript => 없는 경우에는 생략이 가능 -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

<style type=text/css>
.container{
	/* margin-top:20px; */
	position: relative;
	overflow: hidden;
	
	/* margin:10px 10px 10px 10px 
 			  top right bottom left */
 }
 
 /* .row{
	margin:0px auto;
	width:1000px
}  */

a{
	margin-left:5px
}
.img-button:hover {
    cursor: pointer;
    opacity: 0.8;
  }
.table img:hover{
  cursor: pointer;
    opacity: 0.8;
  }
 .calendar{
	top:480px;
	right: 200px;
	width: 400px;
	height: 500px;
	margin-left: 30px; 
 	position:fixed;
} 
.detailcontent{
	margin-top:140px;
	margin-left:135px;
	
}
#partialContent{
	overflow: hidden;
}

</style>
</head>
<body> <!-- // 화면 UI -->
	<div class=container mx-auto>
	<div class="detailcontent">
	<!-- =======================================================================================================================위쪽 -->
		<div class="col-md-6"> 
		  <table class="table" style="border-collapse: collapse;">
		    <tr>
		      <td rowspan="2">
		      	<a href="../gocamping/detail_picture.do">
		        <img src="${vo.poster}" style="width:600px;height:400px;border-radius: 20px;" class="img-rounded">
		      </td>
		      
		      <td>
		      	<a href="../gocamping/detail_picture.do">
		        <img src="https://gocamping.or.kr/${vo.pic1}" style="width:200px;height:190px;border-radius: 20px;" class="img-rounded">
		      </td>
		      
		      <td>
		      	<a href="../gocamping/detail_picture.do">
		        <img src="https://gocamping.or.kr/${vo.pic2}" style="width:200px;height:190px;border-radius: 20px;" class="img-rounded">
		      </td>
		    </tr>
		    <tr>
		      <td>
		      	<a href="../gocamping/detail_picture.do">
		        <img src="https://gocamping.or.kr/${vo.pic3}" style="width:200px;height:190px;border-radius: 20px;" class="img-rounded">
		      </td>
		      
		      <td>
		      	<div style="position: relative;"><!-- 버튼을 이미지 위에 위치시키기 위해 position: absolute; 사용 -->
		      		<a href="../gocamping/detail_picture.do">
		        	<img src="${vo.picc5}" style="width:200px;height:190px;border-radius: 20px;" class="img-rounded">
		        	<a href="../gocamping/detail_picture.do">																						
		         	<img src="plus.png" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:50px;height:50px;opacity: 0.8;" class="img-button"><!--  onclick="redirectToPage('your_destination_page_url.html')"-->
		        </div>
		      </td>
		    </tr>
		  </table>
		</div>
	
<!-- ======================================================================================================================= -->

		<div class=containerr >
		 <div class="row">
			<div class=col-sm-8 style="width:600px;">
				<table class=table style="width:600px;">
					<tr>
						<h2>${vo.title }&nbsp;<span style="color:orange"></span></h2>
					</tr>
					<tr>
						<h5><span style="color:orange">${vo.subtitle }&nbsp;<span style="color:black"></span></h5>
					</tr>
				
					<tr>
						<th width=30%>주소</th>
						<td width=70%>${vo.loc }</td>
					</tr>
					<tr>
						<th width=30%>문의처</th>
						<td width=70%>${vo.num }</td>
					</tr>
					<tr>
						<th width=30%>캠핑장 환경</th>
						<td width=70%>${vo.envir }</td>
					</tr>
					<tr>
						<th width=30%>캠핑장 유형</th>
						<td width=70%>${vo.category }</td>
					</tr>
					<tr>
						<th width=30%>운영기간</th>
						<td width=70%>${vo.season }</td>
					</tr>
					<tr>
						<th width=30%>운영일</th>
						<td width=70%>${vo.openclose }</td>
					</tr>
				
					<tr>
						<th width=30%>홈페이지</th>
						<td width=70%>${vo.homepage }</td>
					</tr>
					<tr>
						<th width=30%>예약방법</th>
						<td width=70%>${vo.reserve }</td>
					</tr>
					<tr>
						<th width=30%>주변이용가능시설</th>
						<td width=70%>${vo.facility }</td>
					</tr>
					
				</table>
			
				<div class=AAA>
					<img src="${vo.poster }" style="width:600px;height:400px" class=img-rounded>
				</div>
				
				<%-- <div class=explain>
					<h3>숙소정보</h3><br>
					<p>${vo.explain }</p>
				</div> --%>
				
				<div class="content-container" id="contentContainer">
				  <%-- <div class="explain">
				    <h3>숙소정보</h3><br>
				    <p id="partialContent">${vo.explain.substring(0, 150)}</p> <!-- 처음 150자만 표시 -->
				    <p id="fullContent" style="display:none">${vo.explain}</p> <!-- 전체 내용은 숨겨둠 -->
				    <button onclick="showMore()">더보기</button> <!-- 더보기 누르면 전체내용 보임-->
				  </div> --%>
				  
				  <hr>
				  <div class="explain" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
				  	<h3>숙소정보</h3><br>
				  	<p id="partialContent">${vo.explain}</p>
				  	<p id="fullContent" style="display:none">${vo.explain}</p>
				  </div>	
				  	<button onclick="openPopup()">더보기</button>
				  
				</div>
			</div>
			
			
			<div class=col-sm-4>
			<div class=calendar>
				<table>
					<tr>
						<td>날짜</td>
					</tr>
					<tr>
						<td>
						<img src="${vo.picc1 }" style="width:400px;height:400px" >
						</td>
					</tr>
					<tr>
						<td>
							<a href=# class="btn btn-xs btn-danger">좋아요♡</a>
							<a href=# class="btn btn-xs btn-success">찜하기</a>
							<a href="../gocamping/list.do" class="btn btn-xs btn-primary">목록</a>
						</td>
					</tr>	
				</table>
			</div> 
			</div>
		</div>
	</div>
	</div>
</div> 
<script>
  // JavaScript 함수 정의
  function redirectToPage(url) {
    window.location.href = url;
  }
  
  // 스크롤 이벤트 감지
  window.addEventListener('scroll', function() {
    var calendar = document.querySelector('.calendar');
    var scrollY = window.scrollY || window.pageYOffset;

    // 스크롤 위치에 따라 position 변경
    if (scrollY > 490) { // 200은 예시로 조절 가능한 값
      calendar.style.position = 'fixed';
      calendar.style.top = '105px'; // 조절 가능한 값
      calendar.style.right = '195px'; // 조절 가능한 값
    } else {
      calendar.style.position = 'relative';
      calendar.style.top = 'auto';
      calendar.style.right = 'auto';
    }
  });
  
//페이지 로딩 시 초기 위치 설정
  window.addEventListener('load', function() {
    var calendar = document.querySelector('.calendar');
    calendar.style.position = 'static'; // 수정: 초기 위치에는 일반적인 문서 흐름을 따르도록 static으로 변경
    calendar.style.top = 'auto';
    calendar.style.right = 'auto';
  });
  
 /*  // 더보기 버튼 누르면 전체내용 보이기
  function showMore() {
	    var partialContent = document.getElementById('partialContent');
	    var fullContent = document.getElementById('fullContent');
	    var contentContainer = document.getElementById('contentContainer');

	    partialContent.style.display = 'none'; // 일부 내용 감추기
	    fullContent.style.display = 'block'; // 전체 내용 보이기
	    contentContainer.removeChild(document.querySelector('button')); // 버튼 제거
	  } */
  
 // 팝업창

  function openPopup() {
   /*  var fullContent = 'vo.explain'; // 전체 내용 */
    var popupWindow = window.open('', '_blank', 'width=600,height=400');

    // 팝업 창에 내용 추가
    popupWindow.document.write('<html><head><title>전체 내용</title></head><body>');
    popupWindow.document.write('<h3>전체 내용</h3>');
    popupWindow.document.write('<p>' + fullContent + '</p>');
    popupWindow.document.write('</body></html>');
    popupWindow.document.close();
  }

</script>
</body>
</html>
	
</body>
</html>