<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 .thumbnail{
   margin-left: 30px;
   margin-right: 30px;
   margin-top: 50px;
} 

.thumbnail img {
    border-radius: 15px; 
    display: block;
    width: 100%;
    height: auto;
}
.content{
	margin-top: 42px;
}
.text{
	font-size: 14px;
}
.row{
	margin-left: 60px;
    margin-right: 60px;
}
.listcontent{
	margin-top: 140px;
}

/* Pagination */
.pagination {
    display: inline-block;
    text-align: center;
    clear: both;
    white-space: nowrap; /* 강제로 줄바꿈 방지 */
}

.pagination ul {
    list-style: none;
    margin: 0;
    padding: 0;
    text-align: center; /* 각 li를 가운데 정렬하기 위해 ul에 text-align 적용 */
}

.pagination li {
    display: inline-block;
    margin: 0 2px 0 0;
}

.pagination li:last-child {
    margin-right: 0;
}

.pagination a,
.pagination strong {
    display: block;
    padding: 5px 11px;
    border: 1px solid;
    font-weight: normal;
}
</style>
</head>
<body>
<div class="listcontent">
  <div class="row">
    <!-- <h1 class="text-center">캠핑장</h1> -->
    
    
    <c:forEach var="vo" items="${list }">
     <div class="col-md-3">
       <div class="thumbnail">
         <a href="../gocamping/detail.do?no=${vo.mno }">
           <img src="${vo.poster }" title="${vo.title }" style="width:300px;height:200px ">
           <div class="caption">
             <p class="text-center">${vo.title }</p>
             <p>${vo.loc }</p>
           </div>
         </a>
        </div>
      </div>
   </c:forEach>
  
  
  
  

 
  
  <%-- 페이지 (이전-다음) --%>
   <%--  <div class="text-center">
      <a href="../gocamping/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
      ${curpage } page / ${totalpage } pages
      <a href="../gocamping/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
    </div> --%>
    
    
    <%-- 수업시간 내용 --%>
   <%-- <div class="inline">
   <nav class="pagination">
        <ul>
          <c:if test="${startPage>1 }"><li><a href="../gocamping/list.do?page=${startpage-1 }">&laquo; 이전</a></li></c:if>
          <c:forEach var="i" begin="${startPage }" end="${endpage }"><li><a href="../gocamping/list.do?page=${i }" class="${curpage==i?"active rounded":"rounded" }">${i }</a></li></c:forEach>
          <c:if test="${endpage<totalpage }"><li><a href="../gocamping/list.do?page=${endpage+1 }">다음 &raquo;</a></li></c:if>
        </ul>
   </nav>
	</div> --%>
	
	 <div class="pagination">
	    <c:if test="${startpage > 1 }"><li><a href="../gocamping/list.do?page=${startpage-1}" class="rounded">&laquo;</a></li></c:if>
	    <c:forEach var="i" begin="${startpage }" end="${endpage }">
	        <li><a href="../gocamping/list.do?page=${i}" class="${curpage==i?'active rounded':'rounded'}">${i }</a></li>
	    </c:forEach>
	    <c:if test="${endpage < totalpage }"><li><a href="../gocamping/list.do?page=${endpage+1}" class="rounded">&raquo;</a></li></c:if>
	</div>
     
  
  
  <div style="height:20px"></div>
  <h3>최근 방문 상품</h3>
  <hr>
  <c:if test="${count==0 }">
  	방문기록이 없습니다.
  </c:if>
  <c:if test="${count!=0 }">
  	<c:forEach var="vo" items="${cList }">
  		<img src="${vo.poster }" style="width:100px;height: 100px;margin-left:10px">
  	</c:forEach>
  </c:if>
</div>
</div>
</body>
</html>