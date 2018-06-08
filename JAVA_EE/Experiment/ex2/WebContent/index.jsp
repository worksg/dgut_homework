<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.*,java.util.regex.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户主页</title>

</head>

<%!
String getFileName(Part part) {
        String contentDecs = part.getHeader("content-disposition");
        String fileName = null;
        Pattern pattern = Pattern.compile("filename=\".+\"");
        Matcher matcher = pattern.matcher(contentDecs);
        if (matcher.find()) {
            fileName = matcher.group();
            fileName = fileName.substring(10, fileName.length() - 1);
        }
        return fileName;
}
%>
    
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8");

//上传模块,  改自 https://blog.csdn.net/guomutian911/article/details/59212324
if (request.getMethod().equals("POST")){
	//定义上载文件的最大字节  
	int MAX_SIZE = 102400 * 102400;  
	// 创建根路径的保存变量  
	String rootPath;
	
	//声明文件读入类  
	DataInputStream in = null;  
	FileOutputStream fileOut = null;  
	//取得客户端的网络地址  
	String remoteAddr = request.getRemoteAddr();  
	//获得服务器的名字  
	String serverName = request.getServerName();  
	  
	//取得互联网程序的绝对地址  
	String realPath = this.getServletContext().getRealPath("/");
	
	//创建文件的保存目录  
	rootPath = realPath + "\\upload\\";
	
	
	//取得客户端上传的数据类型  
	String contentType = request.getContentType();
	
// 	System.out.println("取得客户端上传的数据类型  "+contentType);
	
	try{  
		if(contentType.indexOf("multipart/form-data") >= 0){
			
		//读入上传的数据  
		in = new DataInputStream(request.getInputStream());
		
		int formDataLength = request.getContentLength();
		
// 		System.out.println("数据长度  "+formDataLength);
		
		if(formDataLength > MAX_SIZE){  
			  out.println("<P>上传的文件字节数不可以超过" + MAX_SIZE + "</p>");  
			  return;  
		}  
		
		//保存上传文件的数据  
		byte dataBytes[] = new byte[formDataLength];  
		int byteRead = 0;  
		int totalBytesRead = 0;
		
		//上传的数据保存在byte数组  
		while(totalBytesRead < formDataLength){  
			  byteRead = in.read(dataBytes,totalBytesRead,formDataLength);  
			  totalBytesRead += byteRead;  
		}
		
		//根据byte数组创建字符串  
		String file = new String(dataBytes);
		//out.println(file);
		
		//取得上传的数据的文件名  
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0,saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		
		//取得数据的分隔字符串  
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		
// 		System.out.println("取得数据的分隔字符串 "+boundary);
		
		//创建保存路径的文件名  
		String fileName = rootPath + saveFile;
		
// 		System.out.println("文件名  "+ saveFile+ "\n创建保存路径的文件名 " + fileName);
		
		
		int pos;  
		pos = file.indexOf("filename=\"");  
		pos = file.indexOf("\n",pos) + 1;  
		pos = file.indexOf("\n",pos) + 1;  
		pos = file.indexOf("\n",pos) + 1;  
		int boundaryLocation = file.indexOf(boundary,pos) - 4;
		
// 		System.out.println("boundaryLocation "+boundaryLocation);
		
		//取得文件数据的开始的位置  
		int startPos = ((file.substring(0,pos)).getBytes()).length;
		
// 		System.out.println("取得文件数据的开始的位置  "+startPos);
		
		//取得文件数据的结束的位置  ->有错误
		//int endPos = ((file.substring(0,boundaryLocation)).getBytes()).length;
		
		//取得文件数据的结束的位置  -> DEBUG
        //int endPos = formDataLength;
		
		//取得文件数据的结束的位置  FIX BUG { 减8是因为符号最后的分隔字符串有八个-，而开头的分隔字符串只有四个-，多出四个- }
		int endPos = formDataLength - (boundary.getBytes()).length - 8;
		
// 		System.out.println("取得文件数据的结束的位置  "+endPos);
		
/* 		if (endPos > formDataLength) {
			out.println(endPos+" "+formDataLength);
			return;
		} */

        if(saveFile.getBytes().length == 0) {
        	out.println("<p>请不要选择无效路径文件名上传</p>");
        	return ;
        }
		
		//检查上载文件是否存在  
		File checkFile = new File(fileName);  
		if(checkFile.exists()){  
			   out.println("<p> 文件:" + saveFile + "<br>状态:文件已经存在.</p>");  
		}
		
		//检查上载文件的目录是否存在  
		File fileDir = new File(rootPath);  
		if(!fileDir.exists()){  
			   fileDir.mkdirs();  
		}
		
		//创建文件的写出类  
		fileOut = new FileOutputStream(fileName);
		
		//保存文件的数据  
		fileOut.write(dataBytes,startPos,(endPos - startPos));  
		fileOut.close();
		
		out.println("<p> 文件:" +saveFile + "<br>状态:文件成功上载.</p>"); 
		
		}else{
			String content = request.getContentType();  
			out.println("<p>上传的数据类型不是multipart/form-data</p>");  
		}
		
	}catch(Exception ex){  
		 throw new ServletException(ex.getMessage());  
	}
%>

<%} else {%>
<body>
    <div>
        <img src="" border="0" hidden /> <img src="" border="0" hidden />
        <form method="post" enctype="multipart/form-data">
            Please Select File: <input type="file" name="upload" size="16">
            <input type="submit" value="submit">
        </form>
        <input type="button" value="下载文档"
            onclick="javascript:window.location.href='download.jsp'">
    </div>
</body>
<% }%>

</html>