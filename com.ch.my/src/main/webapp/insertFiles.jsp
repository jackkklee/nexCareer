<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ch.my.model.*,com.ch.my.service.*,com.ch.my.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   /*  FileUpDaoImpl fd = FileUpDaoImpl.getInstance; */
    /* FileUpService fs = FileUpService.getInstance; 
    FileUpService fs = new FileUpService();*/
     FileUpDaoImpl fd = new FileUpDaoImpl();
	for (int i=1; i<=100; i++)	{
		FileUp file = new FileUp();
		file.setFile_name("왕좌의게임"+i);
		file.setCategory("유틸");
		file.setMem_id("asd");
		file.setFile_desc("자료에 대한 설명"+i);
		file.setFile_shot("스샷주소"+i);
		file.setFile_upload("이미지파일명"+i);
		file.setFile_size(3000+3000*i);
		file.setFile_point(200+10*i);
		int result = fd.insert(file);
	}
%>
입력성공
</body>
</html> 
