<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listcontent{
	margin-top: 200px;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $( function() {
      $('#emailBtn').click(function(){
    	  let name=$('#name').val();
    	  if(name.trim()==="")
    	  {
    		  $('#name').focus();
    		  return;
    	  }
    	  
    	  let email=$('#email').val();
    	  if(email.trim()==="")
    	  {
    		  $('#email').focus();
    		  return;
    	  }
    	  // axios.get(params{name:name,email:email}) , async axios.post() => vue,react => 서버연결 , 결과값 받기 
    	  // name=aaa&email=aaa
    	  $.ajax({
    		  type:'post',
    		  url:'../member/passwordfindOk.do',
    		  data:{"name":name,"email":email},
    		  success:function(result)
    		  {
    			  let res=result.trim();
    			  if(res==='NO')
    			  {
    				  $('#pwd_email').html('<span style="color:red">이름이나 이메일이 존재하지 않습니다</span>')
    			  }
    			  else
    			  {
    				  $('#pwd_email').html('<span style="color:blue">'+res+"</span>")
    			  }
    		  }
    	  })
      })
  });
</script>
</head>
<body>
<div class="listcontent">
<div class="wrapper row3">
   <main class="container clear">
    <h2 class="text-center">비밀번호 찾기</h2>
    <div class="row" style="text-align: center;">
		    <table class="table">
		     <tr>
		       <td>
		        이름:<input type=text id="name" class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <td>
		         이메일:<input type=text id="email" class="input-sm">
		       </td>
		     </tr>
		     <tr>
		       <td class="text-center" colspan="2">
		        <input type=button value="검색"
		          class="btn btn-sm btn-danger" id="emailBtn">
		       </td>
		     </tr>
		     <tr>
		       <td class="text-center" colspan="2">
		        <h3 id="pwd_email"></h3>
		       </td>
		     </tr>
		    </table>
		  </div>
   </main>
</div>
</div>
</body>
</html>