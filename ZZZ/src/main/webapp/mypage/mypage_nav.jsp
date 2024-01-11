<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
     <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

    <!-- Site Metas -->
    <!--<title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">-->

    <!-- Site Icons -->
    <!--<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">-->

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="../css1/bootstrap.min.css"> -->
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css1/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css1/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css1/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

 <div class="container-fluid py-5 mb-5 hero-header">
   <div class="container py-5">
    <div class="my-account-box-main">
        <div class="container">
            <c:if test="${sessionScope.admin=='n' }">
            <div class="my-account-page">
            	<div class="row">
            	<h1 class="text-center" style="color:yellow;">마이 페이지</h1>
            	</div>
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/mypage_update.do"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>회원 정보 수정</h4>
                                    <p>1</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/mypage_delete.do"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>회원 탈퇴</h4>
                                    <p>1</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>캠핑 예약</h4>
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/mypage_jjim.do"> <i class="fa fa-location-arrow"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>관심 상품</h4>
                                    <p>3</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-credit-card"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>자유게시판</h4>
                                    <p>4</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/mypage_buy.do"> <i class="fab fa-paypal"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>구매내역</h4>
                                    <p>5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="../mypage/mypage_cart.do"> <i class="fab fa-amazon"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>장바구니</h4>
                                    <p>6</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>           
            </div>
            </c:if>
            <c:if test="${sessionScope.admin=='y' }">
            <div class="my-account-page">
            	<div class="row">
            	<h1 class="text-center" style="color:red;">관리자 페이지</h1>
            	</div>
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-gift"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>123</h4>
                                    <p>1</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"><i class="fa fa-lock"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>asd</h4>
                                    <p>2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-location-arrow"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>1234</h4>
                                    <p>3</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fa fa-credit-card"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>자2133</h4>
                                    <p>4</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fab fa-paypal"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>12314</h4>
                                    <p>5</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="#"> <i class="fab fa-amazon"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>43234</h4>
                                    <p>6</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>           
            </div>
            </c:if>
        </div>
    </div>
    </div>
    </div>
    <!-- End My Account -->

    <!-- ALL JS FILES -->
    <!--<script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>-->
    <!-- ALL PLUGINS -->
    <!--<script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>-->
</body>

</html>