<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row g-4 justify-content-center">
                                <c:forEach var="vo" items="${list }">
                                    <div class="col-md-6 col-lg-6 col-xl-4">
                                        <div class="rounded position-relative fruite-item" style="width: 306px;height: 387px; border: 1px solid #ffb524; border-collapse: collapse;">
                                            <div class="fruite-img">
                                            <a href="../gocamping/before_detail.do?no=${vo.mno }">
                                                <img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="" style="width: 306px;height: 204px;"></a>
                                            </div>
                                            <!-- <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
                                            <div class="p-4 border-top-0 rounded-bottom">
                                            <a href="../gocamping/before_detail.do?no=${vo.mno }">
                                                <h5>${vo.title }</h5>
                                                <p>${vo.loc }</p></a>
                                                <div class="d-flex justify-content-between flex-lg-wrap">
                                                    <a href="../gocamping/before_detail.do?no=${vo.mno }" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-info-circle me-2 text-primary"></i>상세보기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
</body>
</html>