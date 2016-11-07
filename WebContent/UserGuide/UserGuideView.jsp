<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>User Guide</title>
		<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
	<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Verdana, Arial, Helvetica, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Verdana, Arial, Helvetica, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:center}
.tg .tg-yw4l{text-align:center;vertical-align:center}
.tg .tg-yw3l{text-align:center;vertical-align:center}
</style>

</head>

<body>

<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 유저 가이드<br></font>
			<img src="/SalaryMentoking/common/image/nametag/userguide.png" /> 
		</td>
	</tr>
</table>
<br><br>

<href="javascript:location.href='UG_ViewAction.action?userguide_no=1&currentPage=1<s:property value="currentPage" />';"/>
		

<table border="0" height="300"  align="center"  width="800">

	<tr>
		<td width="1000" colspan="2">
			<img src="/SalaryMentoking/common/image/guide.jpg" width="1000"/>
		</td>
	</tr>
	<tr>
		<td>
			<img src="/SalaryMentoking/common/image/guide_mentor.jpg" width="1000"/>
		</td>
		<td>
			<img src="/SalaryMentoking/common/image/guide_mentee.jpg" width="1000"/>
		</td>
	</tr>


<%--유저가이드 글내용 임시로 주석처리함.

   <tr>
    <th class="tg-baqh" colspan="2" ><s:property value="resultClass.userguide_content" /></th>
    
  </tr>
  </table>
  <table border="5" height="300"  align="center"  width="800" class="tg">
  <tr>
<br><td class="tg-yw4l"  colspan="1" ><s:property value="resultClass.userguide_content2"/></td></br>

   &nbsp;<br><td class="tg-yw3l"  colspan="1" ><s:property value="resultClass.userguide_content3"/></td></br>
  </tr> --%>
</table>


	      
	
      
    <table height="50"  align="center"  width="800" >
        <td bgcolor="#F4F4F4" align="center"><strong>  첨부파일 </strong></td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;
        
			
          
          
          
         <s:url id="download" action="fileDownloadAction">
          	<s:param name="userguide_no">

				
			</s:param>
          </s:url>
					
          &nbsp;&nbsp;<s:a href="%{download}"><s:property value="resultClass.userguide_fileorg" /></s:a> 
         </td>
      </tr>
  	<tr bgcolor="999999">
        <td height="1" colspan="2"></td>	
      </tr>
      
      
		<tr>
			<td height="30" align="right" colspan="2">
			<s:if test="#session.member_index == 0">
			  <input name="list" type="button" value="글작성" class="button" onClick="javascript:location.href='UG_WriteForm.action?currentPage=<s:property value="currentPage" />'">
         
				<input name="list" type="button" value="수정" class="button" onClick="javascript:open_win_noresizable('UG_CheckForm.action?userguide_no=<s:property value="resultClass.userguide_no" />&currentPage=<s:property value="currentPage" />','UserGuide_modify')">
				<input name="list" type="button" value="삭제" class="button"  onClick="javascript:open_win_noresizable('UG_CheckForm.action?userguide_no=<s:property value="resultClass.userguide_no" />&currentPage=<s:property value="currentPage" />','UserGuide_delete')">

			</td>
		 	</s:if>
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
  

 </body>
</html>


      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      