<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <script>
      
      document.getElementById("upload").style.visibility = "hidden";
      
      function setImage(event) {
         var reader = new FileReader();

         reader.onload = function(event) {
            var uploadImg = document.createElement("img");
            uploadImg.setAttribute("src", event.target.result);
            uploadImg.setAttribute("width", "350px");
            uploadImg.setAttribute("height", "350px");
            document.querySelector("div#image_container").appendChild(uploadImg);
            };

           document.getElementById("inputButton").style.visibility = "visible";

            reader.readAsDataURL(event.target.files[0]);

            inputButton.setAttribute("background-color", "transparent");
         document.getElementById("upload").style.visibility = "visible";
      }
      </script>
      <style>
         .container{
            width:1035px;
            height:600px;
            padding-top:50px;
            padding-left:80px;
         }
         #image_container{
            width:350px; 
            height:350px; 
            border:1px solid #a3a3a3;
            
         }
         .filebox label,input{
      margin-top:5px;
      display: inline-block;
      padding: .5em .75em;
      color: #fff;
      font-size: inherit;
      line-height: normal;
      vertical-align: middle;
      cursor: pointer;
      border: 1px solid #ffffff;
      border-radius: .25em;
      -webkit-transition: background-color 0.2s;
      transition: background-color 0.2s;
   }

   .filebox label:hover {
      background-color: #525252;
   }
   input:hover {
      background-color: #000000;
   }
   label:first-child{
      margin-top:30px;
      background-color: #a3a3a3;
   }
   input{
      width:100px;
      background-color: #525252;
      margin-left:90px;
      margin-bottom:15px;
   }

   .filebox input[type="file"] {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      border: 0;
   }
   .texting{
      margin-top:3px;
      background-color:transparent; 
      border:none;
      font-size:15pt;
   }
   .title{
      font-size:22pt;
   }
   </style>
<title>Insert title here</title>
</head>
<body style="background-color:transparent;">

   <div class="container" style="background-color:#F0F0F0; border-radius:7px;">
               <form method="post" enctype="multipart/form-data" action="makeFeed_db.jsp">
               <font class="title"><b>피드 작성</b></font> 
               <input type="submit" value="Upload" id="upload" class="primary"></input>
                  <div>
                        <div id ="image_container" ></div>
                        <div class="filebox">
                        <div>
                           <span id="inputButton"> 
                              <label for="exfile">Select Img</label>
                              <input type="file"  name="file" id="exfile" onchange = "setImage(event);"  />
                           </span>
                           </div>
                           <hr width="700px;" style="margin-left:3px;">
                           <textarea class="texting" rows="1" cols="60" name="message" id="message" placeholder="TEXT"></textarea>
                           <hr width="700px;" style="margin-left:3px;">
                           <br>
                        </div>   
                        
                  </div>      
               </form>
   </div>

   </body>
</html>