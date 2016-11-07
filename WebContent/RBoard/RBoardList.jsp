<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>후기 게시판</title>
	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/>
</head>

<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MTor_ListAction.action?currentPage=1">멘토 리스트</a> > <a href='MTor_ViewAction.action?mentor_no=<s:property value="mentor_no"/>'>멘토 상세보기</a> > 후기 게시판<br></font>
			<img src="/SalaryMentoking/common/image/nametag/reviewboard.png" /> 
		</td>
	</tr>
</table>
<br><br>

  	
  	
<table width="850" border="0" cellspacing="0" cellpadding="2" align="center" class="table">
	 	<s:hidden name="mentor_no" value="%{resultClass.mentor_no}"/>
	<thead>
		<tr>
			<th width="50">번호</th>
			<th width="250" align="left">제목</th>
			<th width="50">작성자</th>
			<th width="50">조회</th>
			<th width="100">날짜</th>
		</tr>
	</thead>

      
      <s:iterator value="list" status="stat">
      
      <s:url id="viewURL" action="RB_ViewAction" >
			<s:param name="rboard_no">
				<s:property value="rboard_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr bgcolor="#FFFFFF"  align="center" height="30">
        		<td><s:property value="rboard_no" /></td>
        		<td align="left"> &nbsp;<s:a href="%{viewURL}"><s:property value="rboard_subject" /></s:a></td>
        		<td><s:property value="member_id" /></td>
        		<td><s:property value="rboard_readhit" /></td>
        		<td align="center"><s:property value="rboard_regdate" /></td>
      	      </tr>

      
	      </s:iterator>
	      
	      <s:if test="list.size() <= 0">
	      
	       <tr bgcolor="#FFFFFF"  align="center">
			<td colspan="5">등록된 게시물이 없습니다.</td>
           </tr>						

	      </s:if>
</table>
<br></br>
<table width="850">  
	      
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
    	
    	      <tr align="right">
			<s:if test="#session.member_id != null">
    		<td colspan="5">
    			<input type="button" value="글쓰기" class="button" onClick="javascript:location.href='RB_WriteForm.action?currentPage=<s:property value="currentPage" />&mentor_no=<s:property value="mentor_no"/>';"/>
			</td>
			</s:if>
    		</tr>
   
    		  <tr align="center">
				<td colspan="5">
					<form>
						<select name="searchNum">
							<option value="0">작성자</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
						</select>
						 		
						<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
					
						<input name="submit" type="submit" value="검색"/>
						
					</form>
				</td>
			</tr>	
			
	</table>
	<br></br>
   </body>
</html>