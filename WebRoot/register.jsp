
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>This is register.</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/registerNullText.jpg" style="font-family:'微软雅黑';color:#575757">
  	<p align="right"><a href="http://localhost:8080/Forum/firstPage.jsp" target="_top">退出</a>&nbsp;&nbsp;</p>
  	<p style="font-size:25px;margin-left:645px;margin-top:53px;">用户注册</p>
  	<form name="registerage" method="post" action="doRegister.jsp"  onSubmit="return chkData();">
    	<table align="center" style="margin-left:540px;margin-top:70px;">
    		<tr><td>请输入用户名：</td>
    			<td><input type="text" style="width:180px;height:30px;"  name="UserName" id="UserName" placeholder="请输入用户名" onblur="nameValidate()"/></td><td><span id="namereminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请输入密码：</td>
    			<td><input type="password" style="width:180px;height:30px;" name="UserPass" id="UserPass" placeholder="请输入密码" onblur="passValidate1()"/></td><td><span id="passreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请再次输入密码：</td>
    			<td><input type="password" style="width:180px;height:30px;" name="UserPassSecond" id="UserPassSecond" placeholder="请再次输入密码" onblur="passValidate2()"/></td><td><span id="passsecondreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请选择性别：</td>
    			<td><Select name="UserSex">
    					<option value="男">男</option>
    					<option value="女">女</option></Select></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>请输入邮箱：</td>
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
    		<tr align="center"><td><input type="submit" value="注册" id="submit" /></td>
   				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="清除" id="reset"/></td>
   			</tr>
    	</table>
    </form>
    <script>
		function chkData()
		{
			var uname=document.getElementById("UserName");
			var upass=document.getElementById("UserPass");
			var confirmpass=document.getElementById("UserPassSecond");
			var email=document.getElementById("UserEmail");
			var date=document.getElementById("UserBirthday");
			
			var strUname=uname.value;
			var strUpass=upass.value;
			var strConfirmpass=confirmpass.value;
			var strEmail=email.value;
			var strDate=date.value;			
        	
			
		
			if(strUname=="")
			{
				document.getElementById("namereminder").innerHTML="<font color='red'>请输入用户名信息</font>"
				uname.focus();
				return false;
			}
			if(strUpass=="")
			{
				document.getElementById("passreminder").innerHTML="<font color='red'>请输入密码信息</font>"
				upass.focus();
				return false;
			}
			
			if(strConfirmpass=="")
			{
				document.getElementById("passsecondreminder").innerHTML="<font color='red'>请填写重复密码</font>"
				confirmpass.focus();
				return false;
			}
			
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
		
		 function passValidate1() {
            var UserPass = document.getElementById("UserPass").value;
            var UserPassSecond = document.getElementById("UserPassSecond").value;
              if(UserPass.length<6)
			{
				document.getElementById("passreminder").innerHTML="<font color='red'>密码不能少于6位</font>"
				document.getElementById("submit").disabled= true;
			}
			else{
				document.getElementById("passreminder").innerHTML="<font color='green'>密码长度合法</font>"
				document.getElementById("submit").disabled= false;
			}
        }
        function passValidate2() {
            var UserPass = document.getElementById("UserPass").value;
            var UserPassSecond = document.getElementById("UserPassSecond").value;
            if(UserPass == UserPassSecond) {
                document.getElementById("passsecondreminder").innerHTML="<font color='green'>两次密码相同</font>";
                document.getElementById("submit").disabled= false;
            }
            else {
                document.getElementById("passsecondreminder").innerHTML="<font color='red'>两次密码不相同</font>";
                document.getElementById("submit").disabled = true;
            }
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
        function nameValidate(){
			var uname=document.getElementById("UserName");			
			var strUname=uname.value;
			for(var i=0;i<strUname.length;i++){
				var myChar = strUname.toLowerCase().charAt(i); 
				if(!(myChar>='a' && myChar<='z') && !(myChar>='0' && myChar<='9') && (myChar!='_')){        
					document.getElementById("namereminder").innerHTML="<font color='red'>用户名包含非法字符</font>"
					document.getElementById("submit").disabled= true;
				}   
				else {
					document.getElementById("namereminder").innerHTML="<font color='green'>用户名格式合法</font>"
					document.getElementById("submit").disabled= false;
				}  
			}   
		}
        function birthValidate(){
        	var UserBirthday = document.getElementById("UserBirthday").value;
        	if(UserBirthday.length==10){
        		document.getElementById("birthreminder").innerHTML="<font color='green'>出生日期合法</font>"
        		document.getElementById("submit").disabled = false;
        	} 
        	else {
        		document.getElementById("birthreminder").innerHTML="<font color='red'>出生日期不合法</font>"
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
    	#submit,#reset{
    		width:60px;
    		height:30px;
    		font-size:15PX;
    		background:#33300; 
    		color:#575757;
    	} 		   	
    </style> 
  </body>
</html>