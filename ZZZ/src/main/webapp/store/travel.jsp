<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h4{
	width:200px;
	white-space:nowrap; /*자동 줄바꿈 해제*/
	overflow:hidden; /* 초과된 글자를 감춘다 ...*/
	text-overflow: ellipsis; /*글자가 초과되는 경우 */
} 
</style>
</head>
<body>
	<div class="col-lg-9">
    	<div class="row g-4 justify-content-center">
        	<c:forEach var="vo" items="${list }">
            	<div class="col-md-6 col-lg-6 col-xl-4">
                	
                    	<div class="fruite-img">
                        	<a href="../store/detail.do?cno=${vo.cno }&gno=${vo.gno}">
                            	<img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="">
                            </a>
                        </div>
                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                        	<h4>${vo.title }</h4>
                            <p>${vo.brand }</p>
                            <div class="d-flex justify-content-between flex-lg-wrap">
                            	<p class="text-dark fs-5 fw-bold mb-0">판매가: ${vo.original_price }</p>
                                <!-- <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a> -->
                            </div>
                        </div>
                    
                  </div>
             </c:forEach>
             <div class="col-12">
			     <div class="pagination d-flex justify-content-center mt-5">
                 	<c:if test="${startPage>1 }">
                    	<a href="new.do?page=${startPage-1}" class="rounded">&laquo;</a>
                    </c:if>
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                    	<a href="new.do?page=${i}" class="${curpage==i?"active rounded":"rounded" }">${i }</a>	
                    </c:forEach>
                    <c:if test="${endPage<totalpage }">
                    	<a href="new.do?page=${endPage+1}" class="rounded">&raquo;</a>
                    </c:if>
                  </div>
              </div>
    	</div>     
	</div>
</body>
</html>