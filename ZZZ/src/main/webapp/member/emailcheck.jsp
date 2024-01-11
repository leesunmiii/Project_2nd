<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 20px; 
}
.row{
  margin: 0px auto;
  width: 300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
   $('#emailcheckBtn').click(function(){
      /*let id=$('#id').val();
      if(id.trim()==="")
      {
         $('#id').focus();
         return;
      }*/
      // 서버로 전송 
      let email=$('#email').val();
      $.ajax({
         type:'post',
         url:'../member/emailcheck_ok.do',
         data:{"email":email},
         success:function(result)
         {
            //alert(result)
            let count=parseInt(result);
            if(count===0)
            {
               $('#result').html('<font color="blue">'+email+'는(은) 사용 가능한 메일입니다</font>')
               $('#okBtn').show()
            }
            else
            {
               $('#result').html('<font color="red">'+email+'는(은) 이미 사용중인 메일입니다</font>')
               $('#email').val("");
               $('#email').focus()
            }
         }
      })
   });
   
   $('#okBtn').click(function(){
      parent.joinFrm.email.value=$('#email').val()
      parent.Shadowbox.close()
   })
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <table class="table">
     <tr>
       <td>입력:<input type="text" size=15 class="input-sm" id="email">
         <input type="button" value="메일중복체크" 
          class="btn btn-sm btn-success" id="emailcheckBtn">
       </td>
     </tr>
     <tr>
       <td><span id="result"></span></td>
     </tr>
     <tr>
       <td class="text-center"><input type="button" class="btn btn-sm btn-danger" value="확인" style="display:none" id="okBtn"></td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>