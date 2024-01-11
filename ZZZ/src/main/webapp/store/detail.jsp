<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
      
      <!-- 동우 CSS -->
      <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<script type="text/javascript">
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp11661825"); // 예: imp00000000
		function requestPay() {
			console.log('clicked');
		  // IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    
			        /*
			            'kakao':카카오페이,
			            'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
			            'nice':나이스,
			            'jtnet':jtnet,
			            'uplus':LG유플러스
			        */
			    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : $('#title').text(),
			    amount : $('#price').attr("data-price"),
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
			        
			        let price=$('#price').attr("data-price")
					let count=$('#sel').val()
					let no=$('#cart').attr("data-no")
					let type=$('#cart').attr("data-type")
					
					$.ajax({
					type:'post',
					url:'../store/cart_buy.do',
					data:{"no":no, "count":count, "price":price, "type":type},
					success:function(result)
					{
						// 마이페이지 이동
						if(result=='yes')
						{
							location.href="../mypage/mypage_buy.do"
						}
						else
						{
							alert("구매 실패하셨습니다!!")
						}
					}
				})
					
			    }
			});
		}
		
		$(function(){
			$('#sel').change(function(){
				let price=$('#price').attr("data-price")
				let count=$(this).val()
				let total=Number(price)*Number(count)
				$('#total').text(total)
			})
			
			$('#cart').click(function(){
				let price=$('#price').attr("data-price")
				let count=$('#sel').val()
				let no=$(this).attr("data-no")
				let type=$(this).attr("data-type")
				/*let msg="가격: " + price + "\n"
				      + "수량: " + count + "\n"
				      + "상품번호: " + no + "\n"
				      + "테이블번호: " + type
				alert(msg)*/
				
				$.ajax({
					type:'post',
					url:'../store/cart_insert.do',
					data:{"no":no, "count":count, "price":price, "type":type},
					success:function(result)
					{
						// 마이페이지 이동
						if(result=='yes')
						{
							location.href="../mypage/mypage_cart.do"
						}
						else
						{
							alert("장바구니에 데이터 추가가 안됩니다!!")
						}
					}
				})
			}) // 장바구니에 넣을것
			
			$('#buy').click(function(){
				requestPay()
			})
		})
		
		</script>

      
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="../css/style.css" rel="stylesheet">
        
        <!-- 동우 부분 -->
        
    </head>

    <body>

        <!-- Spinner Start -->
        <!-- <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div> -->
        <!-- Spinner End -->


        <!-- Navbar start -->
        
        <!-- Navbar End -->


        <!-- Modal Search Start -->
      
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        
        <!-- Single Page Header End -->

        <!-- Single Product Start -->
        <div class="col-lg-8 col-xl-9">
            <div class="row g-4">
            	<div class="col-lg-6">
                	<div class="border rounded">
                       <a href="#">
                           <img src="${vo.poster }" class="img-fluid rounded" alt="Image">
                        </a>
                    </div>
              	</div>
                <div class="col-lg-6">
                	<h4 class="fw-bold mb-3" id="title">${vo.title }</h4>
                    <del>
                       <p class="mb-3">정가: ${vo.original_price } 원</p>
                    </del>
                    <h5 class="fw-bold mb-3" id="price" data-price="${vo.selling_price }">판매가: ${vo.selling_price } 원</h5>
                    <div class="d-flex mb-4">
                    	<i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star text-secondary"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p class="mb-4">브랜드: ${vo.brand }</p>
                    <p class="mb-4">A/S: ${vo.after_service }</p>
                    <p class="mb-4">배송비: ${vo.delivery_price }</p>
                    <p class="mb-4">
                    	수량: <select id="sel">
                   	 		<option value="1">1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
                   		</select>
                    </p>
               		<p class="mb-4">
                   		총 구매액: <span id="total">${vo.selling_price }</span>원
               		</p>
               		<c:if test="${sessionScope.id!=null }">
						<input type="button" value="장바구니" id="cart" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" data-no="${vo.gno }" data-type=${vo.cno }>
						<input type="button" value="바로구매" id="buy" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" onclick="requestPay()">
					</c:if>
						<a href="../store/new.do?page=${listcurpage }" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">목록</a>
                    
                    <!-- <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>장바구니</a>
                    <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i>바로구매</a> -->                               
                </div>
                <div class="col-lg-12">
               <!-- <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc. 
                                            Susp endisse ultricies nisi vel quam suscipit </p>
                                        <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic 
                                            icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                                        <div class="px-2">
                                            <div class="row g-4">
                                                <div class="col-6">
                                                    <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Weight</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">1 kg</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Country of Origin</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Agro Farm</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Quality</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Organic</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Сheck</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Healthy</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Min Weight</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">250 Kg</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        <div class="d-flex">
                                            <img src="../img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Jason Smith</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic 
                                                    words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <img src="../img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt="">
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Sam Peters</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p class="text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic 
                                                    words etc. Susp endisse ultricies nisi vel quam suscipit </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div> -->           
                </div>       
            </div>
        </div>
        <h3>상품상세정보</h3>
        <c:forEach var="s" items="${list }">
           <img src="https://campinglist.co.kr${s }">
        </c:forEach>
        
        <!-- 댓글 -->
        <div style="height: 20px"></div>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<c:forEach var="rvo" items="${rList }">
							<table class="table">
								<tr>
									<td class="text-left">◑${rvo.name }(${rvo.dbday })</td>
									<td class="text-right">
										<c:if test="${rvo.id==sessionScope.id }">
											<span class="btn btn-xs btn-danger">수정</span>
											<a href="../reply/delete_ok.do?no=${rvo.no}&type=${vo.cno }&cno=${vo.gno }" class="btn btn-xs btn-primary">삭제</a>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="text-left" valign="top">
										<pre style="white-space: pre-wrap; background-color: white; border: none">${rvo.msg }</pre>
									</td>
 								</tr>
							</table>
						</c:forEach>
					</td>
				</tr>
			</table>
			<c:if test="${sessionScope.id!=null }">
				<table class="table">
					<tr>
						<td>
							<form method="post" action="../reply/insert.do">
								<input type="hidden" name="type" value="${vo.cno }">
								<input type="hidden" name="cno" value="${vo.gno }"><!-- 명소 번호 -->
								<textarea rows="5" cols="70" name="msg" style="float: left"></textarea>
								<input type="submit" value="댓글쓰기" style="float:left; width: 100px; height: 98px; margin-left: 2px" class="btn-primary">
							</form>
						</td>
					</tr>
				</table>
			</c:if>
		</div>
            
        
        <!-- Single Product End -->
    



        <!-- Back to Top -->
        <!-- <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   --> 

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/lightbox/js/lightbox.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
    </body>

</html>