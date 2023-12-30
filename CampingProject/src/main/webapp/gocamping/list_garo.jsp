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
   margin-left: 60px;
   margin-right: 40px;
   margin-top: 40px;
}
.content{
	margin-top: 42px;
}
.text{
	font-size: 14px;
}
</style>
</head>
<body>
  <div class="row">
    <!-- <h1 class="text-center">캠핑장</h1> -->
    
    
    <c:forEach var="vo" items="${list }">
     <div class="col-md-4">
       <div class="thumbnail">
         <a href="../store/detail_before.do?no=${vo.mno }">
           <img src="${vo.poster }" title="${vo.title }" style="width:300px; height:200px">
           <hr> 
         </a>
       </div> 
     </div>   
     <div class="col-md-8">
      <div class="content">
       <h5 class="text-left">${vo.title }</h5><br>
      </div>
      <div class="text">
       <h6 class="text-left">${vo.subtitle }</h6><br>
       <p class="text-left">${vo.loc }</p><br>
       <p class="text-left">${vo.num }</p><br>
       </div>
       <hr>
      
     </div>  
   </c:forEach>     
        
      
   
   
   
   
   
  </div>
  <div style="height: 20px"></div>
  <div class="row">
    <div class="text-center">
      <a href="../store/all.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
      ${curpage } page / ${totalpage } pages
      <a href="../store/all.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
    </div>
  </div>
  <div style="height:20px"></div>
  <h3>최근 방문 상품</h3>
  <hr>
  <c:if test="${count==0 }">
  	방문기록이 없습니다.
  </c:if>
  <c:if test="${count!=0 }">
  	<c:forEach var="vo" items="${cList }">
  		<img src="${vo.goods_poster }" style="width:100px;height: 100px;margin-left:10px">
  	</c:forEach>
  </c:if>
</body>
</html>