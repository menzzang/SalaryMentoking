<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>자유 게시판</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}

</script>
	
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action?currentPage=1">멘토 리스트</a> > 멘토 상세보기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mentorview.png" />
		</td>
	</tr>
</table>
<br>
	<table width="850">
		<tr bgcolor="#85889c">
        <td height="1" colspan="2"></td>	
      </tr>
	</table>
	<br></br>

  	<table width="600" border="0" cellspacing="2" cellpadding="2" align="center" bgcolor="#fff">  

      <tr>
        <td rowspan="3" align="center" >
          &nbsp;&nbsp;<img src="/Yun/image/<s:property value="resultClass.mentor_imagesav"  />" width=200 height=250 />
        </td>
        <td colspan="2" align="center">
        	<input name="list" class="button" style="height:80px;" type="button" value="후기게시판" onClick="javascript:location.href='RB_ListAction.action?mentor_no=<s:property value="mentor_no"/>'">			
        </td>
        </tr>
        
        <tr>
        <td colspan="3" align="center">
			<input name="list" class="button" style="height:80px;" type="button" value="스케줄 보기" onClick="javascript:location.href='S_ListAction.action?mentor_no=<s:property value="mentor_no"/>'">			
		</td>
        </tr>
        
      
      </table>
      
	<br>
	<table width="850">
		<tr bgcolor="#85889c">
        <td height="1" colspan="2"></td>	
      </tr>
	</table>
	<br>
      
      <table align="center" border="0" width="850" cellpadding="2" cellspacing="2" bgcolor="#F4F4F4">
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>	
      </tr>
      <tr>
        <td width="100" bgcolor="#85889c" align="center" height="30"><strong>이름</strong></td>
        <td width="500">
          &nbsp;&nbsp;<s:property value="resultClass.member_name" />
        </td>
      </tr>
      							
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr>
        <td bgcolor="#85889c" align="center" height="30"><strong>이메일</strong> </td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.member_email" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>	
      </tr>
      
     <tr>
        <td bgcolor="#85889c" align="center" height="150"><strong>인사말</strong> </td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.mentor_intro" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>

      
      <tr>
        <td bgcolor="#85889c" align="center" height="30"><strong>직업</strong> </td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.mentor_job" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>	
      </tr>
      
      <tr>
        <td bgcolor="#85889c" align="center" height="30"><strong>직장</strong> </td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.mentor_carrer" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>	
      </tr>
      
        <tr>
        <td bgcolor="#85889c" align="center" height="30"><strong>학력</strong> </td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.mentor_university" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>	
      </tr>
      
         <tr>
        <td bgcolor="#85889c" align="center" height="50"><strong>기타사항</strong></td>
        <td>
          &nbsp;&nbsp;<s:property value="resultClass.mentor_etc" />
        </td>
      </tr>
      <tr bgcolor="#fff">
        <td height="1" colspan="2"></td>

      
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      	<table width="850">
		<tr bgcolor="#85889c">
        <td height="1" colspan="2"></td>	
      </tr>
      
      <tr>
        <td align="right" colspan="2">
        
	        <s:url id="modifyURL" action="modifyForm" >
				<s:param name="mentor_no">
					<s:property value="mentor_no" />
				</s:param>
	        </s:url>
					
	        <s:url id="deleteURL" action="deleteAction" >
				<s:param name="mentor_no">
					<s:property value="mentor_no" />
				</s:param>
	        </s:url>
	        
	<s:if test="resultClass.member_no == #session.member_no">
	<input name="list" type="button" class="button"  value="수정" onClick="javascript:open_win_noresizable('MTor_CheckForm.action?mentor_no=<s:property value="resultClass.mentor_no" />&currentPage=<s:property value="currentPage" />','Mentor_modify')">					
	<input name="list" type="button" class="button" value="삭제" onClick="javascript:open_win_noresizable('MTor_CheckForm.action?mentor_no=<s:property value="resultClass.mentor_no" />&currentPage=<s:property value="currentPage" />','Mentor_delete')">
	<input name="list" type="button" class="button" value="목록" onClick="javascript:location.href='MTor_ListAction.action?currentPage=<s:property value="currentPage" />'">
	</s:if>
	<s:else>
	<input name="list" type="button" class="button" value="목록" onClick="javascript:location.href='MTor_ListAction.action?currentPage=<s:property value="currentPage" />'">
	</s:else>
        </td>
      </tr>

  </table>
  <br></br><br></br>
 </body>
</html>
  	
  	
  	
  	
  	
  	
	
