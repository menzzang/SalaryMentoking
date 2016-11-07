<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>직무 게시판</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/>
<style>


</style>
</head>

<body>

<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 직무 게시판<br></font>
			<img src="/SalaryMentoking/common/image/nametag/jobinterview.png" />
		</td>
	</tr>
</table>
<br><br>
  	
<table width="850" border="0" cellspacing="0" cellpadding="2" align="center" class="table">
	<thead>
		<tr>
			<th width="50">번호</th>
			<th width="300" align="left">제목</th>
			<th width="50">조회</th>
			<th width="100">날짜</th>
		</tr>
	</thead>

      <s:iterator value="list" status="stat">
      
      <s:url id="viewURL" action="IB_ViewAction" >
			<s:param name="iboard_no">
				<s:property value="iboard_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr bgcolor="#FFFFFF"  align="center" height="30">
        		<td><s:property value="iboard_no" /></td>
        		<td align="left"> &nbsp;<s:a href="%{viewURL}"><s:property value="iboard_subject" /></s:a></td>       				
        		<td><s:property value="iboard_readhit" /></td>
        		<td align="center"><s:property value="iboard_regdate" /></td>
      	 </tr>
      
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
    	   </tr>
    	    <tr align="right">
	    		<td colspan="5">
	    		<s:if test="#session.member_index == 0">
	    			<input type="button" class="button" value="글쓰기" onClick="javascript:location.href='IB_WriteForm.action?currentPage=<s:property value="currentPage" />';"/>
				</s:if>
				</td>
    	    </tr>
    	       
    	       <tr align="center">
				<td colspan="5">
					<form>
						<select name="searchNum">
							<option value="1">제목</option>
							<option value="2">내용</option>
						</select>
						<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
						<input name="submit" type="submit" value="검색" />
					</form>
				</td>
			</tr>	
	</table>
	<br/><br/><br/>
   </body>
</html>