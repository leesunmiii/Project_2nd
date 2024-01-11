<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<style type="text/css">
/* .row{
  margin: 0px auto;
  width: 100%
} */
.rdays:hover{
  cursor: pointer;
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//날짜를 형식화하는 함수
function formatDate(date) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    return new Intl.DateTimeFormat('ko-KR', options).format(date).replace(/\./g, '');
}
//초기에 공백으로 설정
$('#room-check-in').html('&nbsp;');
$('#room-check-out').html('&nbsp;');

$(function(){
    $('.rdays').click(function(){
        let year = $(this).attr("data-year");
        let month = $(this).attr("data-month");
        let day = $(this).text();
        
        // 현재 날짜
        let currentDate = new Date(year, month - 1, day);

        // 하루 뒤 날짜 계산
        let nextDay = new Date(currentDate);
        nextDay.setDate(currentDate.getDate() + 1);

        // 결과 문자열 생성
        let rday = formatDate(currentDate);
        let rday2 = formatDate(nextDay);
        
        console.log("currentDate:", rday);
        console.log("nextDay:", rday2);
        
        $('#room-check-in').text(rday);
        $('#room-check-out').text(rday2);
        
        localStorage.setItem('reserve_room_checkin', rday);
        localStorage.setItem('reserve_room_checkout', rday2);
        
    });
});


$(function() {
    $('#roomoption').change(function() {
        let selectedRoom = $(this).val();
        let rname;
        var roomNo1 = '${roomvo1.roomno}';
        var roomNo2 = '${roomvo2.roomno}';
        var roomNo3 = '${roomvo3.roomno}';
        var roomNo4 = '${roomvo4.roomno}';
        var roomNo5 = '${roomvo5.roomno}';

        switch (selectedRoom) {
            case 'room1':
                rname = roomNo1;
                break;
            case 'room2':
                rname = roomNo2;
                break;
            case 'room3':
                rname = roomNo3;
                break;
            case 'room4':
                rname = roomNo4;
                break;
            case 'room5':
                rname = roomNo5;
                break;
            default:
                rname = '';
                break;
        }

        console.log('Selected Room:', selectedRoom);
        console.log('Room No 1:', roomNo1);
        console.log('Room No 2:', roomNo2);
        console.log('Room No 3:', roomNo3);
        console.log('Room No 4:', roomNo4);
        console.log('Room No 5:', roomNo5);
        console.log('Final Room Name:', rname);

        // 예약 링크를 동적으로 생성
        let reserveLink = '../gocamping/reserve.do?gocampingno=' + ${vo.mno} + '&roomno=' + rname;

        // 예약 링크를 속성으로 설정
        $('#reserveLink').attr('href', reserveLink);

        // 예약 링크를 콘솔에 출력 (테스트용)
        console.log('Reserve Link:', reserveLink);
    });
});

$(function() {
    $('#person-option').change(function() {
        let selectedPerson = $(this).val();
        let rname;
        var personNo2 = '2명';
        var personNo3 = '3명';
        var personNo4 = '4명';
        var personNo5 = '5명';
        var personNo6 = '6명';
        
        var personadd2 = '+0명';
        var personadd3 = '+1명';
        var personadd4 = '+2명';
        var personadd5 = '+3명';
        var personadd6 = '+4명';
        
        var personaddprice2 = '0원';
        var personaddprice3 = '15,000원';
        var personaddprice4 = '30,000원';
        var personaddprice5 = '45,000원';
        var personaddprice6 = '60,000원';

        switch (selectedPerson) {
            case 'person2':
                pname = personNo2;
                pprice = personaddprice2;
                addperson = personadd2;
                break;
            case 'person3':
                pname = personNo3;
                pprice = personaddprice3;
                addperson = personadd3;
                break;
            case 'person4':
                pname = personNo4;
                pprice = personaddprice4;
                addperson = personadd4;
                break;
            case 'person5':
                pname = personNo5;
                pprice = personaddprice5;
                addperson = personadd5;
                break;
            case 'person6':
                pname = personNo6;
                pprice = personaddprice6;
                addperson = personadd6;
                break;
            default:
                pname = '';
            	pprice = '';
            	addperson = '';
                break;
        }
        localStorage.setItem('reserve_person', pname);
        console.log("pname(인원):", pname);
       
        localStorage.setItem('reserve_person2', addperson);
        console.log("addperson(추가인원명수):", addperson);
        
        localStorage.setItem('reserve_add_price', pprice);
        console.log("pprice(추가인원금액):", pprice);
    });
});

</script>
</head>
<body>
  	<div class="reserve-space" style="text-align: center;">
    <div class="text-center"><h3>${year }년도 ${month }월</h3></div>
    <div class="calendar" style="border: 1px solid; border-radius: 10px; overflow:hidden;height: 246px;">
    <table class="table" style="margin: 0px auto;">
	    <tr class="danger">
	      <c:forEach var="strWeek" items="${strWeek }">
	        <td class="text-center">${strWeek }</td>
	      </c:forEach>
	      <c:set var="week" value="${week }"/>
	      <c:forEach var="i" begin="1" end="${lastday }">  
		       <c:if test="${i==1 }">
		        <tr>
		         <td class="text-center">&nbsp;</td>
		       </c:if>
		        <c:if test="${rday[i]==1}">
		         <td class="text-center rdays" style="background-color:black;color:white" data-year="${year }" data-month="${month }">${i }</td>
		        </c:if>
		        <c:if test="${rday[i]==0}">
		         <td class="text-center">${i }</td>
		        </c:if>
		        <c:set var="week" value="${week+1 }"/>
		        <c:if test="${week>6 }">
		          <c:set var="week" value="0"/>
		          </tr>
		          <tr>
		        </c:if>
	      </c:forEach>
	    </tr>
  	</table>
  </div>
  <br>
  <table class="reserveinfo" style="width: 400px;margin-left: 20px;">
	  <div class="checkinout">
	  <tr style="border-top: 1px solid;">
	  	<td width="50%" class="text-center" style="font-size: 10px;border-right: 1px solid;border-left: 1px solid;"> 체크인 </td>
	  	<td width="50%" class="text-center" style="font-size: 10px;border-right:1px solid;" > 체크아웃 </td>
	  </tr>
	  <tr style="border-bottom: 1px solid;">
	  	<td width="50%" id="room-check-in" class="text-center" style="border-right: 1px solid;border-left: 1px solid;">&nbsp;</td>
	  	<td width="50%" id="room-check-out" class="text-center" style="border-right:1px solid;">&nbsp;</td>
	  </tr>
	  <tr>
	  <td colspan="2" class="text-center" style="font-size: 10px;border-right:1px solid;border-left: 1px solid;">객실</td>
	  </tr>
	  <tr>
		  <td colspan="2" class="text-center" style="border-bottom:1px solid;border-right:1px solid;border-left: 1px solid;">
			   <select id="roomoption" style="width: 300px;" class="text-center">
	            <option value="room1">${roomvo1.roomname}</option>
	            <option value="room2">${roomvo2.roomname}</option>
	            <option value="room3">${roomvo3.roomname}</option>
	            <option value="room4">${roomvo4.roomname}</option>
	            <option value="room5">${roomvo5.roomname}</option>
	        </select>
		  </td>
	  </tr>
	  <tr>
	  	<td colspan="2" class="text-center" style="font-size: 10px;border-right:1px solid;border-left: 1px solid;">인원</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="text-center" style="border-bottom:1px solid;border-right:1px solid;border-left: 1px solid;">
	        <select id="person-option" style="width: 300px;" class="text-center">
		      	<option value="person2">2명</option>
		      	<option value="person3">3명</option>
		      	<option value="person4">4명</option>
		      	<option value="person5">5명</option>
		      	<option value="person6">6명</option>
		      </select>
	    </td>
	</tr>
  </table>
  <br>
  <%-- <a href="../gocamping/reserve.do?gocampingno=${vo.mno }&roomno=${#room_name}"> --%>
  <a id="reserveLink" href="">
  <div class="btn btn-md btn-primary" style="width: 300px;margin-left: 20px;">예약하기</div></a>
  

  </div>
  
</body>
</html>