<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>멘토 리스트</title> 
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<style>

.table3 thead th {background: #85889c; padding: 5px 10px; color: #fff; font-weight: normal;}                 
.table3 tbody td, table tbody th {padding: 7px; background: url("td_back.gif") repeat-x;}
.table3 tbody tr.odd {background: #F0F2F4;}
.table3 tbody tr:hover {background: #fff; color: #111;}
.table3 tbody td:hover {background: #F0F2F4;}
.table3 tfoot td, table tfoot th, table tfoot tr {text-align: left; font: 120%  "Lucida Grande", "Lucida Sans Unicode", "Trebuchet MS", sans-serif; text-transform: uppercase; background: #fff; padding: 10px;}
.table3 a { color: #3A4856; text-decoration: none; border-bottom: 1px solid #C6C8CB; }  
.table2 tbody tr {background: #dfdfdf;}

</style>
<script type="text/javascript">
function openZipcode(){
	var url="ZipCheckAction1.action";
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=400");
}
function test(){
	location.href="MTor_ListAction.action";
}

windowclose = function(){
	alert('이미 글을 작성하셨습니다.');
}

function openConfirmId(){
	alert('멘토정보 등록 후 이용하시기 바랍니다.');
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=400");
}
</script>
	
</head>
<body>

<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 멘토 리스트<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mentorlist.png" /> 
		</td>
	</tr>
</table>
<br>


<table width="600" border="0" cellspacing="0" cellpadding="2" align="center" class="table2">	

  <form method=post  id= memJoin name=memJoin action="MTor_Schedule1.action" enctype="multipart/form-data"> <!-- zipChk에서 불러온다 memJoin을   -->
  	<tr height="50">
  		<td align="center" width="150" rowspan="2">
  		<img src="/SalaryMentoking/common/image/mentorsearch.png" />  
  		</td>
		<td align="right" width="115">
			<font size="2"><strong>지역 검색(시)</strong></font></td>
		<td width="185">
			&nbsp;&nbsp;<input readonly name="area1" type="text" theme="simple" maxlength="7" onclick="openZipcode()"/>
			<input type="hidden" name=currentPage/>	
		</td>
		<td rowspan="2" align="center" width="150">
			<input type="submit" value="확인" class="button" style="height:80; width:100;">
		</td>
	</tr>

	<tr height="50">
		<td align="right"><font size="2"><strong>군/구</strong></font></td>
		<td width="185">
		&nbsp;&nbsp;<input readonly name="address" type="text" theme="simple" maxlength="70" onclick="openZipcode()"/>
		</td>
	</tr>
	</form>
</table>
  	
<br/>

<table width="850" border="0" cellspacing="0" cellpadding="2" align="center" class="table3">
	<thead>
		<tr>
			<th width="900" colspan="3">MENTOR LIST</th>
		</tr>
	</thead>

     <c:set var="colNo" value="0"/>
      <s:iterator value="list" status="stat">
      
      <s:url id="viewURL" action="MTor_ViewAction" >
			<s:param name="mentor_no">
				<s:property value="mentor_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
			<s:param name="member_index">
				<s:property value="member_index" />
			</s:param>
		</s:url>
		
		<c:choose>
			<c:when test="${colNo % 3 == 0 }">
			<tr>
			<td align="center">
				<s:a href="%{viewURL}">
					
					NO.<s:property value="mentor_no" /><br/>
					<img src="/SalaryMentoking/image/<s:property value="mentor_imagesav" />" width="250" height="250" /><br/>
					멘토 이름 : <s:property value="member_name" /><br/>
					멘토 직업 : <s:property value="mentor_job" /><br/>
					인사말 : ${mentor_intro2[colNo]}
					</s:a>
				<c:set var="colNo" value="${colNo+1}"/>
			</td>
			</c:when>
			<c:when test="${colNo % 3 == 1 }">
			<td align="center">
				<s:a href="%{viewURL}">
					
					NO.<s:property value="mentor_no" /><br/>
					<img src="/SalaryMentoking/image/<s:property value="mentor_imagesav" />" width="250" height="250" /><br/>
					멘토 이름 : <s:property value="member_name" /><br/>
					멘토 직업 : <s:property value="mentor_job" /><br/>
					인사말 : ${mentor_intro2[colNo]}
					</s:a>
				<c:set var="colNo" value="${colNo+1}"/>
			</td>
			</c:when>
			<c:when test="${colNo % 3 == 2 }">
			<td align="center">
				<s:a href="%{viewURL}">
					
					NO.<s:property value="mentor_no" /><br/>
					<img src="/SalaryMentoking/image/<s:property value="mentor_imagesav" />" width="250" height="250" /><br/>
					멘토 이름 : <s:property value="member_name" /><br/>
					멘토 직업 : <s:property value="mentor_job" /><br/>
					인사말 : ${mentor_intro2[colNo]}
					</s:a>
				<c:set var="colNo" value="${colNo+1}"/>
			</td>
			</tr>
			</c:when>
		</c:choose>

       </s:iterator>

	  <s:if test="list.size() <= 0">
	      
	   <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
       </tr>						
    		
	</s:if>
</table>

<br/>

<table width="850">
	      
	    <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    		<tr align="right">
    		<td colspan="5">  	
     			<c:if test="${session.member_index==1 && equalid == null }"> <!-- 글을 안썻다 -->
 				<input type="button" value="멘토정보 등록" class="button" onClick="javascript:location.href='MTor_WriteForm.action?currentPage=<s:property value="currentPage" />';">
 				<input type="button" value="스케줄 등록" class="button" onClick="openConfirmId()">
 				</c:if>
 				
 				<c:if test="${session.member_index==1 && equalid != null }"	> <!-- 글을 썻다 -->
 				<input type="button" value="멘토정보 등록" class="button" onClick="windowclose()"> 				
 				<input type="button" value="스케줄 등록" class="button" onClick="javascript:location.href='S_WriteForm.action?currentPage=<s:property value="currentPage" />';">
 				</c:if>
			</td>
    	</tr>
</table>
<br/><br/><br/>
</body>
</html>