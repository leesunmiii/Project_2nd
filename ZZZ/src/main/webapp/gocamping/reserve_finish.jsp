<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div class="container">
	<div class="campingreserveOK" style="width: 70%;margin:180px auto;">
	<h2>예약내역</h2>
			<c:forEach var="vo" items="${list }">
			<table style="width:100%;height:45px;border: 1px solid;border-radius: 5px; overflow:hidden;background-color: blue;color:white;margin-bottom: 10px;">
				<tr>
					<td style="padding-left: 20px;">숙소의 확인 후 예약 확정 여부가 문자로 발송됩니다.</td>
				</tr>
			</table>
				<table class="table">
				<tr>
					<td rowspan="5" style="width: 200px;">
						<img src="${vo.gvo.poster }" style="width: 200px;height: 200px;">
					</td>
					<td style="width: 160px;">
						<h5>${vo.gvo.title }</h5>
					</td>
					<td>
						<a href="../databoard/insert.do" class="btn btn-xs btn-danger" style="width: 75px;height: 30px;font-size: 12px;">후기쓰기</a>
					</td>
				</tr>
				<tr>	
					<td colspan="2">${vo.gvo.loc }</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				</table>
			</c:forEach>
		
		<table>
		<tr>
			<th style="text-align: left; width:170px;">일정</th>
			<td>2024.01.05 ~ 2024.01.06</td>
		</tr>
		<tr>
			<th style="text-align: left;">객실타입</th>
			<td>글램핑A</td>
		</tr>
		</table>
		<hr>
		<table style="width:500px;margin-top: 10px;">
			<tr style="margin-top:10px;">
				<th style="text-align: left; font-size: 19px; width:170px;">예약정보</th>
			</tr>
			<tr style="margin-bottom:10px;">
				<td style="text-align: left;">예약번호</td>
				<td style="text-align: left;">010203124530203452</td>
			</tr>
			<tr style="margin-bottom: 10px;">
				<td style="text-align: left;">예약자 이름</td>
				<td style="text-align: left;">홍길동</td>
			</tr>
			<tr>
				<td style="text-align: left;">휴대폰 번호</td>
				<td style="text-align: left;">010-1111-1111</td>
			</tr>
		</table>
		<hr>
		<table style="width:1000px;border: 1px solid;border-collapse: collapse;">	
		<tr>
		<h2>결제정보</h2>
			<th colspan="2" ><p style="text-align: left; margin-left: 20px;">결제일시</p></th>
			<td colspan="2" style="border-right:1px solid;padding: 8px;"><p style="text-align: right;margin-right: 20px;">2024.01.04 (목) 18:40</p></td>
			<th colspan="2"><p style="text-align: left;margin-left: 20px;">상품가격</p></th>
			<td colspan="2"><p style="text-align: right;margin-right: 20px;">99,000원</p></td>
		</tr>
		<tr style="border: 1px solid; padding: 8px;">
			<th colspan="2"><p style="text-align: left;margin-left: 20px;">결제수단</p></th>
			<td colspan="2" style="border-right:1px solid;padding: 8px;margin-right: 20px;"><p style="text-align: right;">신용카드</p></td>
			<th colspan="2"><p style="text-align: left;margin-left: 20px;">결제시 포인트 사용</p></th>
			<td colspan="2"><p style="text-align: right;margin-right: 20px;">- 0p</p></td>
		</tr>
		<tr style="margin-left: 20px;border: 1px solid; padding: 8px;">
			<th colspan="4" style="border: 1px solid; padding: 8px;"></th>
			<th colspan="2"><p style="text-align: left;margin-left: 20px;">결제시 쿠폰 사용</th>
			<td colspan="2"><p style="text-align: right;margin-right: 20px;">- 0원</td>
		</tr>
		<tr style="margin-left: 20px;border: 1px solid; padding: 8px;">
			<th colspan="4" style="border-right:1px solid;padding: 8px;"></th>
			<th colspan="2"><p style="text-align: left;margin-left: 20px;">결제시 상품권 사용</th>
			<td colspan="2"><p style="text-align: right;margin-right: 20px;">- 0원</td>
		</tr>
		<tr style="margin-left: 20px;border: 1px solid; padding: 8px;">
			<th colspan="4" style="border-right:1px solid;padding: 8px;"></th>
			<th colspan="2"><p style="text-align: left; margin-left: 20px;">실 결제금액</th>
			<td colspan="2"><p style="text-align: right;margin-right: 20px;">99,000원</td>
		</tr>
		</table>
		</div>
	</div>
</body>
</html>