<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="makeFeed.css" />
<title>Insert title here</title>
</head>
<body class="is-preload">
			<div id="wrapper">
			<footer id="footer">
			<div class="inner">
							<section>
								<h1>게시물 작성</h1><br>
								<form method="post" enctype="multipart/form-data" action="madeFeed.jsp">
									<div class="fields">
										<div class="field half">
											<div id ="image_container" >
			<span id="inputButton"> 	
			<input type="file"  name=file1 id="file" onchange = "setImage(event);"  />
			</span>
					</div>

										</div>
										<div class="field half">
										</div>
										<div class="field">
											<textarea name="writer" id="message" placeholder="TEXT"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="upload" id="upload" class="primary" /></li>
									</ul>
								</form>
							</section>
						</div>
					</footer>
			</div>

		<!-- Scripts -->
		<script>
		var imgCheck = 0;
		
		document.getElementById("upload").style.visibility = "hidden";

		
		function setImage(event) {
			var reader = new FileReader();

			reader.onload = function(event) {
				var uploadImg = document.createElement("img");
				uploadImg.setAttribute("src", event.target.result);
				uploadImg.setAttribute("width", "200px");
				uploadImg.setAttribute("height", "200px");
				document.querySelector("div#image_container").appendChild(uploadImg);
				};

			  document.getElementById("inputButton").style.visibility = "visible";

				reader.readAsDataURL(event.target.files[0]);

				inputButton.setAttribute("background-color", "transparent");
			document.getElementById("upload").style.visibility = "visible";
				imgCheck=1;
				}
	
		
		</script>

	</body>

</html>