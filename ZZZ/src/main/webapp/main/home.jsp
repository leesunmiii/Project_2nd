<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../css/slide.css'>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
      var width = $(window).width();
      var num = $('.slide ul li').length;
      var index = 0;
      $('.slide ul li').width(width);
      
      function right(){
         if(!$('.slide ul li').is(":animated")){
            index++
            if(index == num){
               index = 0;
            }
            $('.slide ul li').eq(index-1).animate({left:"-100%"},800,function(){$(this).css("left",'100%')});
            $('.slide ul li').eq(index).animate({left:"0"},800);
            $('.index a').removeClass("index-item-on");
            $('.index a').eq(index).addClass("index-item-on");
         }
      }
      
      $('.btn-right').click(function(){
         right();
      });
      
      $('.btn-left').click(function(){
         if(!$('.slide ul li').is(":animated")){
            index--
            if(index < 0){
               index = num-1;
               $('.slide ul li').eq(0).animate({left:"100%"},800);
            }
            $('.slide ul li').eq(index).css("left",'-100%').animate({left:"0"},800);
            $('.slide ul li').eq(index+1).animate({left:"100%"},800);
            $('.index a').removeClass("index-item-on");
            $('.index a').eq(index).addClass("index-item-on");
            console.log(index);
         }
      });
     
      var start = setInterval(right,6000);
      
      $('.btn-play').click(function(){
         start = setInterval(right,6000);
      });
      
      $('.btn-pause').click(function(){
         clearInterval(start);
      });
   });
</script>
<style type="text/css">
.btn-container {
        position: absolute;
        bottom: 10px; /* 조절 가능한 여백 값 */
        left: 30%; /* 가운데 정렬을 위한 왼쪽 여백 값 */
        transform: translateX(-50%); /* 가운데 정렬을 위한 조정 */
    }
    
p{
	width:200px;
	white-space:nowrap; /*자동 줄바꿈 해제*/
	overflow:hidden; /* 초과된 글자를 감춘다 ...*/
	text-overflow: ellipsis; /*글자가 초과되는 경우 */
} 

  
</style>
</head>
<body>


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">답답할땐 바로캠핑</h4>
                        <h1 class="mb-5 display-3 text-primary">캠핑장 & 캠핑용품</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">지금 검색</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="../img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">캠핑장</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="../img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">캠핑용품</a>
                                </div>
                                
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

		<!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0 text-center display-4">캠핑장</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">
                
                <c:forEach var="vo" items="${list }">
                    <div class="border border-primary rounded position-relative vesitable-item">
                    <a href="../gocamping/detail.do?no=${vo.mno }">
                        <div class="vesitable-img">
                            <img src="${vo.poster }" style="weight:0px;height:200px;" class="img-fluid w-100 rounded-top" alt="">
                        </div>
                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Hit</div>
                        <div class="p-4 rounded-bottom">
                            <h5>${vo.title }</h5>
                            <p style="font-size: 15px;">${vo.loc }</p>
                            <div class="d-flex justify-content-between flex-lg-wrap">
                                <p class="text-dark fs-6 fw-bold mb-0" style="font-size: 12px">${vo.subtitle }</p>
                                <div class="btn-container">
                                <a href="../gocamping/detail.do?no=${vo.mno }" class="btn border border-secondary rounded-pill px-3 text-primary" style=""><i class="fa fa-check me-2 text-primary"></i>예약하기</a>
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                  </c:forEach> 
                    
                    
                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->


		<!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
            	<h1 class="text-center display-4">종류별 캠핑 용품</h1>
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">신규등록상품</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">백패킹/하이킹</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">장박추천용품</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 130px;">여행용품</span>
                                    </a>
                                </li>                     
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                    
                                      <c:forEach var="vo" items="${list1 }">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                	<a href="../store/detailex.do?cno=${vo.cno }&gno=${vo.gno }"> 
                                                	
                                                    <img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="">
                                                    </a>
                                                </div>
                                                
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>${vo.title }</h4>
                                                    <p>${vo.brand }</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${vo.original_price } / 원</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                      </c:forEach>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach var="vo" items="${list2 }">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                	<a href="../store/detailex.do?cno=${vo.cno }&gno=${vo.gno }"> 
                                                    <img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="">
                                                    </a>
                                                </div>
                                                <!-- <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div> -->
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>${vo.title }</h4>
                                                    <p>${vo.brand }</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${vo.original_price } / 원</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                      </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach var="vo" items="${list3 }">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                	<a href="../store/detailex.do?cno=${vo.cno }&gno=${vo.gno }"> 
                                                    <img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="">
                                                    </a>
                                                </div>
                                                
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>${vo.title }</h4>
                                                    <p>${vo.brand }</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${vo.original_price } / 원</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                      </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach var="vo" items="${list4 }">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                	<a href="../store/detailex.do?cno=${vo.cno }&gno=${vo.gno }"> 
                                                    <img src="${vo.poster }" class="img-fluid w-100 rounded-top" alt="">
                                                    </a>
                                                </div>
                                                
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>${vo.title }</h4>
                                                    <p>${vo.brand }</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${vo.original_price } / 원</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                      </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>                       
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->
		
		
        <!-- Featurs Section Start -->
        <!-- <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-car-side fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>얄루</h5>
                                <p class="mb-0">Free on order over $300</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>얄루</h5>
                                <p class="mb-0">100% security payment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>얄루</h5>
                                <p class="mb-0">30 day money guarantee</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>얄루</h5>
                                <p class="mb-0">Support every time fast</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Featurs Section End -->


        <!-- Featurs Start -->
        <!-- <div class="container-fluid service py-5">
            <div class="container py-5">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-secondary rounded border border-secondary">
                                <img src="../img/featur-1.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">MD`s Pick</h5>
                                        <h3 class="mb-0">20% OFF</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-dark rounded border border-dark">
                                <img src="../img/featur-2.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-light text-center p-4 rounded">
                                        <h5 class="text-primary">New</h5>
                                        <h3 class="mb-0">Free delivery</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-primary rounded border border-primary">
                                <img src="../img/featur-3.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Best</h5>
                                        <h3 class="mb-0">Discount 30$</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Featurs End -->

		        <!-- Bestsaler Product Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                    <h1 class="display-4">레시피</h1>
                    <!-- <p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p> -->
                </div>
                <div class="row g-4">
                
                
                
                
                
                  <c:forEach var="vo" items="${rList }" varStatus="s">
                   
                   <c:if test="${s.index<6 }">
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="${vo.poster }" class="img-fluid rounded-circle w-100" style="height:150px;width:300px;">
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5"><p>${vo.title }</p></a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">${vo.timee }</h4>
                                    <a href="#" class="btn border rounded-pill px-3 text-primary"> ${vo.difficulty }</a>
                                </div>
                            </div>
                        </div>
                    </div>
                   </c:if>
                   <c:if test="${s.index>=6 }">
                    <div class="col-md-6 col-lg-6 col-xl-3">
                        <div class="text-center">
                            <img src="${vo.poster }" class="img-fluid rounded" alt="" style="height:150px;width:250px;">
                            <div class="py-4">
                                <a href="#" class="h5"><p>${vo.title }</p></a>                          
                                <div class="d-flex my-3 justify-content-center">
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star text-primary"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h4 class="mb-3">${vo.timee }</h4>
                                <a href="#" class="btn border rounded-pill px-3 text-primary"> ${vo.difficulty }</a>
                            </div>
                        </div>
                    </div>
                   </c:if> 
				 </c:forEach>	
                </div>
            </div>
        </div>
        <!-- Bestsaler Product End -->
        <!-- Banner Section Start-->
		  <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
                <div class="container" style="Width:1500px;height:500px;" >
				  <h2 class="text-center">동계 캠핑 안전수칙</h2>
				  <p>  
				  <div class="slide">
				
				   <ul>
				      <li class="first">
				         <img src="../img/cam1.png" alt="1">
				      </li>
				      <li>
				         <img src="../img/cam2.png" alt="2">
				      </li>
				      <li>
				         <img src="../img/cam3.png" alt="3">
				      </li>
				      <li>
				         <img src="../img/cam4.png" alt="4">
				      </li>
				      <li>
				         <img src="../img/cam5.png" alt="5">
				      </li>
				      <li>
				         <img src="../img/cam6.png" alt="6">
				      </li>
				   </ul>
				
				   <button type="button" class="btn-left"></button>
				   <button type="button" class="btn-right"></button>
				   
				   <div class="index">
				      <a href="#" class="index-item index-item-on">1</a>
				      <a href="#" class="index-item">2</a>
				      <a href="#" class="index-item">3</a>
				      <a href="#" class="index-item">4</a>
				      <a href="#" class="index-item">5</a>
				      <a href="#" class="index-item">6</a>
				   </div>
				  
				   <div class="controller">
				      <button type="button" class="btn-play">재생</button>
				      <button type="button" class="btn-pause">정지</button>
				   </div>
				</div>
			  </div>
            </div>
        </div>
        <!-- Banner Section End -->

        <!-- Fact Start -->
        <!-- <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>satisfied customers</h4>
                                <h1>1963</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality of service</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality certificates</h4>
                                <h1>33</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>Available Products</h4>
                                <h1>789</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Fact Start -->


        <!-- Tastimonial Start -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                    <h4 class="text-primary">Customer review</h4>
                    <h1 class="display-5 mb-5 text-dark">고객 후기</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">오늘에서야 이런곳을 알게 되어 한탄스러워요
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="../img/gom2.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">sunmi</h4>
                                    <p class="m-0 pb-3">25</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">좋은 사이트입니다 캠핑 관련 기능들이 모두 모아져있다니 ..
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="../img/gom1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">garong</h4>
                                    <p class="m-0 pb-3">22</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">상품이 설명한 것과 똑같았고 너무 좋아요!
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="../img/gom3.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">hyeon</h4>
                                    <p class="m-0 pb-3">34</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->
</body>
</html>