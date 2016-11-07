<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<head>
<title>스케쥴 상세보기</title>

<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name,
				"scrollbars=no,status=no,resizable=no,width=100,height=150");
		
		 return true; 
		 
	}
	
/* 	function count() {
		 alert("신청할 수 없습니다.");
		 location.href="S_ViewAction.action";
		 }
 */
		
</script>
</head>

<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />&member_index=<s:property value="member_index" />'>멘토 상세보기</a> > <a href="javascript:history.go(-1)">스케쥴 리스트</a> > 스케쥴 상세보기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/schedule.png" /> 
		</td>
	</tr>
</table>
<br>

<table width="850" border="0" cellspacing="0" cellpadding="0">

		<tr align="left">
			<td><s:property value="MTorresultClass.mentor_image" /></td>
		</tr>


<%-- 자바스크립트로 인원수 넘으면 신청할 수 없다는 창 뜨도록.


	 <s:if test="#session.member_no != null && #session.member_index != 1">
		<tr align="right">
		
			<s:if test="SresultClass.schedule_apply_count == SresultClass.schedule_count">
				<td>
				<s:a href="javascript:count();">멘토링신청하기</s:a>
				</td>
			</s:if>
			
			<s:else>
				<td colspan="5"><input type="button" value="멘토링 신청하기 "
				onClick="javascript:location.href='AP_WriteForm.action?mentor_no=<s:property value="mentor_no"/>&schedule_no=<s:property value="schedule_no" />';">
				</td>
			</s:else>
			
		</tr>
	</s:if>		 --%>
		 
		 <!-- *멘토링 신청 마감일때랑 아닐 경우 추가. 66~95-->
		<s:if test="#session.member_no != null && #session.member_index != 1">
		<tr align="right">
		
			<s:if test="SresultClass.schedule_apply_count == SresultClass.schedule_count">
				<td colspan="5" align="center"><input type="button" class="button" value="멘토링 신청마감 _목록으로 돌아가기 "
				onClick="javascript:location.href='S_ListAction.action?schedule_no=<s:property value="schedule_no" />&mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />';">
				<p></p>
				</td>
			</s:if>
			
			<s:else>
				<td colspan="5"><input type="button" class="button" value="멘토링 신청하기 "
				onClick="javascript:location.href='AP_WriteForm.action?mentor_no=<s:property value="mentor_no"/>&schedule_no=<s:property value="schedule_no" />';">
				<p></p>
				</td>
			</s:else>
			
		</tr>
		</s:if>
		
		<s:else>
		<tr align="right">
			<td colspan="5"><input type="button" class="button" value="멘토 정보로 돌아가기"
				onClick="javascript:location.href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>&schedule_no=<s:property value="schedule_no" />&currentPage=<s:property value="currentPage" />';">
		<input name="list" type="button" class="button" value="스케줄 목록으로 돌아가기" class="inputb"
				onClick="javascript:location.href='S_ListAction.action?schedule_no=<s:property value="schedule_no" />&mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage" />';">
		<p></p>
		</td>
		</tr>

	</s:else>
	
	
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="30" bgcolor="#F4F4F4">멘토 이름</td>
			<td width="500" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="MemresultClass.member_name" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="30" bgcolor="#F4F4F4">멘토 직업</td>
			<td width="500" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="MTorresultClass.mentor_job" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>

			<tr>
				<td width="100" height="100" bgcolor="#F4F4F4">멘토 이메일</td>
				<td width="500" height="100" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
						value="MemresultClass.member_email" />
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
	</table>

	<table width="850" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="30" bgcolor="#F4F4F4">멘토링 날짜</td>
			<td width="500" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="SresultClass.schedule_day" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="30" bgcolor="#F4F4F4">멘토링 시간</td>
			<td width="500" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="SresultClass.schedule_time" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="30" bgcolor="#F4F4F4">멘토링 장소</td>
			<td width="500" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="SresultClass.schedule_addr1" /> &nbsp;<s:property
					value="SresultClass.schedule_addr2" /> &nbsp;<s:property
					value="SresultClass.schedule_addr3" /> &nbsp;<s:property
					value="SresultClass.schedule_addr4" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="20" bgcolor="#F4F4F4">멘토링 제목</td>
			<td width="500" height="20" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="SresultClass.schedule_subject" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" height="500" bgcolor="#F4F4F4">멘토링 내용</td>
			<td width="500" height="500" bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="SresultClass.schedule_content" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>

		<tr>
			<td align="right" colspan="2"><s:url id="modifyURL"
					action="S_ModifyForm">	
					<s:param name="schedule_no">
						<s:property value="schedule_no" />
					</s:param>
				</s:url> <s:url id="deleteURL" action="S_DeleteAction">
					<s:param name="schedule_no">
						<s:property value="schedule_no" />
					</s:param>
				</s:url>
				<s:if test="MTorresultClass.member_no == #session.member_no">
					<input name="list" type="button" value="스케쥴 수정" class="button"
						onClick="javascript:open_win_noresizable('S_CheckForm.action?schedule_no=<s:property value="SresultClass.schedule_no" />&currentPage=<s:property value="currentPage" />','Schedule_modify')" />
					<input name="list" type="button" value="스케쥴 삭제" class="button"
						onClick="javascript:open_win_noresizable('S_CheckForm.action?schedule_no=<s:property value="SresultClass.schedule_no" />&currentPage=<s:property value="currentPage" />','Schedule_delete')" />
				</s:if> 
		</tr>
	</table>
	<br></br><br></br>
</body>
</html>