<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">

<script type="text/javascript">



</script>

</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">����</a> > <a href="MP_Mypage.action">����������</a> > ���� �� ��/��� ����<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mylist.png" />
		</td>
	</tr>
</table>

<br><br>

<table width="500" border="0" height="60">
	<tr>
		<td align="center" width="250" >
			<a href="MP_MyList.action">* ���� �� �� ���� *</a>
		</td>
		<td align="center" width="250">
			<a href="MP_MyList2.action">* ���� �� ��� ���� *</a>
		</td>
	</tr>
</table>

<br>

<!-- �˻���� -->
<form>
<table width="800" border="0" bgcolor="lightgray" >
	<tr>
		<td align="center">
  	 		 <select name="searchNum">
   	 			<option value="0">��������</option>
    			<option value="1">��۳���</option>
   			 </select>
   			 <s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:400px" maxlength="20" />
   			 <input type="submit" name="submit" value="�˻�">
   		</td>
 	</tr>
 	<tr>

 	   		<td align="center">* �˻��� ������ �Է����ּ��� *</td>

   	</tr>
</table>
</form>

<table width="800"  align="center" border="0">

<!-- ��ü�Խ��ǿ��� ���� �� ��� -->
	<tr>
		<td align="left" ><b>* ��ü�Խ��� �˻���� </b>&nbsp; /&nbsp; �� ${totalCount}��</td>
		<td align="right">
				<s:if test="searchKeyword != ''">
 					<s:if test="searchNum == 0">[������������ '</s:if>
 					<s:else>[��۳������� '</s:else>
 					<font color="red">${searchKeyword}</font> '��(��) �˻��� ���]
 				</s:if>
 		</td>
	</tr>
	<tr><td colspan="2"><hr></td></tr>

</table>

<table border="0">
				<tr align="center" >
						<td width="80"><strong>��۹�ȣ</strong></td>
						<td width="540"><strong>��۳���</strong></td>
						<td width="80"><strong>��¥</strong></td>
					</tr>

					<tr bgcolor="#777777">
        				<td height="1" colspan="5"></td>
     				 </tr>
     				 
      				 <s:iterator value="list" status="stat">
						<s:if test="rcomment_index == 3">
      					<s:url id="viewURL" action="RB_ViewAction" >
							<s:param name="rboard_no">
								<s:property value="rboard_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
						</s:if>
						
						<s:else>
						<s:url id="viewURL" action="CB_ViewAction" >
							<s:param name="cboard_no">
								<s:property value="rboard_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
						</s:else>
					
						
					<tr bgcolor="#FFFFFF"  align="center">
        				<td rowspan="2"><s:property value="rcomment_no" /></td>
        				<td align="left"> &nbsp;
        					<s:if test="rcomment_index == 3"><font color="blue">�ı�Խ���</font></s:if>
        					<s:else><font color="purple">�����Խ���</font></s:else>
        					 / <s:a href="%{viewURL}"><s:property value="rcomment_content" /></s:a></td>
        				<td align="center" rowspan="2"><s:property value="rcomment_regdate" /></td>
      	      		</tr>
      	      		<tr>
      	      			<td align="left"><font color="gray">�������� : <s:property value="rcomment_passwd" /></font></td>
      	     		 <tr bgcolor="#777777">
        				<td height="1" colspan="5"></td>
      				</tr>
      				</s:iterator>
	      
	      			<s:if test="list.size() <= 0">
		      		<tr bgcolor="#FFFFFF"  align="center">
						<td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
                	 </tr>						
	     			 <tr bgcolor="#777777">
      					<td height="1" colspan="5"></td>
    	    		</tr>
    				 </s:if>
    				 
    				 <tr align="center">
    					<td colspan="5"> <s:property value="pagingHtml"  escape="false" /><br>
    					</td>
    	  		    </tr>
				</table>
		</td>
	</tr>
</table>
<br><br><br>
</center>
</body>
</html>