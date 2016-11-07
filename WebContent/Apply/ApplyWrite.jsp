<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>멘토링 신청</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/>
	
	<SCRIPT type="text/javascript">
		function validation() {
			var frm = document.forms(0);
			if(frm.apply_job.value == "") {
				alert("현재 직업을 입력해주세요.");
				return false;
			} 
			else if(frm.apply_djob.value == "") {
				alert("희망 직업을 입력해주세요.");
				return false;			
			} 
			else if(frm.apply_content.value == "") {
				alert("질문을 입력해주세요.");
				return false;			
			} 
			else if(frm.apply_passwd.value==""){
				alert("비밀번호를 입력해주세요");
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
		<s:if test="APresultClass == NULL">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />&member_index=<s:property value="member_index" />'>멘토 상세보기</a> > <a href="S_ListAction.action?mentor_no=<s:property value='mentor_no' />">스케쥴 리스트</a> > <a href="javascript:history.go(-1)">스케쥴 상세보기</a> > 멘토링 신청<br></font>
		</s:if>
		<s:else>
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />&member_index=<s:property value="member_index" />'>멘토 상세보기</a> > <a href="S_ListAction.action?mentor_no=<s:property value='mentor_no' />">스케쥴 리스트</a> > <a href="javascript:history.go(-1)">스케쥴 상세보기</a> > 멘토링 신청/수정하기<br></font>
		</s:else>
			<img src="/SalaryMentoking/common/image/nametag/apply.png" />
		</td>
	</tr>
</table>
<br>

<s:if test="APresultClass == NULL">
<%--   	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr height = "25">
  			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  			<td align="left" colspan="3"><strong>멘토링 신청하기</strong></td>
  		</tr>
  		<tr bgcolor="000000">
        	<td height="1" colspan="4" ></td>	
      </tr>
  	</table> --%>
		<form action="AP_WriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			
	</s:if>
	
	<s:else>
<%-- 	 <table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr height = "25">
  			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  			<td align="left" colspan="3"><strong>멘토링 신청 수정하기</strong></td>
  		</tr>
  		  <tr bgcolor="000000">
        <td height="1" colspan="4" ></td>	
      </tr>
  	</table> --%>
		<form action="AP_ModifyAction.action" method="post" enctype="multipart/form-data">
		<s:hidden name="apply_no" value="%{APresultClass.apply_no}" />
	</s:else>


<table align="center" width="650">
	<s:hidden name="schedule_no" value="%{SresultClass.schedule_no}"/>
	<s:hidden name="schedule_apply_count" value="%{SresultClass.schedule_apply_count}"/>
	<input type="hidden" name="mentor_no" value="${param.mentor_no}"/>	

      <tr bgcolor="000000">
        <td height="1" colspan="4" ></td>	
      </tr>
      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30" width="100"><strong> 멘토링 주제 </strong></td> <!-- schedule_subject -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_subject" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 멘토링 장소(시) </strong></td> <!-- schedule_addr1+schedule_addr2 -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_addr1" />
          &nbsp;<s:property value="SresultClass.schedule_addr2" />
          &nbsp;<s:property value="SresultClass.schedule_addr3" />
          &nbsp;<s:property value="SresultClass.schedule_addr4" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 멘토링 시간 </strong></td> <!-- schedule_time -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_time" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="200"><strong> 멘토링 내용 </strong></td> <!-- schedule_content-->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_content" />
        </td>
      </tr>
	</table>
	
	<table>
	<tr>
  		<td height="20"></td>
  	</tr>
	</table>
	
	<table align="center" width="650">
		<tr bgcolor="000000">
        <td height="1" colspan="4" ></td>	
      </tr>
      <tr>
         <td bgcolor="#F4F4F4" align="center" height="30" width="100"><strong> 나의 현재 직업 </strong></td> <!-- apply_job -->
        <td bgcolor="#FFFFFF">
         <s:textfield name="apply_job" theme="simple" value="%{APresultClass.apply_job}" cssStyle="width:370px" maxlength="50"/>
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 나의 희망 직업 </strong></td> <!-- apply_djob -->
        <td bgcolor="#FFFFFF">
                   <s:textfield name="apply_djob" theme="simple" value="%{APresultClass.apply_djob}" cssStyle="width:370px" maxlength="50"/>
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 나의 학력 </strong></td> <!-- apply_achievement -->
        <td bgcolor="#FFFFFF">
           <s:textfield name="apply_achievement" theme="simple" value="%{APresultClass.apply_achievement}" cssStyle="width:370px" maxlength="50"/>
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="200"><strong> 나의 질문 내용 </strong></td> <!-- apply_content -->
        <td bgcolor="#FFFFFF">
          <s:textarea name="apply_content" theme="simple" value="%{APresultClass.apply_content}" cols="70" rows="15" readonly="readonly"/>
        </td>
      </tr>
      
       <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 비밀번호 </strong></td> <!-- apply_achievement -->
        <td bgcolor="#FFFFFF">
           <s:textfield name="apply_passwd" theme="simple" value="%{APresultClass.apply_passwd}" cssStyle="width:100px" maxlength="20"/>
        </td>
      </tr>
  </table>
  
  <table>
	<tr>
  		<td height="20"></td>
  	</tr>
</table>
  <table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr bgcolor="000000">
        	<td height="1" colspan="4"></td> 	
        </tr>
        <tr height = "25">
        	<td align="right" colspan="3">
				<input name="submit" type="submit" value="완료" class="button">
			</td>
  		</tr>
  	</table>
</body>
</html>