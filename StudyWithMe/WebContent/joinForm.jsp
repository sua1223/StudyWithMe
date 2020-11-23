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
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {d
  background-position: right;
}

.bottomText {
  text-align: center;
}
</style>
<title>sign up page</title>
</head>
 <body width="100%" height="100%" bgcolor="#2B4166">
 
    <form action="<%= request.getContextPath() %>/joinForm_db.jsp" method="post" class="signUpForm" name="userInfo">
      <h2>Sign up to Study With Me</h2>
      <div class="letterForm">
        <input type="text" class="id" name="id" placeholder="ID">
      </div>
      <div class="letterForm">
        <input type="text" class="email" name="email" placeholder="Email">
      </div>
      <div class="letterForm">
        <input type="text" class="school" name="school" placeholder="School (ex_동국대학교)">
      </div>
      <div class="letterForm">
        <input type="text" class="major" name ="major" placeholder="Major (ex_컴퓨터공학과)">
      </div>
      <div class="letterForm">
        <input type="password" class="pw" name ="pw" placeholder="Password">
      </div>
      <div class="letterForm">
      	<input type="password" class="pwCheck" name ="pwCheck" placeholder="Confirm Password">
      </div>
      <input type="submit" class="btn" />
    </form>
    </body>
    </html>