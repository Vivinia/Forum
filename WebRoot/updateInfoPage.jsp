<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateInfoPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/updatePage.jpg" style="font-family:'微软雅黑';color:#575757">
    <%
    int sign=0;
    request.setCharacterEncoding("gbk");
    String pass=(String)session.getAttribute("pass");
    String name=request.getParameter("name");
    session.setAttribute("updatename",name);%>    
    <p align="right"><a href="creator.jsp?name=<%=name %>&page=1">退出</a></p>
     <div id="infoUpdate" style="display: block">
     <table align="center" style="margin-top:60px;">
     <tr>
     <td align="center" style="margin-top:70px;font-size:20px;">编辑资料</td>
     <td><a href="javascript:void(0);" onClick=" changeUpdate()">修改密码</a></td>
     </tr>
     </table>
     <%sign=1; %>
     <form method="post" name="updateInfoPage" action="doUpdateInfoPage.jsp?sign=<%=sign %>"  onSubmit="return chkData()">
     <table style="margin-left: 550px;margin-top:48px;">
     	<tr>
     		<td style="width: 150px;">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
     		<td><%=name %></td>
     	</tr>
     	<tr><td colspan="2"> </td></tr>
   		<tr><td colspan="2"> </td></tr>
   		<tr><td colspan="2"> </td></tr>
     	<tr><td>请&nbsp;选&nbsp;择&nbsp;性&nbsp;别：</td>
    			<td><Select name="UserSex">
    					<option value="男">男</option>
    					<option value="女">女</option></Select></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请&nbsp;输&nbsp;入&nbsp;邮&nbsp;箱：</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserEmail" id="UserEmail" placeholder="请输入邮箱" onblur="emailValidate()"/></td><td><span id="emailreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请输入出生日期：</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserBirthday" id="UserBirthday"placeholder="如 1900-01-01" onblur="birthValidate()"/></td><td><span id="birthreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请输入所在省市：</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserAddress" id="UserAddress"placeholder="请输入住址"/></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr align="center"><td><input type="submit" value="确定" id="submit" /></td>
   				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="清除" id="reset"/></td>
   			</tr>
   			
     </table>
     </form>
     </div>
    
     <div id="passUpdate" style="display: none">
      <table align="center" style="margin-top:60px;">
     <tr>
     <td align="center" style="margin-top:70px;font-size:20px;">修改密码</td>
     <td><a href="javascript:void(0);" onClick=" changeUpdate()">编辑资料</a></td>
     </tr>
     </table>
      <%sign=2; %>
     <form method="post" name="updatePassPage" action="doUpdateInfoPage.jsp?sign=<%=sign %>" onSubmit="return chkDataPass()">
     	<table style="margin-left: 550px;margin-top:68px;">
     		<tr>
     			<td style="width: 150px;">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
     			<td><%=session.getAttribute("updatename") %></td>
     		</tr>
     		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
     		<tr>
   				<td>请&nbsp;输&nbsp;入&nbsp;原&nbsp;密&nbsp;码：</td>
   				<td><input type="password" style="width:180px;height:30px;" name="oldPass" id="oldPass" placeholder="请输入原密码" onblur="oldPassValidate()"></td><td><span id="passreminderold"></span></td>
   			</tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td>请&nbsp;输&nbsp;入&nbsp;新&nbsp;密&nbsp;码：</td>
    			<td><input type="password" style="width:180px;height:30px;" name="newPassOne" id="newPassOne" placeholder="请输入新密码" onblur="passValidate1()"/></td><td><span id="passreminderone"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>再次输入新密码：</td>
    			<td><input type="password" style="width:180px;height:30px;" name="newPassTwo" id="newPassTwo" placeholder="请再次输入新密码" onkeyup="passValidate2()"/></td><td><span id="passsecondremindertwo"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr align="center"><td><input type="submit" value="确定" id="submit" /></td>
   				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="清除" id="reset"/></td>
   			</tr>
     	</table>
     </form>
     </div>
     <script>
     	
     	function changeUpdate()
     	{
     		if(document.getElementById("passUpdate").style.display=="none")
     		{
     			document.getElementById("infoUpdate").style.display="none";
     			document.getElementById("passUpdate").style.display="block";
     		}
     		else
     		{
     			document.getElementById("infoUpdate").style.display="block";
     			document.getElementById("passUpdate").style.display="none";
     		}
     		
     	}
		function chkData()
		{			
			var email=document.getElementById("UserEmail");
			var date=document.getElementById("UserBirthday");
			
			var strEmail=email.value;
			var strDate=date.value;			
        	
			
			
			if(strEmail=="")
			{
				document.getElementById("emailreminder").innerHTML="<font color='red'>请填写Email信息</font>"
				email.focus();
				return false;				
			}
			
			if(strDate=="")
			{
				document.getElementById("birthreminder").innerHTML="<font color='red'>请填写出生信息</font>"
				date.focus();
				return false;
			}			      	
			return true;			
		}
		 
        function emailValidate(){
        	var UserEmail = document.getElementById("UserEmail").value;
        	if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(UserEmail)){
        		document.getElementById("emailreminder").innerHTML="<font color='red'>邮箱地址不合法</font>"
        		document.getElementById("submit").disabled = true;
        	}
        	else{
        		document.getElementById("emailreminder").innerHTML="<font color='green'>邮箱地址合法</font>"
        		document.getElementById("submit").disabled = false;
        	}
        }  
        
        function birthValidate(){
        	var UserBirthday = document.getElementById("UserBirthday").value;
        	if(UserBirthday.length==10){
        		document.getElementById("birthreminder").innerHTML="<font color='green'>出生日期合法</font>"
        		document.getElementById("submit").disabled = false;
        	}        		
        } 
        
        
        
        
        function chkDataPass()
		{
			var oldpass=document.getElementById("oldPass");
			var newpassone=document.getElementById("newPassOne");
			var newpasstwo=document.getElementById("newPassTwo");
			
			var old=oldpass.value;
			var one=newpassone.value;
			var two=newpasstwo.value;
			
			if(old=="")
			{
				document.getElementById("passreminderold").innerHTML="<font color='red'>请输入原密码信息</font>"
				oldPass.focus();
				return false;
			}
			if(one=="")
			{
				document.getElementById("passreminderone").innerHTML="<font color='red'>请输入新密码信息</font>"
				newPassOne.focus();
				return false;
			}
			
			if(two=="")
			{
				document.getElementById("passsecondremindertwo").innerHTML="<font color='red'>请填写重复密码</font>"
				newPassTwo.focus();
				return false;
			}
			return true;			
		}
		 function passValidate1() {
            var old = document.getElementById("oldPass").value;
            var one= document.getElementById("newPassOne").value;
            var two= document.getElementById("newPassTwo").value;
              if(one.length<6){
				document.getElementById("passreminderone").innerHTML="<font color='red'>密码不能少于6位</font>"
				document.getElementById("submit").disabled= true;
			}
			else{
				document.getElementById("passreminderone").innerHTML="<font color='green'>密码长度合法</font>"
				document.getElementById("submit").disabled= false;
			}
        }
         function oldPassValidate() {
            var old = document.getElementById("oldPass").value;
            var Pass='<%=pass%>'
            if(Pass==old){
				document.getElementById("passreminderold").innerHTML="<font color='green'>原密码正确</font>"
				document.getElementById("submit").disabled= false;
			}
            else{
				document.getElementById("passreminderold").innerHTML="<font color='red'>原密码不正确</font>"
				document.getElementById("submit").disabled= true;
			}			
        }
        function passValidate2() {
            var old = document.getElementById("oldPass").value;
            var one= document.getElementById("newPassOne").value;
            var two= document.getElementById("newPassTwo").value;
            if(one == two) {
                document.getElementById("passsecondremindertwo").innerHTML="<font color='green'>两次密码相同</font>";
                document.getElementById("submit").disabled= false;
            }
            else {
                document.getElementById("passsecondremindertwo").innerHTML="<font color='red'>两次密码不相同</font>";
                document.getElementById("submit").disabled = true;
            }
        }      
	</script>
	<style type="text/css">
    	a{
    		text-decoration: none;
    		color:#FFFFFF;
    	}  
    	a:hover {
    		color:#CCCCCC;
    		text-decoration:underline;
    	}  
    	    	
    </style> 
  </body>
</html>
