<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="creator.creatorSelect"%>
<%@page import="register.user"%>
<%@page import="creator.creatorTitleSelect"%>
<%@page import="forum.forum"%>
<%@page import="creator.creatorTitleClassifySelect"%>
<%@page import="publish.forumClassify"%>
<%@page import="creator.creatorTraceSelect"%>
<%@page import="traceForum.trace"%>
<%@page import="creator.creatorTraceTitleSelect"%>
<%@page import="collect.collectSelect"%>
<%@page import="collect.collect"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'creator.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/creatorPage.jpg" style="font-family:'微软雅黑';color:#575757">
  <%!int allPage=0;%>
  <% int p=Integer.parseInt(request.getParameter("page"));%>
  	<%int id=0;
  	String creatorTitle=null;
  	int classId=0;
  	String type = request.getParameter("type");   //当前页面的类型
  	if(type==null || type.equals("")){
  		type = "fatie";
  	}
    String name=request.getParameter("name");%>
    <table align="center" style="margin-top:60px;">
    <tr><td style="font-size:25px;">用户资料</td>
  			<%if(name.equals(session.getAttribute("name"))){%>
  					<td><a href="updateInfoPage.jsp?name=<%=name%>">编辑资料</a></td>
  				<%}%>
  				</tr>
  	</table>
  	
  	<table align="center" style="margin-top:15px;">  		
    
  			<%creatorSelect cs=new creatorSelect();
  			List<user> creatorUser=cs.select(name);
  			for(int j=0;j<creatorUser.size();j++){
  				user u=(user)creatorUser.get(j);%>
  					
  			<tr><td>用户名：</td><td><%=u.getUsername()%></td></tr>
  			<tr><td>性&nbsp;&nbsp;&nbsp;别：</td><td><%=u.getUsersex()%></td></tr>
  			<tr><td>邮&nbsp;&nbsp;&nbsp;箱：</td><td><%=u.getUseremail()%></td></tr>
  			<!--<tr><td>生&nbsp;&nbsp;&nbsp;日：</td><td><%=u.getUserbirthday()%></td></tr>  -->
  			<tr><td>地&nbsp;&nbsp;&nbsp;址：</td><td><%=u.getUseraddress()%>	
  					
  			<%}	%>
  	</table>
  	<%if(name.equals(session.getAttribute("name"))){ %>
  	<table style="margin-left:60px;margin-top:39px;font-size:20px;">
  		<tr>
  			<td><a href="javascript:void(0);" id="myPublish" onClick=" changeUpdatePublish();">我的发帖</a>&nbsp;&nbsp;&nbsp;</td>
  			<td><a href="javascript:void(0);" id="myTrace" onClick="changeUpdateTrace();">我的回复</a>&nbsp;&nbsp;&nbsp;</td>
  			<td><a href="javascript:void(0);" id="myCollect" onClick="changeUpdateCollect();">我的收藏</a></td>
  		</tr>
  	</table>
  	<%}else{ %>
  	<table style="margin-left:59px;margin-top:39px;font-size:20px;">
  		<tr>
  			<td><a href="javascript:void(0);" id="myPublish" onClick=" changeUpdatePublish();">Ta的发帖</a>&nbsp;&nbsp;</td>
  			<td><a href="javascript:void(0);" id="myTrace" onClick="changeUpdateTrace();">Ta的回复</a>&nbsp;&nbsp;&nbsp;</td>
  			<td><a href="javascript:void(0);" id="myCollect" onClick="changeUpdateCollect();">Ta的收藏</a></td>
  		</tr>
  	</table>
  	<%} %>
  	<%
  		if(type.equals("fatie")){
  	%>
  	<div id="publish" style="display: block">
  	<%
  		}else{
  	 %>
  	 <div id="publish" style="display: none">
  	 <%} %>
  	<table style="margin-left:75px;margin-top:10px;">
  		<%
  		creatorTitleSelect titleselect=new creatorTitleSelect();
  		List<forum> title=titleselect.titleSelect(name);
  		allPage=(title.size()%8==0)?(title.size()/8):(title.size()/8+1);      	
  		for(int i=(p-1)*8;i<title.size()&&i<p*8;i++){
  			forum f=title.get(i);
  			id=f.getForumid();
  			creatorTitle=f.getForumtitle();%> 
  			 			
  			<tr>
  				<td style="width:1225px;"><a href="contentPage.jsp?id=<%=id %>" target="_blank" id="creatorTitle"><%=f.getForumtitle() %></a></td>
  				<td>
  				<%creatorTitleClassifySelect classifyId=new creatorTitleClassifySelect();
  				List<forum> classify=classifyId.classifyIdSelect(creatorTitle);
  				for(int n=0;n<classify.size();n++){
  					forum c=(forum)classify.get(n);
  					classId=c.getForumclassid();
  				 }
  				 
  				 List<forumClassify> classifyTitle=classifyId.classifyTitleSelect(classId);
  				 for(int m=0;m<classifyTitle.size();m++){
  				 	forumClassify t=classifyTitle.get(m);
  				 	%><%=t.getClassifyName() %><%
  				 }
  				 %>
  				
  				</td>
  			</tr>
  			<tr><td colspan="2"><hr style="width:1255px;margin-left:3px;margin-top:10px;color:#CCCCCC"/></td></tr>
  		<%}%>
  	</table> 
  	<table style="margin-top:8px" align="center">
    	<tr>
    	<td style="width: 40px;"><a href="creator.jsp?name=<%=name %>&page=1&type=fatie" >首页</a></td>
    	<%    	
    	for(int n=0;n<allPage;n++){
    		if((n+1)==p){%>
    			<td style="width: 15px;"><%=n+1%></td>
    		<%}else{%>    	
    	<td style="width: 15px;"><a href="creator.jsp?name=<%=name%>&page=<%=n+1%>&type=fatie" id="nowPage">[<%=n+1%>]</a></td>    	
    		<%}
    	}%>
    	<td style="width: 40px;"><a href="creator.jsp?name=<%=name%>&page=<%=allPage%>&type=fatie">尾页</a></td>
    	</tr>
    </table> 	
  	</div>
  	
  	<%!String creatorTrace=null; %>
  	<%
  		if(type.equals("huifu")){
  	%>
  	<div  id="trace" style="display: block">
  	<%
  		}else{
  	%>
  	<div  id="trace" style="display: none">
  	<%
  		} 
  	%>
  	<table style="margin-left:75px;margin-top:10px;">
  		<%
  		creatorTraceSelect traceselect=new creatorTraceSelect();
  		List<trace> allTrace=traceselect.traceSelect(name);
  		allPage=(allTrace.size()%8==0)?(allTrace.size()/8):(allTrace.size()/8+1);      	
  		for(int i=(p-1)*8;i<allTrace.size()&&i<p*8;i++){
  			trace t=allTrace.get(i);
  			id=t.getTfid();
  			creatorTrace=t.getTcontent();%>   			 			
  			<tr>
  				<td><%=creatorTrace %></td>
  				<td align="right" style="white-space:nowrap;"><a href="contentPage.jsp?id=<%=id %>" target="_blank" id="creatorTitle">
  				<%creatorTraceTitleSelect traceTitle=new creatorTraceTitleSelect();
  				List<forum> tracetitle=traceTitle.titleSelect(id);
  				for(int n=0;n<tracetitle.size();n++){
  					forum c=(forum)tracetitle.get(n);
  					
  				 	%><%=c.getForumtitle() %><%
  				 }
  				 %>
  				</a>
  				</td>
  			</tr>
  			<tr><td colspan="2"><hr style="width:1255px;margin-left:3px;margin-top:10px;color:#CCCCCC"/></td></tr>
  		<%}%>
  	</table>   	
  	<table style="margin-top:8px" align="center">
    	<tr>
    	<td style="width: 40px;"><a href="creator.jsp?name=<%=name %>&page=1&type=huifu" onClick="traceBlock();">首页</a></td>
    	<%    	
    	for(int n=0;n<allPage;n++){
    		if((n+1)==p){%>
    			<td style="width: 15px;"><%=n+1%></td>
    		<%}else{%>    	
    	<td style="width: 15px;"><a href="creator.jsp?name=<%=name%>&page=<%=n+1%>&type=huifu" onClick="traceBlock();">[<%=n+1%>]</a></td>    	
    		<%}
    	}%>
    	<td style="width: 40px;"><a href="creator.jsp?name=<%=name%>&page=<%=allPage%>&type=huifu" onClick="traceBlock();">尾页</a></td>
    	</tr>
    </table>
    </div>
    
    <%
    	if(type.equals("shoucang")){
    %>
    <div id="collect" style="display: block">
    <%
    	}else{
    %>
    <div id="collect" style="display: none">
    <%
    	}
    %>
    <table style="margin-left:75px;margin-top:10px;">
  		<%
  		collectSelect selectId=new collectSelect();
  		List<collect> collectId=selectId.selectCollectId(name);
  		allPage=(collectId.size()%8==0)?(collectId.size()/8):(collectId.size()/8+1);      	
  		for(int i=(p-1)*8;i<collectId.size()&&i<p*8;i++){
  			collect c=collectId.get(i);
  			int cid=c.getCfid();%> 
  			 			
  			<tr>   			
  				<td style="width:1225px;">
  				<%collectSelect selectTitle=new collectSelect();
  				List<forum> collectTitle =selectTitle.selectCollectTitle(cid);
  				for(int n=0;n<collectTitle.size();n++){
  					forum f=(forum)collectTitle.get(n);
  					int classid=f.getForumclassid();%>
  				
  				 <a href="contentPage.jsp?id=<%=cid %>" target="_blank" id="creatorTitle"><%=f.getForumtitle() %></a>
  				 <%
  				 creatorTitleClassifySelect classifyId=new creatorTitleClassifySelect();
  				 List<forumClassify> classifyTitle=classifyId.classifyTitleSelect(classid);
  				 for(int m=0;m<classifyTitle.size();m++){
  				 	forumClassify t=classifyTitle.get(m);
  				 	%><td><%=t.getClassifyName() %></td><%
  				 }
  				 %>
  				<%}%>
  				</td>
  			</tr>
  			<tr><td colspan="2"><hr style="width:1255px;margin-left:3px;margin-top:10px;color:#CCCCCC"/></td></tr>
  		<%}%>
  	</table> 
  	<table style="margin-top:8px" align="center">
    	<tr>
    	<td style="width: 15px;"><a href="creator.jsp?name=<%=name %>&page=1&type=shoucang" >首页</a></td>
    	<%    	
    	for(int n=0;n<allPage;n++){
    		if((n+1)==p){%>
    			<td style="width: 15px;"><%=n+1%></td>
    		<%}else{%>    	
    	<td style="width: 15px;"><a href="creator.jsp?name=<%=name%>&page=<%=n+1%>&type=shoucang" id="nowPage">[<%=n+1%>]</a></td>    	
    		<%}
    	}%>
    	<td style="width: 40px;"><a href="creator.jsp?name=<%=name%>&page=<%=allPage%>&type=shoucang">尾页</a></td>
    	</tr>
    </table> 	
    </div>
    
  </body>
  
  <style type="text/css">
    	a{
    		text-decoration: none;
    		color:#FFFFFF;
    	}  
    	a:hover {
    		color:#CCCCCC;
    		text-decoration:underline;
    	}  
    	#creatorTitle{
    		color:#336600;
    	} 
    	
    </style> 
    <script type="text/javascript">
    function changeUpdatePublish()
     	{
     		if(document.getElementById("publish").style.display="none")
     		{
     			document.getElementById("publish").style.display="block";
     			document.getElementById("trace").style.display="none";
     			document.getElementById("collect").style.display="none"
     		}
     	}
     function changeUpdateTrace()
     	{
     		if(document.getElementById("trace").style.display="none")
     		{
     			document.getElementById("publish").style.display="none";
     			document.getElementById("trace").style.display="block";
     			document.getElementById("collect").style.display="none"
     		}
     	}
     function changeUpdateCollect()
     	{
     		if(document.getElementById("collect").style.display="none")
     		{
     			document.getElementById("publish").style.display="none";
     			document.getElementById("trace").style.display="none";
     			document.getElementById("collect").style.display="block"
     		}
     	}
     function traceBlock()
     {
     	  document.getElementById("publish").style.display="none";
     	  document.getElementById("trace").style.display="block";
     }
    </script>
</html>
