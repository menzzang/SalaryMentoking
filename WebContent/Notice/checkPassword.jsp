<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>비밀번호 확인</title>
	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
  
  <body>
  
  	<h2>비밀번호 확인</h2>
  	
  	<form action="N_CheckAction.action" method="post">
  	<s:hidden name="notice_no" value="%{notice_no}" />
  	<s:hidden name="currentPage" value="%{currentPage}" />
  		
  	<table width="250" border="0" cellspacing="0" cellpadding="0">
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td width="100" bgcolor="#F4F4F4">  비밀번호 입력</td>
        <td width="150" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:textfield name="notice_passwd" theme="simple" cssStyle="width:100px" maxlength="20"/>
          &nbsp;&nbsp;<input name="submit" type="submit" value="확인" class="inputb">
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
      
    </table>
  
  </form>
 </body>
</html>