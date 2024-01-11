<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
  margin: 0px auto;
  width:350px;
}
.listcontent{
	margin-top: 200px;
}
</style>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// ' 1234' '1234'
	$('#delBtn').click(function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../mypage/mypage_delete_ok.do',
			data:{"pwd":pwd},
			success:function(result)
			{
				alert(result)
				let res=result.trim();
				if(res==='no')
			    {
					alert("비밀번호가 틀립니다!!");
					$('#pwd').val("")
					$('#pwd').focus();
				}
				else
				{
					alert("회원 탈퇴 완료하셨습니다")
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
</head>
<body>

<div class="listcontent">
<div class="wrapper row3">
   <main class="container clear">
    <h2 class="text-center" >회원 탈퇴</h2>
    <p></p>
    <div class="row1">
     <table class="table">
       <tr>
         <td class="inline">
         비밀번호:<input type=password id="pwd" class="input-sm">
         </td>
       </tr>
       <tr>
         <td class="text-center inline">
            <input type=button value="회원탈퇴" id="delBtn"
             class="btn btn-sm btn-danger">
            <input type=button value="취소"
             class="btn btn-sm btn-primary"
             onclick="javascript:history.back()" 
            >
         </td>
       </tr>
     </table>
    </div>
   </main>
</div>
</div>
</body>
</html>