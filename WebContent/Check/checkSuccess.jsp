<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//w3c//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/SalaryMentoking/common/css/css.css" type="text/css">
	<script type="text/javascript">
		function locationURL(){
			
			if(window.name == 'Cboard_modify'){
				window.opener.parent.location.href='CB_ModifyForm.action?cboard_no=<s:property value="cboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Cboard_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='CB_DeleteAction.action?cboard_no=<s:property value="cboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if(window.name == 'ccommentdelete')
			{
				alert("코멘트가 삭제되었습니다");
				window.opener.parent.location.href='CC_DeleteAction.action?ccomment_no=<s:property value="ccomment_no" />&cboard_no=<s:property value="cboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'Iboard_modify' ) {
				window.opener.parent.location.href='IB_ModifyForm.action?iboard_no=<s:property value="iboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Iboard_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='IB_DeleteAction.action?iboard_no=<s:property value="iboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Mentor_modify' ) {
				window.opener.parent.location.href='MTor_ModifyForm.action?mentor_no=<s:property value="mentor_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Mentor_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='MTor_DeleteAction.action?mentor_no=<s:property value="mentor_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'Notice_modify' ) {
				window.opener.parent.location.href='N_ModifyForm.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Notice_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='N_DeleteAction.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'Rboard_modify' ) {
				window.opener.parent.location.href='RB_ModifyForm.action?rboard_no=<s:property value="rboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Rboard_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='RB_DeleteAction.action?rboard_no=<s:property value="rboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if(window.name == 'rcommentdelete'){
				alert("코멘트가 삭제되었습니다");
				window.opener.parent.location.href='RC_DeleteAction.action?rcomment_no=<s:property value="rcomment_no" />&rboard_no=<s:property value="rboard_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'Schedule_modify' ) {
				window.opener.parent.location.href='S_ModifyForm.action?schedule_no=<s:property value="schedule_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'Schedule_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='S_DeleteAction.action?schedule_no=<s:property value="schedule_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'UserGuide_modify' ) {
				window.opener.parent.location.href='UG_ModifyForm.action?userguide_no=<s:property value="userguide_no" />&currentPage=<s:property value="currentPage" />';
			}
			else if ( window.name == 'UserGuide_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='UG_DeleteAction.action?userguide_no=<s:property value="userguide_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			else if ( window.name == 'applyMentee_modify' ) 
				window.opener.parent.location.href='AP_ModifyForm.action?apply_no=<s:property value="apply_no" />&currentPage=<s:property value="currentPage" />';
					
			else if ( window.name == 'apply_delete' ) 
			{
				alert('삭제되었습니다.');
				window.opener.parent.location.href='AP_DeleteAction.action?apply_no=<s:property value="apply_no" />&currentPage=<s:property value="currentPage" />';
			}
			
			window.close();
			
		}
	</script>	
</head>

<body>
	<script>locationURL()</script>
</body>
</html>