<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
 <head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <title>게시판 글쓰기</title>
     <style type="text/css">
     *{
     	font-family:sans-serif;
     }
      h2{
        font-color:#000000;
        padding:0px 10px 0px;
      }
      table{
        padding: 10px 0px 30px;
      }
      tr, td {
        height:45px;
        border: 1px solid #adadad;
        padding: 0px 7px 0px;
        background-color:#ffffff;
      }
      select{
        border-radius:7px;
        height:37px;
      }
      input{
        border: 1px solid #adadad;
        height:32px;
        border-radius:7px;
        padding:0px 2px 0px;
      }
      textarea{
        border: 1px solid #adadad;
        border-radius:7px;
        padding:7px 10px 2px;
        margin:5px;
      }
    </style>
  </head>
  <body>
  <iframe src="headerAndNavi.html" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0"></iframe>
  <div class="container">
    <h2> 게시판 글쓰기</h2>
    <hr style="border: solid 2px #1369CC" >
    <form class="" action="post_upload_db.jsp" method="post">
      <table width=100% height=500px>
        <tr>
        <td><select class="" name="subject" style="width:450px">
            <option value="">과목을 선택해주세요.</option>
            <option value="시스템 소프트 웨어">시스템 소프트 웨어</option>
            <option value="웹 프로그래밍">웹 프로그래밍</option>
            <option value="심화 프로그래밍">심화 프로그래밍</option>
          </select>
        </td>
        <td><select class="" name="head" style="width:400px">
            <option value="기타">말머리</option>
            <option value="질문">질문</option>
            <option value="팀플">팀플</option>
            <option value="공유">공유</option>
          </select>
        </td>
        </tr>
        <tr>
          <td colspan="2">
           <input style="width:1100px"type="text" name="title" value="" placeholder="제목을 입력해주세요."/>
          </td>
        </tr>
        <tr>
            <td colspan="2">
            <textarea name="text" rows="18" cols="170" placeholder="내용을 입력하세요."></textarea>
            </td>
        </tr>
        <tr>
          <td colspan="2" align=center>
           <input style="width:100px" type="submit" name="" value="등록">
          </td>
        </tr>
      </table>
    </form>
    </div>
  </body>
</html>