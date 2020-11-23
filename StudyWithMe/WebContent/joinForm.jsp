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
.signUpForm {
  position:absolute;
  width:390px;
  height:520px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.signUpForm h2{
  text-align: center;
  margin: 30px 15px;
}

.letterForm{
  border-bottom: 2px solid #adadad;
  margin: 5px 30px;
  padding: 10px 5px 10px 5px;
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

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.school {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.major {
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
.pwCheck {
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
  margin-top: 30px;
  margin-bottom: 30px;
  width:80%;
  height:40px;
  background: #406AE6;
  background-position: left;
  border-radius:7px;
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
}

.bottomText {
  text-align: center;
}
</style>
<script type="text/javascript">
	//필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue(){
   		if(!document.userInfo.id.value){
       		alert("아이디를 입력하세요.");
        	return false;
    	}  
    	if(!document.userInfo.password.value){
        	alert("비밀번호를 입력하세요.");
       		return false;
    	}
    	//비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    	if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
       		alert("비밀번호를 동일하게 입력하세요.");
        	return false;
    	}
	}
</script>
<title>sign up page</title>
</head>
 <body width="100%" height="100%" bgcolor="#2B4166">
    <form action="joinCheck.jsp" method="post" class="signUpForm" name="userInfo" onsubmit="return checkValue()">
      <h2>Sign up to Study With Me</h2>
      <div class="letterForm">
        <input type="text" class="id" placeholder="ID">
      </div>
      <div class="letterForm">
        <input type="text" class="email" placeholder="Email">
      </div>
      <div class="letterForm">
        <input type="text" class="school" placeholder="School (ex_동국대학교)">
      </div>
      <div class="letterForm">
        <input type="text" class="major" placeholder="Major (ex_컴퓨터공학과)">
      </div>
      <div class="letterForm">
        <input type="password" class="pw" placeholder="Password">
      </div>
      <div class="letterForm">
      	<input type="password" class="pwCheck" placeholder="Confirm Password">
      </div>
      <input type="submit" class="btn" >
        SIGN UP
      </button>

    </form>
  </body>
</html>