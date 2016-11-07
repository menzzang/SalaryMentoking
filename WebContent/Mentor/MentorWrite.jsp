<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>멘토정보 등록</title>
	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
	
	
</head>

<body>
	<br><br><br><br><br><br><br><br><br><br>
	<center>
		<table width="1000" > 
			<tr>
				<td align="left">
					<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > 멘토 정보 등록<br></font>
					<img src="/SalaryMentoking/common/image/nametag/mentorlist.png" /> 
				</td>
			</tr>
		</table>
		<br><br></br>
		
	  	<s:if test="resultClass == NULL">
				<form action="MTor_WriteAction.action" method="post" enctype="multipart/form-data">
				<s:hidden name="member_no" value="%{mem_resultClass.member_no}"/>
		</s:if>
		<s:else>
			  <form action="MTor_ModifyAction.action" method="post" enctype="multipart/form-data">
			  <s:hidden name="mentor_no" value="%{resultClass.mentor_no}" />
			  <s:hidden name="currentPage" value="%{currentPage}" />
			  <s:hidden name="old_file" value="%{resultClass.mentor_imagesav}" />
		</s:else>
		
		 <table width="850" align="center">
	        <tr>
	          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
	        </tr>
	        
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
					
	        <tr>
	          <td width="100" bgcolor="#F4F4F4">
	          &nbsp;&nbsp;<strong><font color="#FF0000">*</font> 현재 직업</strong>
	          </td>
	          <td width="500" bgcolor="#FFFFFF">
				&nbsp;&nbsp;  <input type="text" name="mentor_job" placeholder="현재 직업은 입력해주세요" maxlength="30" size="30"/>
	          </td>
	        </tr>
	        							
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
	        
	        <tr>
	          <td width="100" bgcolor="#F4F4F4">
			  	 &nbsp;&nbsp;&nbsp;&nbsp;<strong>근무지</strong>
			  </td>
	          <td width="500" bgcolor="#FFFFFF">
				&nbsp;&nbsp;  <input type="text" name="mentor_carrer" placeholder="현재 근무지를 입력해주세요" maxlength="30" size="30"/>
	          </td>
	        </tr>
	        							
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
	        
	        <tr>
	          <td width="100" bgcolor="#F4F4F4">
	          	&nbsp;&nbsp;&nbsp;&nbsp;<strong>최종 학력</strong>
	          </td>
	          <td width="500" bgcolor="#FFFFFF">
				&nbsp;&nbsp;  <input type="text" name="mentor_university" placeholder="최종 학력을 입력해주세요" maxlength="10" size="20"/>
	          </td>
	        </tr>
	        							
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
	        
	        <tr>
	          <td bgcolor="#F4F4F4">
	          &nbsp;&nbsp;<strong><font color="#FF0000">*</font> 인사말 </strong></td>
	          <td bgcolor="#FFFFFF">
	            &nbsp;&nbsp;&nbsp;<s:textarea name="mentor_intro" theme="simple" value="%{resultClass.mentor_intro}" cols="100" rows="30" />
	          </td>
	        </tr>
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
	       <br></br>
	        
	        <tr>
	          <td bgcolor="#F4F4F4">	
	          	&nbsp;&nbsp;&nbsp;&nbsp;<strong>기타 사항</strong>
	          </td>
	          <td bgcolor="#FFFFFF">
	            &nbsp;&nbsp;&nbsp;<s:textarea name="mentor_etc" theme="simple" value="%{resultClass.mentor_etc}" cols="100" rows="10" />
	          </td>
	        </tr>
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>
	        </tr>
	        
	        <tr>
	          <td bgcolor="#F4F4F4">
	          	&nbsp;&nbsp;<strong><font color="#FF0000">*</font> 사진</strong>
	          </td>
	          <td bgcolor="#FFFFFF">
	            <s:file name="upload" theme="simple"/>
			          <s:if test="resultClass.mentor_image != NULL">
					&nbsp; * <s:property value="resultClass.mentor_image" /> 사진이 등록되어 있습니다. 다시 업로드하면 기존의 사진은 삭제됩니다.
					</s:if>	
	          </td>
	        </tr>
	        <tr bgcolor="#777777">
	          <td height="1" colspan="2"></td>	
	        </tr>
	    
	        <tr>
	          <td height="40" colspan="2"></td>
	        </tr>
	            
	        <td>
	          <td align="right" colspan="2">
	          	<input name="submit" type="submit" value="등록하기" class="button">
	            <input name="list" type="button" value="취소" class="button" onClick="javascript:location.href='MTor_ListAction.action?currentPage=<s:property value="%{resultClass.currentPage}" />'">
	          </td>
	        </tr>
   		 </table>
    	</form>
	<br></br>
  </body>
</html>




















