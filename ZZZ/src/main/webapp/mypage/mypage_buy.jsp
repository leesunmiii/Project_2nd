<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid page-header"></div>
	<div class="container-fluid fruite py-5">
    	<div class="container py-5">
        	<h1 class="mb-4 text-center">상품 구매 목록</h1>
            <div class="row g-4">
				<table class="table">
   					<tr>
    					<th class="text-center">번호</th>
					    <th class="text-center"></th>
					    <th class="text-center">상품명</th>
					    <th class="text-center">가격</th>
					    <th class="text-center">수량</th>
					    <th class="text-center">총구매가격</th>
					    <th class="text-center"></th>
   					</tr>
   					<c:forEach var="vo" items="${list }">
   						<tr>
						    <td class="text-center">${vo.cart_no }</td>
						    <td class="text-center">
     							<img src="${vo.gvo.poster }" style="width: 30px;height: 30px">
    						</td>
	    					<td>${vo.gvo.title }</td>
						    <td class="text-center">${vo.gvo.selling_price }</td>
						    <td class="text-center">${vo.amount }</td>
						    <td class="text-center">${vo.price * vo.amount }</td>
   						</tr>
   					</c:forEach>
 				</table>
			</div>
		</div>
	</div>
</body>
</html>