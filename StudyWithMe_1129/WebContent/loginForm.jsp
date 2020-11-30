<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image: #34495e;
}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h2{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: #406AE6;
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
  background-color: #7D9CDB;
}

.bottomText {
  text-align: center;
}
</style>
<script type="text/javascript">
   function goJoinForm(){
      location.href="joinForm.jsp";
   }
</script>
<title>login page</title>
</head>
 <body width="100%" height="100%" bgcolor="#688EC7">
    <form action="loginCheck.jsp" method="post" class="loginForm">
      <h2>Study With Me</h2>
      <div class="idForm">
        <input type="text" name="id" class="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" name="pw" class="pw" placeholder="PW">
      </div>
      <button type="submit" class="btn">
        SIGN IN
      </button>
      <div class="bottomText">
        Don't you have ID? <a href="joinForm.jsp"> sign up </a>
      </div>
    </form>
  </body>
</html>