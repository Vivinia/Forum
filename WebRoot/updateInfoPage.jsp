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
  
  <body background="image/updatePage.jpg" style="font-family:'΢���ź�';color:#575757">
    <%
    int sign=0;
    request.setCharacterEncoding("gbk");
    String pass=(String)session.getAttribute("pass");
    String name=request.getParameter("name");
    session.setAttribute("updatename",name);%>    
    <p align="right"><a href="creator.jsp?name=<%=name %>&page=1">�˳�</a></p>
     <div id="infoUpdate" style="display: block">
     <table align="center" style="margin-top:60px;">
     <tr>
     <td align="center" style="margin-top:70px;font-size:20px;">�༭����</td>
     <td><a href="javascript:void(0);" onClick=" changeUpdate()">�޸�����</a></td>
     </tr>
     </table>
     <%sign=1; %>
     <form method="post" name="updateInfoPage" action="doUpdateInfoPage.jsp?sign=<%=sign %>"  onSubmit="return chkData()">
     <table style="margin-left: 550px;margin-top:48px;">
     	<tr>
     		<td style="width: 150px;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
     		<td><%=name %></td>
     	</tr>
     	<tr><td colspan="2"> </td></tr>
   		<tr><td colspan="2"> </td></tr>
   		<tr><td colspan="2"> </td></tr>
     	<tr><td>��&nbsp;ѡ&nbsp;��&nbsp;��&nbsp;��</td>
    			<td><Select name="UserSex">
    					<option value="��">��</option>
    					<option value="Ů">Ů</option></Select></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>��&nbsp;��&nbsp;��&nbsp;��&nbsp;�䣺</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserEmail" id="UserEmail" placeholder="����������" onblur="emailValidate()"/></td><td><span id="emailreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>������������ڣ�</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserBirthday" id="UserBirthday"placeholder="�� 1900-01-01" onblur="birthValidate()"/></td><td><span id="birthreminder"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>����������ʡ�У�</td>
    			<td><input type="text" style="width:180px;height:30px;" name="UserAddress" id="UserAddress"placeholder="������סַ"/></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr align="center"><td><input type="submit" value="ȷ��" id="submit" /></td>
   				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="���" id="reset"/></td>
   			</tr>
   			
     </table>
     </form>
     </div>
    
     <div id="passUpdate" style="display: none">
      <table align="center" style="margin-top:60px;">
     <tr>
     <td align="center" style="margin-top:70px;font-size:20px;">�޸�����</td>
     <td><a href="javascript:void(0);" onClick=" changeUpdate()">�༭����</a></td>
     </tr>
     </table>
      <%sign=2; %>
     <form method="post" name="updatePassPage" action="doUpdateInfoPage.jsp?sign=<%=sign %>" onSubmit="return chkDataPass()">
     	<table style="margin-left: 550px;margin-top:68px;">
     		<tr>
     			<td style="width: 150px;">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����</td>
     			<td><%=session.getAttribute("updatename") %></td>
     		</tr>
     		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
     		<tr>
   				<td>��&nbsp;��&nbsp;��&nbsp;ԭ&nbsp;��&nbsp;�룺</td>
   				<td><input type="password" style="width:180px;height:30px;" name="oldPass" id="oldPass" placeholder="������ԭ����" onblur="oldPassValidate()"></td><td><span id="passreminderold"></span></td>
   			</tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td>��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;�룺</td>
    			<td><input type="password" style="width:180px;height:30px;" name="newPassOne" id="newPassOne" placeholder="������������" onblur="passValidate1()"/></td><td><span id="passreminderone"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
    		<tr><td>�ٴ����������룺</td>
    			<td><input type="password" style="width:180px;height:30px;" name="newPassTwo" id="newPassTwo" placeholder="���ٴ�����������" onkeyup="passValidate2()"/></td><td><span id="passsecondremindertwo"></span></td>
    		</tr>
    		<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr align="center"><td><input type="submit" value="ȷ��" id="submit" /></td>
   				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="���" id="reset"/></td>
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
				document.getElementById("emailreminder").innerHTML="<font color='red'>����дEmail��Ϣ</font>"
				email.focus();
				return false;				
			}
			
			if(strDate=="")
			{
				document.getElementById("birthreminder").innerHTML="<font color='red'>����д������Ϣ</font>"
				date.focus();
				return false;
			}			      	
			return true;			
		}
		 
        function emailValidate(){
        	var UserEmail = document.getElementById("UserEmail").value;
        	if(!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(UserEmail)){
        		document.getElementById("emailreminder").innerHTML="<font color='red'>�����ַ���Ϸ�</font>"
        		document.getElementById("submit").disabled = true;
        	}
        	else{
        		document.getElementById("emailreminder").innerHTML="<font color='green'>�����ַ�Ϸ�</font>"
        		document.getElementById("submit").disabled = false;
        	}
        }  
        
        function birthValidate(){
        	var UserBirthday = document.getElementById("UserBirthday").value;
        	if(UserBirthday.length==10){
        		document.getElementById("birthreminder").innerHTML="<font color='green'>�������ںϷ�</font>"
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
				document.getElementById("passreminderold").innerHTML="<font color='red'>������ԭ������Ϣ</font>"
				oldPass.focus();
				return false;
			}
			if(one=="")
			{
				document.getElementById("passreminderone").innerHTML="<font color='red'>��������������Ϣ</font>"
				newPassOne.focus();
				return false;
			}
			
			if(two=="")
			{
				document.getElementById("passsecondremindertwo").innerHTML="<font color='red'>����д�ظ�����</font>"
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
				document.getElementById("passreminderone").innerHTML="<font color='red'>���벻������6λ</font>"
				document.getElementById("submit").disabled= true;
			}
			else{
				document.getElementById("passreminderone").innerHTML="<font color='green'>���볤�ȺϷ�</font>"
				document.getElementById("submit").disabled= false;
			}
        }
         function oldPassValidate() {
            var old = document.getElementById("oldPass").value;
            var Pass='<%=pass%>'
            if(Pass==old){
				document.getElementById("passreminderold").innerHTML="<font color='green'>ԭ������ȷ</font>"
				document.getElementById("submit").disabled= false;
			}
            else{
				document.getElementById("passreminderold").innerHTML="<font color='red'>ԭ���벻��ȷ</font>"
				document.getElementById("submit").disabled= true;
			}			
        }
        function passValidate2() {
            var old = document.getElementById("oldPass").value;
            var one= document.getElementById("newPassOne").value;
            var two= document.getElementById("newPassTwo").value;
            if(one == two) {
                document.getElementById("passsecondremindertwo").innerHTML="<font color='green'>����������ͬ</font>";
                document.getElementById("submit").disabled= false;
            }
            else {
                document.getElementById("passsecondremindertwo").innerHTML="<font color='red'>�������벻��ͬ</font>";
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
