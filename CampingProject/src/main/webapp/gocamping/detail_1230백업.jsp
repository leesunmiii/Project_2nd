<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</html>
<head> <!-- CSS / JavaScript => 없는 경우에는 생략이 가능 -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

<style type=text/css>
.container{
	position: relative;
	overflow: hidden;
	margin-left:30px;
	/* margin:10px 10px 10px 10px 
 			  top right bottom left */
 }
.detail-left
{
margin-top : 140px;
float: left;
margin-left: 20px;
}
.detail-right
{
margin-top : 180px;
float: right;
}
.detailcontent{
margin-top:140px;
}


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
} 

#partialContent{
	overflow: hidden;
}
.overflow-hide {
	overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	z-index: 1000;
}


.detailhidenavbar {
  display: none;
  justify-content: space-between; /* 탭 사이의 간격을 조절하려면 필요에 따라 수정하세요 */
  background-color: #81c408;
  color:white;
  width: 1100px;
  height:35px;
  z-index: 1000;
  transition:0.5s;
  
}

.navbar2 {
  list-style: none;
  padding: 0;
  margin-left:30px;
  display: flex;
}

.navbar2 a{
	color: white;
	z-index: 1001;
}

.navbar2 li {
  margin-right: 10px; /* 각 탭 사이의 간격을 조절하려면 필요에 따라 수정하세요 */
}

 .roominformationbox,.roominfomationbigbox {
        border: 1px solid #ddd; /* 테두리 스타일 및 색상 설정 */
        border-radius: 20px; /* 테두리를 둥글게 만듭니다. 값은 상황에 맞게 조절하세요. */
        padding: 10px; /* 텍스트와 테두리 간격 조절을 위한 내부 여백 */
    }
.camping-review img{
	width: 200px;
}

#campingreview {
    scroll-margin-top: -1200px; /* 원하는 만큼의 여백을 설정하세요 */
}
</style>
</head>
<body> <!-- // 화면 UI -->
	<div class=container>
	<div class="detail-left">
	<!-- =======================================================================================================================위쪽 -->
		<div class="row"> 
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
		         	<img src="plus.png" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);width:50px;height:50px;opacity: 0.8;" class="img-button">
		        </div>
		      </td>
		    </tr>

		  </table>
		</div>

<!-- 맨 위 사진 배치 끝 ###################################################################################################################################  -->	
		    
		<nav class="detailhidenavbar">
			<ul role="tablist" class="navbar2">
				<li>
					<a href="#camping-info">숙소이용정보</a>
				</li>
				<li>
					<a href="#campingroom">객실</a>
				</li>
				<li>
					<a href="#campingroom-info">객실정보<a>
				</li>
				<li>
					<a href="#campingreview">후기</a>
				</li>
			</ul>
		</nav>
<!--  밑에 내용 시작 ############################################################################################################################# -->

		
		 <div class="row">
			<div class=col-sm-8 style="width:600px;">
			
				<h2>${vo.title }&nbsp;<span style="color:orange"></span></h2>
				<h5><span style="color:orange">${vo.subtitle }&nbsp;<span style="color:black"></span></h5>
				  

				<hr>

				  
				<div class="content-container" id="contentContainer">
					<div class="explain" style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
						<br>
					  	<p id="partialContent">${vo.explain}</p>
					  	<p id="fullContent" style="display:none">${vo.explain}</p>
					</div>	
					<button onclick="showPopup()">더보기</button>
					  
					<div id="popup" class="popup">
	   					${vo.explain}
						<button onclick="hidePopup()">닫기</button>
					</div>
				</div>
				
				<br>
				<hr>
				
				<table class=table style="width:600px;">
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
					<tr id="camping-info">
						<th width=30%>예약방법</th>
						<td width=70%>${vo.reserve }</td>
					</tr>
					<tr>
						<th width=30%>주변이용가능시설</th>
						<td width=70%>${vo.facility }</td>
					</tr>
				</table>
			
       <!-- ====================================================================================== -->
				<%-- <div class=AAA  id="camping-info">
					<img src="${vo.poster }" style="width:600px;height:400px" class=img-rounded>
				</div> --%>
	   <!-- ====================================================================================== -->		
				<br>
				<hr>
				<br>
						
				<h5 >숙소 이용 정보</h4>
				<br>
				<h6>공지사항</h6>
				<div class="infoo">
					<ul id="noticeList">
						<script>
							// infovo.etc 내용 가져오기
							var etcContent = "${infovo.notice}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						   // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("noticeList").appendChild(listItem);
						    }
						  </script>
						</div>
						<br>
						
						<h6>기본정보</h6>
						<div class="infoo">
						  <ul id="infoList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.info}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						   // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("infoList").appendChild(listItem);
						    }
						  </script>
						  </ul>
						</div>
						
						<br>
						
						<h6>공지사항</h6>
						<div class="infoo" id="campingroom">
						  <ul id="roominfoList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.roominfo}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						   // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("roominfoList").appendChild(listItem);
						    }
						  </script>
						</div>
						
						<br>
						<hr>
						<br>
	<!-- 객실 ######################################################################################## -->
				<div class="container3">
				<h5>객실</h5>
				<table class="roominfomationbigbox">
				<tr>
					<td rowspan="5" style="padding-right: 20px;">
						<img src="${roomvo.a_room1 }" style="width: 100%; height: 100%; margin-left: 10px;">
					</td>
					<td class="roominformationbox">
						<h6>${roomvo.a_roomname}</h6><p style="font-size: 12px;">${roomvo.a_personnel}(${roomvo.a_maxpersonnel})</p>
						<p style="font-size: 12px;">${roomvo.a_checkin}</p>
						<p style="font-size: 12px;">${roomvo.a_checkout}</p>
						<p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo.a_price}</p>
						<div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
					</td>	
				</tr>
				</table>
				
				<table class="roominfomationbigbox">
				<tr>
					<td rowspan="5" style="padding-right: 20px;">
						<img src="${roomvo.b_room1 }" style="width: 100%; height: 100%; margin-left: 10px;">
					</td>
					<td class="roominformationbox">
						<h6>${roomvo.a_roomname}</h6><p style="font-size: 12px;">${roomvo.b_personnel}(${roomvo.b_maxpersonnel})</p>
						<p style="font-size: 12px;">${roomvo.b_checkin}</p>
						<p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo.b_price}</p>
						<div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
					</td>	
				</tr>
				</table>
				
				
				<table class="roominfomationbigbox">
				<tr>
					<td rowspan="5" style="padding-right: 20px;">
						<img src="${roomvo.c_room1 }" style="width: 100%; height: 100%; margin-left: 10px;">
					</td>
					<td class="roominformationbox">
						<h6>${roomvo.c_roomname}</h6><p style="font-size: 12px;">${roomvo.c_personnel}(${roomvo.c_maxpersonnel})</p>
						<p style="font-size: 12px;">${roomvo.c_checkin}</p>
						<p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo.c_price}</p>
						<div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
					</td>	
				</tr>
				</table>
				
				<table class="roominfomationbigbox">
				<tr>
					<td rowspan="5" style="padding-right: 20px;">
						<img src="${roomvo.d_room1 }" style="width: 100%; height: 100%; margin-left: 10px;">
					</td>
					<td class="roominformationbox" >
						<h6>${roomvo.d_roomname}</h6><p style="font-size: 12px;">${roomvo.d_personnel}(${roomvo.d_maxpersonnel})</p>
						<p style="font-size: 12px;">${roomvo.d_checkin}</p>
						<p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo.d_price}</p>
						<div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
					</td>	
				</tr>
				</table>
				
				<table class="roominfomationbigbox" id="campingroom-info">
				<tr>
					<td rowspan="5" style="padding-right: 20px;">
						<img src="${roomvo.e_room1 }" style="width: 100%; height: 100%; margin-left: 10px;">
					</td>
					<td class="roominformationbox">
						<h6>${roomvo.e_roomname}</h6><p style="font-size: 12px;">${roomvo.e_personnel}(${roomvo.e_maxpersonnel})</p>
						<p style="font-size: 12px;">${roomvo.e_checkin}</p>
						<p class="roomname" style="padding-left:180px;font-size:15px;white-space: nowrap;">${roomvo.e_price}</p>
						<div class="btn btn-sm btn-info" style="margin-left: 170px;white-space: nowrap;">예약하기</div>
					</td>	
				</tr>
				</table>
				
				</div>

			<br>
			<hr>
			<br>
	<!-- ######################################################################################## -->				
				<h5 >객실정보</h5>
				<br>
				<h6>인원 추가 정보</h6>
				<div class="infoo">
					<ul id="personnelList"></ul>
					<script>
						// infovo.etc 내용 가져오기
						var etcContent = "${infovo.personnel}";
							
						// ||로 구분된 내용을 배열로 분할
						var etcArray = etcContent.split("||");
							
						// 각 내용을 <li> 태그로 생성하여 추가
						for (var i = 0; i < etcArray.length; i++) 
						{
							var listItem = document.createElement("li");
							listItem.innerHTML = etcArray[i];
								
							// 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
							listItem.style.marginBottom = "12px";
								      
							// 생성한 <li> 태그를 ul#etcList에 추가
							document.getElementById("personnelList").appendChild(listItem);
						}
					</script>
				</div>
				
				<br>
						
				<h6>캠핑 서비스</h6>
					<div class="infoo">
						<ul id="serviceList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.service}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) 
						    {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						      // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("serviceList").appendChild(listItem);
						    }
						  </script>
						</div>
						<br> 
						
						<h6>바비큐 시설</h6>
						<div class="infoo">
						  <ul id="bbqList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.bbq}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) 
						    {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						   	  // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("bbqList").appendChild(listItem);
						    }
						  </script>
						</div>
						<br> 
						
						<h6>취소 및 환불 규정</h6>
						<div class="infoo">
						  <ul id="cancleList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.cancle}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) 
						    {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						      // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("cancleList").appendChild(listItem);
						    }
						  </script>
						</div>
						<br> 
						
						
						<h6>확인사항 및 기타</h6>
						<div class="infoo" id="campingreview">
						  <ul id="etcList"></ul>
						  <script>
						    // infovo.etc 내용 가져오기
						    var etcContent = "${infovo.etc}";
						
						    // ||로 구분된 내용을 배열로 분할
						    var etcArray = etcContent.split("||");
						
						    // 각 내용을 <li> 태그로 생성하여 추가
						    for (var i = 0; i < etcArray.length; i++) 
						    {
						      var listItem = document.createElement("li");
						      listItem.innerHTML = etcArray[i];
						
						      // 생성한 <li> 태그에 margin-bottom 스타일 추가 (예: 10px)
						      listItem.style.marginBottom = "12px";
						      
						      // 생성한 <li> 태그를 ul#etcList에 추가
						      document.getElementById("etcList").appendChild(listItem);
						    }
						  </script>
						</div>
						<br> 	
				</div>
				
<!-- 오른쪽 달력 부분 ################################################################################################ -->			
					
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
							<a href="../gocamping/list.do?page=${listcurpage }" class="btn btn-xs btn-primary">목록</a>
						</td>
					</tr>	
				</table>
			</div> 
			</div>
				
		</div> <!-- row 끝 -->
		<div class="row">
		<div class="camping-review">
	
			<h5>후기</h5>
				<br>
				<hr>
				<br>
				<table>
					<div class="review-photo">
						<tr>
							<td>
								<img src="../img/campingreview.png">
							</td>
							<td>
								<img src="../img/campingreview.png">
							</td>
							<td>
								<img src="../img/campingreview.png">
							</td>
							<td>
								<img src="../img/campingreview.png">
							</td>
							<td>
								<img src="../img/campingreview.png">
							</td>
						</tr>
					</div>
					</table>
					
					<hr>
					
					
					<div class="review-text">
					<table>	
						<tr>
							<td colspan="5">
								<p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<p>여기에 글 출력 에ㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔㅔ</p>
							</td>
						</tr>
					</table>
			</div>
		</div>
		</div>

	
	
	
<!--row 끝 ########################################################################################### -->
		
		
		
		
	</div> <!-- detail-left 끝 -->
	
<div class="detail-right" style="border: 1px solid black; border-collapse: collapse; padding: 10px;">
    <table style="border-collapse: collapse;">
        <tr>
            <td>
                <h6 class="text-center">최근 본 캠핑장</h6>
            </td>
        </tr>
        <tr>
            <td style="padding: 10px; border: 1px solid black; border-collapse: collapse;">
                <img src="../img/campingreview.png" style="width: 100px;">
                <p class="text-center">첫번째</p>
            </td>
        </tr>
        
        <tr>
         	<td style="height: 10px;"></td> <!-- 여기에 간격 조절 -->
        </tr>
        
        <tr>
            <td style="padding: 10px; border: 1px solid black; border-collapse: collapse;">
                <img src="../img/campingreview.png" style="width: 100px;">
                <p class="text-center">두번째</p>
            </td>
        </tr>
        
        <tr>
        	<td style="height: 10px;"></td> <!-- 여기에 간격 조절 -->
        </tr>
  
        <tr>
            <td style="padding: 10px; border: 1px solid black; border-collapse: collapse;">
                <img src="../img/campingreview.png" style="width: 100px;">
                <p class="text-center">세번째</p>
            </td>
        </tr>
    </table>
</div>


	
		
	 
	 
</div> <!-- container 끝-->
<!-- 오른쪽 #################################################################################### -->
	

<script>
  // JavaScript 함수 정의
  function redirectToPage(url) {
    window.location.href = url;
  }
  // #####################################################################캘린더
window.addEventListener('scroll', function() {
    var menu = document.querySelector('.detailhidenavbar');
    var calendar = document.querySelector('.calendar');
    var review = document.querySelector('.camping-review');
    var scrollY = window.scrollY || window.pageYOffset;

    // 스크롤 위치에 따라 .detailhidenavbar 표시/숨김
    if (scrollY > 400) {
        menu.style.position = 'fixed';
        menu.style.display = 'block';
        menu.style.top = '98px';
        menu.style.right = '280px';

        calendar.style.position = 'static'; // .detailhidenavbar가 나타날 때 calendar는 static으로 설정
    } else {
        menu.style.display = 'none';
    }

    // 스크롤 위치에 따라 .calendar 표시/숨김
    if (scrollY > 450) {
        // .review 엘리먼트가 화면에 나타날 때까지 calendar의 위치를 고정시킴
        //이 코드에서 review.offsetTop은 .review 엘리먼트의 문서 맨 위에서의 세로 위치를 나타냅니다. 
        //window.innerHeight는 현재 브라우저 창의 높이를 나타냅니다. 
        //따라서 scrollY > (review.offsetTop - window.innerHeight)은 .review 엘리먼트가 화면에 나타나는 순간을 감지합니다.
        if (scrollY < (review.offsetTop - window.innerHeight)) {
            calendar.style.position = 'fixed';
            calendar.style.top = '143px';  // .review가 나타나기 전까지 고정된 위치로 설정
            calendar.style.right = '332px';
        } else {
            // .review 엘리먼트가 화면에 나타난 경우, calendar의 위치를 absolute로 변경하여 .review에 겹치지 않도록 함
            calendar.style.position = 'absolute';
            calendar.style.top = (review.offsetTop - calendar.clientHeight) - 90 + 'px';
            calendar.style.right = '143px';
        }
    } else {
        calendar.style.position = 'static';
    }
});

// 페이지 로딩 시 초기 위치 설정
window.addEventListener('load', function() {
    var menu = document.querySelector('.detailhidenavbar');
    menu.style.display = 'none';
});

// 캘린더 끝  ####################################################### 
  

function showPopup() {
    document.getElementById('popup').style.display = 'block';
}

function hidePopup() {
    document.getElementById('popup').style.display = 'none';
}



 
  
  
</script>
</body>
</html>
