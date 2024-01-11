<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="font.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<style type="text/css">

.row1 {
      margin: 0px auto;
      width: 600px;
    }
.div{
   width:200px;
   white-space:nowrap; /* 자동 줄바꿈 해제 */
   overflow:hidden; /* 초과된 글자를 감춘다 . . . */
   text-overflow: ellipsis; /* 글자가 초과되는 경우 */
   /* 자동으로  . . . 으로 출력 | 글자가 벗어나면 줄바꿈없이 감추기 */
 }
.listcontent{
	margin-top: 200px;
}
</style>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:['iframe']
})
$(function(){
   /*$('#joinBtn').on('click',function(){
      let id=$('#id').val();
      if(id.trim()==="")
      {
         alert("아이디 체크를 하세요!!");
          $('#id').focus();
         return;
      }
   })*/
   $('#checkBtn').click(function(){
      Shadowbox.open({
         content:'../member/idcheck.do',
         player:'iframe',
         title:'아이디 중복체크',
         width:350,
         height:200
      })
   });
   $('#postBtn').click(function(){
      Shadowbox.open({
         content:'../member/postfind.do',
         player:'iframe',
         title:'우편번호 검색',
         width:490,
         height:350
      })
   })
})
</script>
</head>
<body>
<div class="listcontent">
<div class="wrapper row3">
 <main class="container clear">
  <!-- <div class="jumbotron" style="background-image: url('../img/rr.png'); background-size: cover;"> -->
      <h2 class="text-center">회원가입을 위해<br>정보를 입력해주세요</h2>
      <p class="text-center">지금 바로 캠핑 가요 우리</p>
    <div class="row row1"> 
    <form method="post" action="../member/join_ok.do" name="frm">
      <table class="table">
     <tr>
      <th class="text-right" width="15%">ID</th>
      <td width="85%" class="inline">
       <input type="text" size=15 class="input-sm" 
          readonly name="id" id="id" placeholder="8자 이상 입력해주세요">
       <input type="button"  value="중복체크"
         class="btn-sm btn-danger" id="checkBtn">
      </td>
     </tr>
     
     <tr>
      <th class="text-right" width="15%">비밀번호</th>
      <td width="85%" class="inline">
       <input type="password" size=15 class="input-sm" name="pwd" id="pwd" placeholder="10자 이상 입력해주세요"> 
       &nbsp;재입력:<input type="password" size=15 class="input-sm"  id="pwd1">
      </td>
     </tr>
     
     <tr>
      <th class="text-right" width="15%">이름</th>
      <td width="85%">
       <input type="text" size=15 class="input-sm" name="name" id="name">
      </td>
     </tr>
     
     <tr>
      <th class="text-right" width="15%">성별</th>
      <td width="85%" class="inline">
       <input type="radio" name="sex" value="남자" checked>남자
       <input type="radio" name="sex" value="여자">여자
      </td>
     </tr>
     
     <tr>
      <th class="text-right" width="15%">생년월일</th>
      <td width="85%">
       <input type="date" size=20 class="input-sm" name="birthday" id="day">
      </td>
     </tr>
     
      <tr>
	      <th class="text-right" width="15%">이메일주소</th>
	      <td width="85%">
	       <input type="text" size=20  class="input-sm" id="email" name="email">  
	      </td>
       </tr>
        
        <tr>
        <th class="text-right" width="15%">전화번호</th>
        <td width="85%" class="inline">
           <select class="input-sm" name="phone1" id="phone1">
             <option>010</option>
             <option>011</option>
             <option>016</option>
             <option>017</option>
             <option>018</option>
             <option>019</option>
           </select>
        <input type="text" size=20 class="input-sm" name="phone2" id="phone2">
         </td>
        </tr>
        
      <tr>
      <th class="text-right" width="15%">우편번호</th>
      <td width="85%" class="inline">
       <input type="text" size=7 class="input-sm" name="post1" readonly id="post1">-
       <input type="text" size=7 class="input-sm" name="post2" readonly id="post2">
       <input type=button value="우편번호검색"
         class="btn btn-sm btn-primary" id="postBtn">
      </td>
     </tr>
     
     <tr>
      <th class="text-right" width="15%">주소</th>
      <td width="85%">
       <input type="text" size=50 class="input-sm" name="addr1" readonly id="addr1">
      </td>
      </tr>
     
      <tr>
      <th class="text-right" width="15%">상세주소</th>
      <td width="85%">
      <input type="text" size=50 class="input-sm" name="addr2">
      </td>
      </tr>
     
         <tr>
        <th class="text-right" width="30%">[필수]개인정보 수집 및<br>정보이용 동의</th>
        <td width="85%">
        <span>개인정보 수집 및 정보이용 동의를 하지 않으면<br>
        원활한 사이트 이용이 불가할 수 있습니다.</span>
         </td>
        </tr>
         
         <tr>
         <td colspan="2">
         <input type="checkbox" class="agree1">&nbsp; 이용약관 개인정보 수집 및 정보이용에 동의합니다.
         </td>
         </tr>
         
       <tr>
       <th class="text-right" width="30%">[선택]쇼핑정보 수신동의</th>
        <td width="85%">
       <span>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는<br>
          유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.<br>
          선택 약관에 동의하지 않으셔도 회원가입은 가능하며,<br>
          회원가입 후 회원정보수정 페이지에서<br>
          언제든지 수신여부를 변경하실 수 있습니다.</span>
        </tr>
        
        <tr>
         <td colspan="2">
         <input type="checkbox" class="agree2">&nbsp; SMS 수신에 동의하시겠습니까?
         </td>
         </tr>
         
         <tr>
         <td colspan="2">
         <input type="checkbox" class="agree3">&nbsp; email 수신에 동의하시겠습니까?
         </td>
         </tr>
         
        <tr>
       <td colspan="2" class="text-center inLine">
        <input type="submit" value="회원가입"
         class="btn-sm btn-info" id="joinBtn">
        <input type=button value="취소"
         class="btn-sm btn-warning"
         onclick="javascript:history.back()">
         </td>
         </tr>
       </table>
      </form>
     </div>
     </main>
   </div>
  </div>
 </body>
</html>