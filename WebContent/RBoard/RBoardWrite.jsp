<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>후기 게시판</title>
	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
	
	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.cboard_subject.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} 
			
			else if(frm.cboard_passwd.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;			
			} 
			

			else if(frm.cboard_content.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>

<body>
 <br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action?currentPage=1">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="%{resultClass.mentor_no}" />&currentPage=1'>멘토 상세보기</a> > <a href="javascript:history.go(-1);">후기 게시판</a> > 글 쓰기<br></font>
			<img src="/choi/common/image/nametag/reviewboard.png" /> 
		</td>
	</tr>
</table>
<br><br>
  	
  	<s:if test="resultClass == NULL">
  	  	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  			<tr height = "25">
  				<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  				<td align="left" colspan="3"><strong>후기 게시판 글쓰기</strong></td>
  			</tr>
  		</table>
			<form action="RB_WriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">	
	</s:if>
	<s:else>
		<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  			<tr height = "25">
  				<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  				<td align="left" colspan="3"><strong>후기 게시판 수정하기</strong></td>
  			</tr>
  		</table>
		  <form action="RB_ModifyAction.action" method="post" enctype="multipart/form-data">
		  <s:hidden name="rboard_no" value="%{resultClass.rboard_no}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:hidden name="old_file" value="%{resultClass.rboard_filesav}" />
	</s:else>
	<!-- checkSuccess.jsp에서 CB_ModifyForm.action으로 가면서
	struts에서 CboardWrite.jsp를 부르면서 실행되어지는 것임
	 --> 
	 
	 <table width="850" border="0" cellspacing="0" cellpadding="0" align="center">
	 	<input type="hidden" name="mentor_no" value="${mentor_no}" />
       <input type="hidden" name="currentPage" value="${currentPage}" />
        <tr>
          <td align="right" colspan="2"><font color="#FF0000"> *</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr height="30">
          <td width="100" bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 제목 </strong></td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="rboard_subject" theme="simple" value="%{resultClass.rboard_subject}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        
           <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr height="30">
          <td width="100" bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 아이디 </strong></td>
          <td width="500" bgcolor="#FFFFFF">
            <input name="_id" value="${session.member_id}" maxlength="50" readonly="true" color="gray"/>
          </td>
        </tr>
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr height="30">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 비밀번호 </strong></td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="rboard_passwd" theme="simple" value="%{resultClass.rboard_passwd}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        
        
	<tr height="300">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 내용 </strong></td>
          <td bgcolor="#FFFFFF" valign="top">
            <s:textarea name="rboard_content" theme="simple" value="%{resultClass.rboard_content}" cols="100" rows="30"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr height="30">
          <td bgcolor="#F4F4F4" align="center"><strong> 첨부파일 </strong></td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            <s:if test="resultClass.rboard_fileorg != NULL">
		&nbsp; * <s:property value="resultClass.rboard_fileorg" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="30" colspan="2"></td>
        </tr>
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="button"/>
            <input name="list" class="button" type="button" value="목록" onClick="javascript:location.href='RB_ListAction.action?currentPage=<s:property value="currentPage" />&mentor_no=<s:property value="mentor_no"/>'"/>
          </td>
        </tr>
    </table>
    </form>
    <br></br>
  </body>
</html>
	  	