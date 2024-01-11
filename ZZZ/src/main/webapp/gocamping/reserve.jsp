<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.left-reserve{
margin-top: 180px;
margin-left: 40px;

}
.right-reserve{
margin-top: 150px;
margin-left: 100px;
}

.paylist:hover{
	cursor: pointer;
    background-color: #81C408; /* 어두운 효과를 위한 배경색 */
    opacity: 70%;
}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">


//페이지 B (데이터를 읽어오는 페이지)
document.addEventListener('DOMContentLoaded', function () {
    // 로컬 스토리지에서 데이터 읽어오기
    let checkinDate = localStorage.getItem('reserve_room_checkin');
    let checkoutDate = localStorage.getItem('reserve_room_checkout');
    let checkinperson = localStorage.getItem('reserve_person');
    let checkinaddperson = localStorage.getItem('reserve_person2'); // 추가 인원
    let checkinaddprice2 = localStorage.getItem('reserve_add_price'); // 추가인원금액
    let reserveperson = localStorage.getItem('reserveperson');
    console.log("checkinDate(reserve.jsp):", checkinDate);
 
    
    
    
    // 읽어온 데이터를 원하는 요소에 적용
    document.getElementById('reserve_room_checkin').innerText = checkinDate;
    document.getElementById('reserve_room_checkout').innerText = checkoutDate;
    document.getElementById('reserve_person').innerText = checkinperson;
    document.getElementById('reserve_person2').innerText = checkinaddperson;
    document.getElementById('reserve_add_price').innerText = checkinaddprice2;
  
    
});


//====================================================



document.addEventListener('DOMContentLoaded', function () {
	// 추가 금액 (reserve_add_price)과 방 가격 (roomvo.roomprice) 가져오기
	var personaddprice = document.getElementById('reserve_add_price').innerText;
	var roomprice = document.getElementById('reserve_room_price').innerText;
	console.log("personaddprice(추가인원금액):",personaddprice);
	console.log("roomprice(객실가격):",roomprice);

	// '원' 제거하고 쉼표(,) 제거한 후 숫자로 변환
	var personaddpricechange = parseInt(personaddprice.replace(/원/g, '').replace(/,/g, ''), 10);
	var roomPricechange = parseInt(roomprice.replace(/원/g, '').replace(/,/g, ''), 10);

	// 두 값을 더하기
	totalPrice = personaddpricechange + roomPricechange;

	// 결과를 sumprice에 표시
	document.getElementById('sumprice').innerText = totalPrice.toLocaleString() + '원';
	
	console.log("totalPrice:", totalPrice);
});

var IMP = window.IMP; // 생략 가능
IMP.init("imp80366116"); // 예: imp00000000

function requestPay() {
	console.log('clicked');
	
  // IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    
	        /*
	            'kakaopay':카카오페이,
	            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
	            'nice':나이스,
	            'jtnet':jtnet,
	            'uplus':LG유플러스
	        */
	    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${campingvo.title}',
	    amount : totalPrice,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        let mno=${campingvo.mno}
	        let loc='${campingvo.loc}'
	        let person=$('#reserve_person').text();
	        let price=$('#sumprice').text();
	        let reserve_date1=$('#reserve_room_checkin').text(); // 입실날짜
			let reserve_date2=$('#reserve_room_checkout').text(); // 퇴실날짜
	        let title='${campingvo.title }' // 캠핑장이름
	        
			
			
			$.ajax({
	    	type:'post',
	    	url:'../gocamping/reserve_before.do',
	    	data:{"mno":mno,"loc":loc,"person":person,"price":price,"reserve_date1":reserve_date1,"reserve_date2":reserve_date2,"title":title},
	    	success:function(result)
	    	{
	    		// 마이페이지 이동 
	    		if(result=='yes')
	    		{
	    			location.href="../gocamping/reserve_finish.do"
	    		}
	    		else
	    		{
	    			alert("구매가 완료되었습니다")
	    			
	    			
	    		}
	    		
	    	}
	    })
	    }
	});
}

</script>
</head>
<body>
	<div class="container">
	<table>
	<tr>
	<td width="50%">
		<div class="left-reserve">
		     <table>
			     <tr>
			     	<td><h4>예약자 정보</h4></td>
			     </tr>
			     <tr>
			     	<td>예약자 이름</td>
			     </tr>
				     <c:if test="${sessionScope.id!=null }">
					     <tr>
					       	<td><input type="text" size=50 class="input-sm" name="id" id="reserveid" style="height: 42px;border-radius: 5px;" value="${sessionScope.name }"><!-- 읽기만 :readonly --></td>
					     </tr>
					     <tr>
					      	<td>휴대폰번호</td>
					    </tr>
					     <tr>
					       <td><input type="text" size=15 class="input-sm" name="phone" id="phone" style="height: 42px;border-radius: 5px;" value="${sessionScope.phone }"></td>
					     </tr>
					     <tr>
			               <td>예약인원</td>
			            </tr>
			            <tr>
					       <td id="reserve_person" style="height: 42px;border-radius: 5px;"></td>
					     </tr>
					     <tr>
					      <td>요청사항</td>
					     </tr>
					     <tr>
					       <td><textarea rows="3" cols="50" name="content"></textarea></td>
					     </tr>
				     </c:if>
					  
					  
					  <c:if test="${sessionScope.id==null }">
					     <tr>
					       	<td><input type="text" size=50 class="input-sm" name="id" id="reserveid" style="height: 42px;border-radius: 5px;" readonly><!-- 읽기만 :readonly --></td>
					     </tr>
					     <tr>
					      	<td>휴대폰번호</td>
					    </tr>
					     <tr>
					       <td><input type="text" size=15 class="input-sm" name="phone" id="phone" style="height: 42px;border-radius: 5px;" readonly></td>
					     </tr>
					     <tr>
			               <td>예약인원</td>
			            </tr>
			            <tr>
					       <td id="reserve_person" style="height: 42px;border-radius: 5px;" readonly></td>
					     </tr>
					     <tr>
					      <td>요청사항</td>
					     </tr>
					     <tr>
					       <td><textarea rows="3" cols="50" name="content" readonly></textarea></td>
					     </tr>
					     </c:if>		     
			     
		    </table>
		   <hr>
		     <table>
			    <tr>
			    	<td><h3>결제수단</h3></td>
			    </tr>
			    <tr>
			    <td>&nbsp;</td>
			    </tr>
			    <tr>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height: 50px; margin-left: 10px; text-align: center; background-image: url('../img/kakaopay.png'); background-size: 80px; background-position: center center; background-repeat: no-repeat;border: 1px solid; border-color: rgb(204,204,204);transition: background-color 0.1s;"></div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height: 50px; margin-left: 10px; text-align: center; background-image: url('../img/tosspay.png'); background-size: 80px; background-position: center center; background-repeat: no-repeat;border: 1px solid; border-color: rgb(204,204,204);"></div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px;height:50px;line-height: 35px;margin-left: 10px;text-align: center;border: 1px solid; border-color: rgb(204,204,204);">신용/체크카드</div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height: 50px; margin-left: 10px; text-align: center; background-image: url('../img/kbpay.png'); background-size: 80px; background-position: center center; background-repeat: no-repeat;border: 1px solid; border-color: rgb(204,204,204);"></div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height: 50px; margin-left: 10px; text-align: center; background-image: url('../img/naverpay.png'); background-size: 80px; background-position: center center; background-repeat: no-repeat;border: 1px solid; border-color: rgb(204,204,204);"></div></td>
			    	
			    </tr>
				    <tr>
					    <td>&nbsp;</td>
			    	</tr>
			    <tr>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height: 50px; margin-left: 10px; text-align: center; background-image: url('../img/payco.png'); background-size: 80px; background-position: center center; background-repeat: no-repeat;border: 1px solid; border-color: rgb(204,204,204);"></div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height:50px;line-height: 35px;margin-left: 10px;text-align: center;border: 1px solid; border-color: rgb(204,204,204);">법인카드</div></td>
			    	<td><div class="btn btn-md btn-default paylist" style="width: 150px; height:50px;line-height: 35px;margin-left: 10px;text-align: center;border: 1px solid; border-color: rgb(204,204,204);">휴대폰결제</div></td>
			    </tr>
		    </table> 
			
		</div>
		</td>
		<td width="50%">
		<div class="right-reserve">
		<h5>캠핑장 정보</h5>
			<table class="table" style=" width: 320px; border-radius: 10px; font-size: 13px;">
			<tr>
		     	<th colspan="2" id="reserve_title">${campingvo.title }</th>
		     </tr>
		     <tr>
		    	 <td colspan="2">
		     		<img src="${campingvo.poster }" style="height: 150px;width: 290px;border-radius: 20px;">
		     	</td>
		     </tr>
		     <tr>
		     	<th style="width:40%;">객실</th>
		      	<td style="width:60%;">${roomvo.roomname }</td>
		     </tr>
		      <tr>
		      	<th style="width:40%;">선택한 날짜</th>
            	<td style="width:60%;"><span id="reserve_room_checkin" readonly></span> ~ <span id="reserve_room_checkout" readonly></span></td>
		     </tr>
		     <tr>
		     	<th style="width: 40%;">기준인원</th>
		      	<td style="width:60%;">${roomvo.roompersonnel } / ${roomvo.roommaxpersonnel }(추가요금)</td>
		      </tr>
		     <tr>
		     <c:if test="${sessionScope.id!=null }">
		     	<td colspan="2"><div class="btn btn-md btn-primary" style="width: 250px;margin-left: 20px;" onclick="requestPay()">결제하기</div></td>
		     </c:if>
		     <c:if test="${sessionScope.id==null }">
		     	<td colspan="2"><div class="btn btn-md btn-primary" style="width: 250px;margin-left: 20px;background-color: gray;border-color:gray;">결제하기</div></td>
		     </c:if>
		     </tr>
		     </table>
		     <table style="width: 300px;">
			     <tr>
			     	<td colspan="3"><h3>결제금액</h3></td>
			     </tr>
			     <tr>
			     	<th style="width:70%;">예약금액</th>
			     	<th style="width:10%">&nbsp;&nbsp;</th>
			     	<td style="width:20%;text-align: right;" id="reserve_room_price">${roomvo.roomprice }</td>
			     </tr>
			     <tr>
			     	<th style="width:70%;">추가금액</th>
			     	<td style="width:10%; white-space: nowrap;"><span id="reserve_person2"></span></td>
			     	<td style="width:30%;text-align: right;"><span id="reserve_add_price"></span></td>
			     </tr>
			     <tr>
			     	<td colspan="3"><hr></td>
			     </tr>
			     <tr>
			     	<th style="width:50%;">총 결제금액</th>
			     	<th style="width:10%">&nbsp;&nbsp;</th>
			     	<td style="width:40%; text-align: right; white-space: nowrap; font-size: 25px; font-weight: bold; color: #ff4081;" id="sumprice"></td>
			     </tr>
		     </table>
		
		</div>
		 </td>
		 </tr>
		</table>
 </div>

</body>
</html>