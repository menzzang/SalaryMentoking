<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>	
	<title>멘토링 신청 현황 보기</title>
	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/>
</head>

<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" >
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MP_Mypage.action">마이페이지</a> > 멘토링 신청 현황<br></font>
			<img src="/SalaryMentoking/common/image/nametag/myapplylist.png" />
		</td>
	</tr>
</table>
<br><br>

  	<table align="center">
  		 <tr>
  			<td height="20"></td>
  		</tr>
 		 <tr align="center">
    	  	<td colspan="5">
    	  	</td>
    	  </tr>
  	</table>

<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">

	<s:iterator value="list" status="stat">
	
	 <tr>
  		<td height="20"></td>
  	</tr>
  	
	 <tr align="center" height="30">
      		<td width="100"><strong>멘토링 주제</strong></td>
      		<td><s:property value="schedule_subject"/></td>
      		<td rowspan="4"></td>
     </tr>

     <tr align="center" height="30">
      <s:if test="#session.member_index == 1">
     	<td width="50"><strong>멘티 이름</strong></td>
     	<td><s:property value="member_name"/></td>
     </s:if>
     <s:else>
     	<td width="50"><strong>멘토 이름</strong></td>
     	<td><s:property value="member_name"/></td>
     </s:else>
     </tr>
     
     <tr align="center" height="30">
     	<td width="50"><strong>신청 인원</strong></td>
     	<td><s:property value="schedule_count"/> / <s:property value="schedule_apply_count"/></td>
     </tr>
     
     <tr align="center" height="30">
     	<td width="50"><strong>멘토링 날짜</strong></td>
     	<td><s:property value="schedule_day"/></td>
     </tr>
     
     <tr align="center" height="30">
     	<td width="50"><strong>멘토링 시간</strong></td>
     	<td><s:property value="schedule_time"/></td>
     </tr>
     
     <tr align="right">
     	<td></td>
     	<td></td>
          	<td>
	     		<input type="button" class="button" value="상세보기" onClick="javascript:location.href='AP_ViewAction.action?schedule_no=<s:property value="schedule_no"/>&mentor_no=<s:property value="mentor_no"/>';"/>
	     	</td>
     </tr>
     
     <tr>
  		<td height="20"></td>
  	</tr>
  	 <tr bgcolor="000000">
       	<td height="1" colspan="3"></td>
     </tr>
	</s:iterator>
	      
	<s:if test="list.size() <= 0">
	      
	 <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 멘토링이 없습니다.</td>
                  </tr>						
	      <tr bgcolor="999999">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
	      
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
    	
    	      <tr align="right">
    		<td colspan="5">
    		
		</td>
    	       </tr>
	</table>
   </body>
</html>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
