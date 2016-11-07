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
</head>
  
  <body>
  
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="javascript:history.go(-1)">자유 게시판</a> > 글 상세보기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/freeboard.png" />
		</td>
	</tr>
</table>
<br><br>


		
	<table width="850" height="1000" border="0" cellspacing="0" cellpadding="0" align="center">
      
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
			
  <tr height="30">
        <td bgcolor="#F4F4F4" align="center"> <strong> 번호 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.cboard_no" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
     <tr height="30">
        <td width="100" bgcolor="#F4F4F4" align="center"> <strong> 제목 </strong></td>
        <td width="500" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.cboard_subject" />
        </td>
      </tr>
      							
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>

     <tr height="300">
        <td bgcolor="#F4F4F4" align="center"><strong>  내용 </strong></td>
        <td bgcolor="#FFFFFF" valign="top">
          &nbsp;&nbsp;<s:property value="resultClass.cboard_content" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
      
     <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  조회수 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.cboard_readhit" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
     <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  작성일 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.cboard_regdate" />
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
          	<s:param name="cboard_no">
				<s:property value="cboard_no" />
			</s:param>
          </s:url>
					
          <s:a href="%{download}"><s:property value="resultClass.cboard_fileorg" /></s:a> 
         </td>
      </tr>
      
      
      <tr bgcolor="999999">
      	<td colspan="2" height="1"></td>
      </tr>
      
      <tr>
      	<td height="30" align="right" colspan="2">															
      	<s:if test ="#session.member_no == resultClass.member_no">																		
			<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('CB_CheckForm.action?cboard_no=<s:property value="resultClass.cboard_no" />&currentPage=<s:property value="currentPage" />','cboard_modify')">
			<input name="list" type="button" value="삭제" class="button" onClick="javascript:open_win_noresizable('CB_CheckForm.action?cboard_no=<s:property value="resultClass.cboard_no" />&currentPage=<s:property value="currentPage" />','cboard_delete')">
      	</s:if>
     		<input name="list" type="button" value="목록" class="button" onClick="javascript:location.href='CB_ListAction.action?currentPage=<s:property value="currentPage" />'"/>
      	</td>
      </tr>
      
      <tr>
      	<td colspan="2" height="10"></td>
      </tr>      
 </table>
 
 <table width="850">
      <s:if test="#session.member_id != null">
      <tr>
      	<td colspan="3" height="10">
      		<form action="CC_WriteAction.action" method="post">
      			 <table>
					<tr>
						<td width="170" align="right">
						ID  <s:textfield name="member_id" theme="simple" value="%{#session.member_id}" cssStyle="width:100px" maxlength="20" readonly="true" /><br/>
						Password <s:textfield label="password" name="ccomment_passwd" value="" theme="simple" cssStyle="width:100px" maxlength="20" />
						</td>
						<s:hidden name="cboard_no" value="%{cboard_no}" />
						<s:hidden name="member_no" value="%{#session.member_no}" />
						<s:hidden name="currentPage" value="%{currentPage}" />
						<td align="left">
							<s:textarea name="ccomment_content" theme="simple" cols="80" rows="3" value="" />
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right">
							<input name="submit" type="submit" value="Complete" class="inputb">
						</td>
					</tr>
				</table>
      		</form>
      	</td>
      </tr>
      
      </s:if>
      
      <tr>
      	<td colspan="3" height="1">* COMMENT *</td>
      </tr>
      
      <tr bgcolor="#777777">
      	<td colspan="3" height="1"></td>
      </tr>
      
      <s:iterator value="commentlist" status="stat">
      <tr height="50">
      	<td height="10" width="130" align="center" >
      		<s:property value="ccomment_regdate"/><br>
      		<b>ID</b> : <s:property value="member_id" />
      	</td>
      	<td>
      		<s:property value="ccomment_content"/>
      	</td>
      	<td align="right">
      		<s:if test="member_no == #session.member_no">
      		<a href="javascript:open_win_noresizable('CC_CheckForm.action?ccomment_no=<s:property value="ccomment_no" />&cboard_no=<s:property value="cboard_no" />&currentPage=<s:property value="currentPage" />','ccommentdelete')">삭제</a>
			</s:if>
		</td>
      </tr>
		<tr bgcolor="#777777">
			<td colspan="3" height="1"></td>
		</tr>      
		</s:iterator>

	
				<s:if test="commentlist.size() <= 0">
				댓글 없음
	
				</s:if>
				      
      <tr bgcolor="#777777">
        <td height="1" colspan="3"></td>	
      </tr>
        <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
      <tr>
        <td height="10" colspan="3"></td>
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
 </body>
</html>












