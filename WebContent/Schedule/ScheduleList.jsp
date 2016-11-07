<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>스케쥴 리스트</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<style>

.table thead th {background: #424379; padding: 5px 10px; color: #fff; font-weight: normal;}
.table tbody, table thead {border-left: 1px solid #424379; border-right: 1px solid #424379;}
.table tbody {border-bottom: 1px solid #424379;}                     
.table tbody td, table tbody th {padding: 7px; background: url("td_back.gif") repeat-x;}
.table tbody tr {background: #F3F5F7;}
.table tbody tr.odd {background: #F0F2F4;}
.table tbody  tr:hover {background: #EAECEE; color: #111;}
.table tfoot td, table tfoot th, table tfoot tr {text-align: left; font: 120%  "Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", sans-serif; text-transform: uppercase; background: #fff; padding: 10px;}
.table a { color: #3A4856; text-decoration: none; border-bottom: 1px solid #C6C8CB; }  

</style>
</head>

<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action">멘토 리스트</a> > <a href="javascript:history.go(-1)">멘토 상세보기</a> > 스케쥴 리스트<br></font>
			<img src="/SalaryMentoking/common/image/nametag/schedule.png" /> 
		</td>
	</tr>
</table>
<br>

  	 <s:if test="mentor_no == MTorresultClass.mentor_no">
  	 	<br></br>
    	 <input type="button" value="글쓰기" class="button" onClick="javascript:location.href='S_WriteForm.action?mentor_no=<s:property value="mentor_no"/>&currentPage=<s:property value="currentPage"/>';"/><br></br>
    </s:if>
 
 

	<br/>
	
	<table width="700" border="0" cellspacing="0" cellpadding="2" class="table"> 
		<thead>
			<tr height="1">
				<th colspan="3"></th>
			</tr>
		</thead>
		
		
	<s:iterator value="list" status="stat">
 
      <s:url id="viewURL" action="S_ViewAction" >
			<s:param name="schedule_no">
				<s:property value="schedule_no" />
			</s:param>
			<s:param name="mentor_no">
				<s:property value="mentor_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr align="left">
				<td>  
				<br/>
				&nbsp;&nbsp;<strong>[ 멘토링 주제 ]</strong>&nbsp;&nbsp;<s:property value="schedule_subject" /><p/> 
        		&nbsp;&nbsp;<strong>[ 멘토링 날짜 ]</strong>&nbsp;&nbsp;<s:property value="schedule_day" /><p/>  
        		&nbsp;&nbsp;<strong>[ 멘토링 장소 ]</strong>&nbsp;&nbsp;<s:property value="schedule_addr1" /><p/><br/> 
				</td>
				<td width="100" align="center">
				<strong>[ 신청현황 ]</strong> <br /> 
				<h1><s:property value="schedule_apply_count" /> / <s:property value="schedule_count" /></h1>
				<p>
			<!--*스케쥴 상세보기에 있던 신청현황을 리스트로 옮김. 상세보기에서는 삭제시킴. -->
			<!--*mentor_no추가-->
				</td>
				
				<td width="100">

    			<img src="/SalaryMentoking/common/image/enter.png" onclick='location.href="${viewURL}"' onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='1'" />

    			
				</td>
			</tr>

	</s:iterator>
	      
	<s:if test="list.size() <= 0">
	   
	  <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
      </tr>						
    		
	</s:if>
	
	 </table>
 
 <br></br>
 
 <table>  
		<tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	</tr>
</table>
</body>
<br></br><br></br>
</html>
      
