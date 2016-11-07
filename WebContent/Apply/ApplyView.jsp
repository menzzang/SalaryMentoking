<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C/
/DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>멘토링 신청</title>
		<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/>
	<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
	
</head>

<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />&member_index=<s:property value="member_index" />'>멘토 상세보기</a> > <a href="S_ListAction.action?mentor_no=<s:property value='mentor_no' />">스케쥴 리스트</a> > <a href="javascript:history.go(-1)">스케쥴 상세보기</a> > 멘토링 신청<br></font>
			<img src="/SalaryMentoking/common/image/nametag/apply.png" />
		</td>
	</tr>
</table>
<br>
  	<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr height = "25">
  			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  			<td align="left" colspan="3"><strong>멘토링 신청 상세보기</strong></td>
  		</tr>
  		<tr bgcolor="000000">
        	<td height="1" colspan="2"></td>
     	</tr>
  	</table>

	<table align="center">
       	<tr>
  			<td height="20"></td>
  		</tr>
      	<tr bgcolor="000000" >
        	<td height="1" colspan="4"></td>
      </tr>
      <!-- ##$$ 변경-->
      <tr height="10">
        <td bgcolor="ffffff" colspan="2" rowspan="6" height="200" width="180">
         <!-- mentor_image -->
          &nbsp;&nbsp;<%-- <s:property value="MTresultClass.mentor_image"/> --%>
          <img src="/Yun/image/<s:property value="MTresultClass.mentor_imagesav"  />" height="200" width="180" />
         </td>
      </tr>
      <!-- ##$$ -->
      
      <tr height="30">
        <td bgcolor="#F2F2F2" align="center" ><strong>  멘토 이름 </strong> </td> <!-- member_name -->
        <td bgcolor="#FFFFFF" width="100">
          &nbsp;&nbsp;<s:property value="MemresultClass.member_name" />
        </td>
      </tr>
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong> 멘토 직업 </strong></td> <!-- mentor_job -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="MTresultClass.mentor_job" />
        </td>
      </tr>
	   <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  멘토 이메일 </strong></td> <!-- member_email -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="MemresultClass.member_email" />
        </td>
      </tr>
</table>

<table>
	<tr>
  		<td height="20"></td>
  	</tr>
</table>

<table align="center" width="600">
      <tr bgcolor="000000">
        <td height="1" colspan="4" ></td>	
      </tr>
      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30" width="100"><strong> 멘토링 주제 </strong></td> <!-- schedule_subject -->
        <td bgcolor="#FFFFFF" width="200">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_subject" />
        </td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30" width="100"><strong> 신청 인원 </strong></td> <!-- schedule_subject -->
        <td bgcolor="#FFFFFF" width="200">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_apply_count" /> / <s:property value="SresultClass.schedule_count" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 멘토링 장소 </strong></td> <!-- schedule_addr1+schedule_addr2 -->
        <td bgcolor="#FFFFFF" width="30">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_addr1" />
        </td>
        <td bgcolor="#FFFFFF" width="300">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_addr2" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 멘토링 시간 </strong></td> <!-- schedule_time -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_time" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="150"><strong> 멘토링 내용 </strong></td> <!-- schedule_content-->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="SresultClass.schedule_content" />
        </td>
      </tr>
	</table>
	
	
	<table align="center" width="600">
		<tr bgcolor="000000">
        <td height="1" colspan="4" ></td>	
      </tr>
      <tr>
         <td bgcolor="#F4F4F4" align="center" height="30" width="100"><strong> 나의 현재 직업 </strong></td> <!-- apply_job -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="APresultClass.apply_job" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 나의 희망 직업 </strong></td> <!-- apply_djob -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="APresultClass.apply_djob" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="30"><strong> 나의 학력 </strong></td> <!-- apply_achievement -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="APresultClass.apply_achievement" />
        </td>
      </tr>

      <tr>
        <td bgcolor="#F4F4F4" align="center" height="150""><strong> 나의 질문 내용 </strong></td> <!-- apply_content -->
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="APresultClass.apply_content" />
        </td>
      </tr>
    
  </table>
  
  <table>
	<tr>
  		<td height="20"></td>
  	</tr>
</table>
  <table width="850" border="0" cellspacing="0" cellpadding="2" align="center">

        <tr height = "25">
        	<td align="right" colspan="3">
					<input name="list" type="button" class="button" value="취소" onClick="javascript:open_win_noresizable('AP_CheckForm.action?&schedule_no=<s:property value="schedule_no"/>&apply_no=<s:property value="APresultClass.apply_no" />','apply_delete')">        	
				<s:if test ="#session.member_index == 2">
        			<input name="list" type="button" class="button" value="수정" onClick="javascript:open_win_noresizable('AP_CheckForm.action?apply_no=<s:property value="APresultClass.apply_no"/>','applyMentee_modify')">				
				</s:if>
 					<input name="list" type="button" class="button" value="멘토링 신청 현황 보기" onClick="javascript:location.href='AP_MenteeAction.action?currentPage=<s:property value="currentPage" />'">
			
  		</tr>
  	</table>
 </body>
</html>