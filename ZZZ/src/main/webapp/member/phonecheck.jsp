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
   $('#phonecheckBtn').click(function(){
      /*let id=$('#id').val();
      if(id.trim()==="")
      {
         $('#id').focus();
         return;
      }*/
      // 서버로 전송 
      let phone=$('#phone').val();
      $.ajax({
         type:'post',
         url:'../member/phonecheck_ok.do',
         data:{"phone":phone},
         success:function(result)
         {
            //alert(result)
            let count=parseInt(result);
            if(count===0)
            {
               $('#result').html('<font color="blue">'+phone+'는(은) 사용 가능한 번호입니다</font>')
               $('#okBtn').show()
            }
            else
            {
               $('#result').html('<font color="red">'+phone+'는(은) 이미 사용중인 번호입니다</font>')
               $('#phone').val("");
               $('#phone').focus()
            }
         }
      })
   });
   
   $('#okBtn').click(function(){
      parent.joinFrm.phone2.value=$('#phone').val()
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
       <td>입력:<input type="text" size=15 class="input-sm" id="phone">
         <input type="button" value="전화번호 중복체크" 
          class="btn btn-sm btn-success" id="phonecheckBtn">
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