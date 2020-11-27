<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
 <head>
   <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
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
        margin-bottom:200px;
      }
      tr, td {
        height:55px;
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
  <div class="frame" style="width:0px; margin:auto; position:relative;">
  <iframe src="headerAndNavi.html" width="1700px" height="900px" scrolling = "no" frameborder ="0" style="position:relative; left:50%; margin-left:-850px; border-style:none;"></iframe>
    <div class="frame" style="position:relative; left:50%; margin-left:-600px; border-radius:7px;">
    <h1> 게시판 글쓰기</h1>
    <hr width="1200px" style="position:relative; left:50%; margin-left:-300px;">
    <form class="" action="post_upload_db.jsp" method="post">
      <table width=1200px height=500px>
        <tr>
        <td><select class="" name="subject" style="width:450px">
            <option value="">과목을 선택해주세요.</option>
            <option value="시스템 소프트 웨어">시스템 소프트 웨어</option>
            <option value="웹 프로그래밍">웹 프로그래밍</option>
            <option value="심화 프로그래밍">심화 프로그래밍</option>
          </select>
        </td>
        <td><select class="" name="head" style="width:200px">
            <option value="기타">말머리</option>
            <option value="질문">질문</option>
            <option value="팀플">팀플</option>
            <option value="공유">공유</option>
          </select>
        </td>
        </tr>
        <tr>
          <td colspan="2">
           <input style="width:1150px" type="text" name="title" value="" placeholder="제목을 입력해주세요."/>
          </td>
        </tr>
        <tr>
            <td colspan="2">
            <textarea name="text" rows="25" cols="170" placeholder="내용을 입력하세요."></textarea>
            </td>
        </tr>
        <tr>
          <td colspan="2" align=center>
           <input style="width:100px" type="submit" name="" value="등록">
          </td>
        </tr>
      </table>
    </form>
    <iframe src="footer.jsp" width = "1200px" height = "200px" scrolling = "no" frameborder ="0" style="position:relative; clear:both; bottom:200px;"></iframe>
    </div>
    </div>
  </body>
</html>