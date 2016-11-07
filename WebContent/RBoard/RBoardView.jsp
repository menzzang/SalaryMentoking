<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>후기 게시판</title>
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action?currentPage=1">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="%{resultClass.mentor_no}" />&currentPage=1'>멘토 상세보기</a> > <a href="javascript:history.go(-1);">후기 게시판</a> > 글 상세보기<br></font>
			<img src="/choi/common/image/nametag/reviewboard.png" /> 
		</td>
	</tr>
</table>
<br><br> 

		
	<table width="850" height="1000" border="0" cellspacing="0" cellpadding="0" align="center">
	 	<s:hidden name="mentor_no" value="%{resultClass.mentor_no}"/>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"> <strong> 번호 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.rboard_no" />
        </td>
      </tr>
      
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      <s:if test="resultClass==null">
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"> <strong> 아이디 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.member_id" />
        </td>
      </tr>
     </s:if>
      
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
      
      <tr height="30">
        <td width="100" bgcolor="#F4F4F4" align="center"> <strong> 제목 </strong></td>
        <td width="500" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.rboard_subject" />
        </td>
      </tr>
      							
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>

      <tr height="300">
        <td bgcolor="#F4F4F4" align="center"><strong>  내용 </strong></td>
        <td bgcolor="#FFFFFF" valign="top">
          &nbsp;&nbsp;<s:property value="resultClass.rboard_content" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  조회수 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.rboard_readhit" />
        </td>
      </tr>
      <tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
      <tr height="30">
        <td bgcolor="#F4F4F4" align="center"><strong>  작성일 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.rboard_regdate" />
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
          	<s:param name="rboard_no">
				<s:property value="rboard_no" />
			</s:param>
          </s:url>
					
          <s:a href="%{download}"><s:property value="resultClass.rboard_fileorg" /></s:a> 
         </td>
      </tr>
      <tr bgcolor="999999">
      	<td colspan="2" height="1"></td>
      </tr>
      
      <tr>
	      <td height="30" align="right" colspan="2">
	      		<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('RB_CheckForm.action?rboard_no=<s:property value="resultClass.rboard_no" />&currentPage=<s:property value="currentPage" />','rboard_modify')"/>			
				<input name="list" type="button" value="삭제" class="button" onClick="javascript:open_win_noresizable('RB_CheckForm.action?rboard_no=<s:property value="resultClass.rboard_no" />&currentPage=<s:property value="currentPage" />','rboard_delete')"/>
				<input name="list" type="button" value="목록" class="button" onClick="javascript:location.href='RB_ListAction.action?currentPage=<s:property value="currentPage" />&mentor_no=<s:property value="resultClass.mentor_no"/>'"/>
	      	</td>
     </tr>
      
      <tr>
      	<td colspan="2" height="10"></td>
      </tr>      
      <tr>
      	<td colspan="2" height="10">
      		<form action="RC_WriteAction.action" method="post">
 				<table>
					<tr>
						<td width="170" align="right">
						ID  <s:textfield name="member_id" theme="simple" value="%{#session.member_id}" cssStyle="width:100px" maxlength="20" readonly="true"/><br/>
						Password <s:textfield name="rcomment_passwd" theme="simple" value="%{resultClass.rcomment_passwd}" cssStyle="width:100px" maxlength="20" />
						</td>
						<s:hidden name="rboard_no" value="%{resultClass.rboard_no}" />
						<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
						<s:hidden name="member_no" value="%{#session.member_no}" />
						<s:hidden name="currentPage" value="%{currentPage}" />
						<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
						<td align="left">
							<s:textarea name="rcomment_content" theme="simple" value="%{resultClass.rcomment_content}" cols="80" rows="3" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input name="submit" type="submit" value="Complete" class="inputb">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>

               
		<s:iterator value="commentlist" status="stat">
		<tr>
					
			<td height="10" width="130" align="center">
			
				<s:property value="rcomment_regdate" /><br>
				<b>ID</b> : <s:property value="rcomment_passwd" />
			</td>
			<td>
			<!-- @@@@@@@@@@@@코멘트 삭제@@@@@@@@@@@@ -->
			             
				<s:property value="rcomment_content" /> 
				<s:if test="#session.member_no == member_no || #session.session_admin == 0">
					<a href="javascript:open_win_noresizable('RC_CheckForm.action?rcomment_no=<s:property value="rcomment_no" />&rboard_no=<s:property value="rboard_no" />&currentPage=<s:property value="currentPage" />','rcomment_delete')">x</a>
				</s:if>
			</td>
		</tr>
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		</s:iterator>
	
		<tr>
			<td colspan="2" height="10">
				<s:if test="commentlist.size() <= 0">
				no comment
			</td>
		</tr>
				</s:if>	
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		  <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
	
	
		<tr>
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="modifyForm">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="deleteAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
        </td>
      </tr>

  </table>
 </body>
</html>












