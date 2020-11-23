<%@page import="java.io.File"%>
<%@page import="web.jsp0629.upload.UploadDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> upload process </title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	// cos = com.oreilly.servlet 의 약자
	
	// MultipartRequest 를 사용하여 파라미터 처리 -> 객체 생성
	// 1. request 객체 -> 내부객체를 사용하기 때문에 따로 정의할 필요 없음
	
	// 2. 업로드 될 파일 저장 경로
	// String path = "D://eclipse_jsp//workspace//files"; // 로컬에 저장하기

	// 서비스를 해줄 수 있는 폴더를 서버쪽에 만들자. -> 이클립스 WebContent/files;
	// files 폴더 서버 상의 경로 찾기
	String path = request.getRealPath("files");
	// 이클립스에서 폴더 생성하고 파일을 저장해도 이클립스 상에는 폴더 내 파일이 보이지 않는다. 
    // 저장된 파일을 확인하려면 실제 저장 주소를 폴더로 찾아가야한다.
	System.out.println(path);
    // 실제 경로 
    // 이클립스workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\프로젝트명\폴더명

	// 3. 업로드 할 파일 최대 크기
	int max = 1024*1024*5;  // 5mb
	
	// 4. 인코딩 타입 (utf-8)
	String enc = "utf-8";
	
	// 5. 업로드 된 파일 이름이 같을 경우, 덮어씌우기 방지 코드
	// DefaultFileRenamePolicy : 덮어 쓰기를 방지해주는 객체. 중복시 파일이름에 자동으로 1,2,3 숫자 붙여줌
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	
	// 6. MultipartRequest 객체 생성 
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);
	
	// 파일 업로드시 useBean 이나 setProperty 를 사용할수 없다. 파라미터를 하나씩 꺼내서 담아줘야함
	
	// 7. 파라미터 꺼내기
	String writer = mr.getParameter("writer");
	
	// input file로 추가한 파일은 객체 생성시 자동으로 파일 저장경로에 저장시켜줌. 따로 업로드를 처리할 필요는 없다.
	
	// 업로드 된 파일의 정보 가져오기
	String sysName = mr.getFilesystemName("upload"); 	// 업로드된 파일 이름
	String orgName = mr.getOriginalFileName("upload"); 	// 파일 원본 이름
	String contentType = mr.getContentType("upload"); 	// 파일 타입(종류)
	
	// 이미지만 올릴수 있게 제한
	String[] type = contentType.split("/");
	
	if(type != null && type[0].equals("image")) {
	%>
		<h2>작성자 : <%=writer %></h2>
		<h2>업로드 파일명 : <%=sysName %></h2>
		<h2>원래 파일명 : <%=orgName %></h2>
		<h2>파일 종류 : <%=contentType %></h2>
		<% if (type[0].equals("image")) { out.println("<img src='/web/files/" + sysName + "' />"); } %>
		<!-- /프로젝트명/폴더명.../파일명 -->
		<%
		UploadDAO dao = new UploadDAO();
		dao.uploadFile(writer, sysName);
	} else{
		File f = mr.getFile("upload"); // java.io.File import
		f.delete(); // 파일은 자동으로 올라가버리기 때문에 삭제처리
		out.println("<h3>이미지 파일이 아닙니다.</h3>");
	}
	%>
</body>
</html>
[출처] day 41 - JSP, 파일 업로드|작성자 쵸이