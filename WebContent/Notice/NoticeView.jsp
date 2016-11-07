<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>공지사항</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<style>

</style>
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="javascript:history.go(-1)">공지사항</a> > 글 상세보기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/notice.png" />
		</td>
	</tr>
</table>
<br>
		
<table width="850"  border="0" cellspacing="0" cellpadding="0" align="center" >
      
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"> <strong> 번호 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.notice_no" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
       <tr height="30">
        <td width="100" bgcolor="#F4F4F4" align="center"> <strong> 제목 </strong></td>
        <td width="500" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.notice_subject" />
        </td>
      </tr>
      							
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>

      <tr height="300">
        <td bgcolor="#F4F4F4" align="center"><strong>  내용 </strong></td>
        <td bgcolor="#FFFFFF" valign="top">
          &nbsp;&nbsp;<s:property value="resultClass.notice_content" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  조회수 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.notice_readhit" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  작성일 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.notice_regdate" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
     <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  첨부파일 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;
          
          <s:url id="download" action="fileDownloadAction">
          	<s:param name="notice_no">
				<s:property value="notice_no" />
			</s:param>
          </s:url>
					
          <s:a href="%{download}"><s:property value="resultClass.notice_fileorg" /></s:a> 
         </td>
      </tr>
      
      
      <tr bgcolor="999999">
      	<td colspan="2" height="1"></td>
      </tr>
      
      <tr>
		<td height="30" align="right" colspan="2">
		<s:if test="#session.member_index == 0">
			<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('N_CheckForm.action?notice_no=<s:property value="resultClass.notice_no" />&currentPage=<s:property value="currentPage" />','modify')"/>
			<input name="list" type="button" value="삭제" class="button" onClick="javascript:open_win_noresizable('N_CheckForm.action?notice_no=<s:property value="resultClass.notice_no" />&currentPage=<s:property value="currentPage" />','delete')"/>
			<input name="list" type="button" value="목록" class="button" onClick="javascript:location.href='N_ListAction.action?currentPage=<s:property value="currentPage" />'"/>
   		</s:if>
   		</td>
    </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>	
      </tr>
      
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      
      
      <tr>
        <td align="right" colspan="2">
        
	        <s:url id="modifyURL" action="modifyForm" >
				<s:param name="no">
					<s:property value="no" />
				</s:param>
	        </s:url>
					
	        <s:url id="deleteURL" action="deleteAction" >
				<s:param name="no">
					<s:property value="no" />
				</s:param>
	        </s:url>
        
        </td>
      </tr>

  </table>
  <br></br>
  <br></br> 
 </body>
</html>












