<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
    border: 1px solid #ffb524;
    font-weight: normal;
}
.ad-banner:hover{
	cursor: pointer;
    opacity: 0.8;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> <!-- adpicture 이 기능 쓰려면 넣어야함 -->
<script type="text/javascript">


function showadpicPopup() {
    // AJAX를 통해 ad_popup.jsp 파일의 내용을 가져옴
    $.ajax({
        type: 'GET',
        url: '../gocamping/ad_popup.jsp',
        success: function (data) {
            // 서버에서 받아온 내용을 팝업 창에 표시
            var popup = window.open('', '_blank', 'width=500, height=500');
            popup.document.write(data);
        },
        error: function () {
            alert('팝업을 열 수 없습니다.');
        }
    });
}

function hideadpicPopup() {
    document.getElementById('popupadpic').style.display = 'none';
}

$(function(){
	$('.adpicture').hover(function(){
		/* $(this).css('border','2px solid red')
		       .css('cursor','pointer'); */
		let src=$(this).attr("src");
		$('#adpicturemain').attr("src",src);
	});
});
</script>
</head>
<body>


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">캠핑장</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">캠핑장</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="volvo">Nothing</option>
                                        <option value="saab">Popularity</option>
                                        <option value="opel">Organic</option>
                                        <option value="audi">Fantastic</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>서울특별시</a>
                                                        <span>(3)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>경기도</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>강원도</a>
                                                        <span>(2)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>충청도</a>
                                                        <span>(8)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>전라도</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>경상도</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>제주도</a>
                                                        <span>(5)</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
									    <h4 class="mb-3">최근 본 캠핑장</h4>
									    <c:forEach var="kvo" items="${kList}" varStatus="s">
									        <c:if test="${s.index<3}">
									            <table style="border-collapse: collapse;">
									                <tr>
									                    <td rowspan="2">
									                        <a href="../gocamping/detail.do?no=${kvo.mno}">
									                            <img src="${kvo.poster}" style="width: 120px; height: 120px; border-radius: 10px; margin-right: 10px;" class="img-rounded">
									                        </a>
									                    </td>
									                    <td style="vertical-align: top; ">
									                        <h6 class="mb-2" style="font-size: 15px; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									                            <script>
									                                document.write("${kvo.title}".length > 11 ? "${kvo.title}".substring(0, 11) + '...' : "${kvo.title}");
									                            </script>
									                        </h6>
									                        <p style="font-size: 12px; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									                            <script>
									                                document.write("${kvo.loc}".length > 12 ? "${kvo.loc}".substring(0, 12) + '...' : "${kvo.loc}");
									                            </script>
									                        </p>
									                    </td>
									                </tr>
									            </table>
									        </c:if>
									    </c:forEach>
									</div>

									<!-- 왼쪽 광고 배너 -->
                                    <div class="col-lg-12">
                                        <div class="ad-banner">
                                           <img src="../img/gocamping_ad1.png" class="img-fluid w-100 rounded" alt="" onclick="showadpicPopup()">
                                            <%-- <jsp:include page="${ad_jsp }"></jsp:include> --%>
                                            <!-- <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div> -->
                                        </div>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                            <div class="col-lg-9">
                            <!--<jsp:include page="${list_jsp }"></jsp:include>-->
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
                                
                                
                                <div id="popupadpic" class="popupadpic" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: white; border: 1px solid #ccc; z-index:2000; margin-top: 30px; border-radius: 20px; width: 100%; max-width: 1000px;">
								    <div class="table-container">
								        <table class="table">
								            <tr>
								                <td class="text-center">
								                    <img src="../img/gocamping_ad1.png" style="width: 500px; height: 500px;" id="adpicturemain">
								                </td>
								            </tr>
								            <tr>
								                <td style="height: 120px; width: 100%; max-width: 1000px;">
								                    <div class="image-container" style="white-space: nowrap; overflow-x: auto; position: fixed; height: 100px; width: 100%;">
								                    	<img src="../img/gocamping_ad1.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad2.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad3.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad4.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad5.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad6.png" style="width: 100px; height: 100px;" class="adpicture">
								                        <img src="../img/gocamping_ad7.png" style="width: 100px; height: 100px;" class="adpicture">
								                    </div>
								                </td>
								            </tr>
								        </table>
								    </div>
								    <button onclick="hideadpicPopup()" style="position: absolute; top: 10px; right: 10px; cursor: pointer; border: none; background-color: transparent;">X</button>
								</div>
                                    
               
                                   
                                    
                                    <div class="col-12 text-center">
                                        <div class="pagination">
										    <c:if test="${startpage > 1 }"><li><a href="../gocamping/list.do?page=${startpage-1}" class="rounded">&laquo;</a></li></c:if>
										    <c:forEach var="i" begin="${startpage }" end="${endpage }">
										        <li><a href="../gocamping/list.do?page=${i}" class="${curpage==i?'active rounded':'rounded'}">${i }</a></li>
										    </c:forEach>
										    <c:if test="${endpage < totalpage }"><li><a href="../gocamping/list.do?page=${endpage+1}" class="rounded">&raquo;</a></li></c:if>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->



   
    </body>
</html>