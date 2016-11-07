<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">

<script type="text/javascript">



</script>

</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MP_Mypage.action">마이페이지</a> > 내가 쓴 글/댓글 보기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mylist.png" />
		</td>
	</tr>
</table>

<br><br>

<table width="500" border="0" height="60">
	<tr>
		<td align="center" width="250" >
			<a href="MP_MyList.action">* 내가 쓴 글 보기 *</a>
		</td>
		<td align="center" width="250">
			<a href="MP_MyList2.action">* 내가 쓴 댓글 보기 *</a>
		</td>
	</tr>
</table>

<br>

<!-- 검색기능 -->
<form>
<table width="800" border="0" bgcolor="lightgray" >
	<tr>
		<td align="center">
  	 		 <select name="searchNum">
   	 			<option value="0">원문제목</option>
    			<option value="1">댓글내용</option>
   			 </select>
   			 <s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:400px" maxlength="20" />
   			 <input type="submit" name="submit" value="검색">
   		</td>
 	</tr>
 	<tr>

 	   		<td align="center">* 검색할 내용을 입력해주세요 *</td>

   	</tr>
</table>
</form>

<table width="800"  align="center" border="0">

<!-- 전체게시판에서 내가 쓴 댓글 -->
	<tr>
		<td align="left" ><b>* 전체게시판 검색결과 </b>&nbsp; /&nbsp; 총 ${totalCount}개</td>
		<td align="right">
				<s:if test="searchKeyword != ''">
 					<s:if test="searchNum == 0">[원문제목으로 '</s:if>
 					<s:else>[댓글내용으로 '</s:else>
 					<font color="red">${searchKeyword}</font> '을(를) 검색한 결과]
 				</s:if>
 		</td>
	</tr>
	<tr><td colspan="2"><hr></td></tr>

</table>

<table border="0">
				<tr align="center" >
						<td width="80"><strong>댓글번호</strong></td>
						<td width="540"><strong>댓글내용</strong></td>
						<td width="80"><strong>날짜</strong></td>
					</tr>

					<tr bgcolor="#777777">
        				<td height="1" colspan="5"></td>
     				 </tr>
     				 
      				 <s:iterator value="list" status="stat">
						<s:if test="rcomment_index == 3">
      					<s:url id="viewURL" action="RB_ViewAction" >
							<s:param name="rboard_no">
								<s:property value="rboard_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
						</s:if>
						
						<s:else>
						<s:url id="viewURL" action="CB_ViewAction" >
							<s:param name="cboard_no">
								<s:property value="rboard_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
						</s:else>
					
						
					<tr bgcolor="#FFFFFF"  align="center">
        				<td rowspan="2"><s:property value="rcomment_no" /></td>
        				<td align="left"> &nbsp;
        					<s:if test="rcomment_index == 3"><font color="blue">후기게시판</font></s:if>
        					<s:else><font color="purple">자유게시판</font></s:else>
        					 / <s:a href="%{viewURL}"><s:property value="rcomment_content" /></s:a></td>
        				<td align="center" rowspan="2"><s:property value="rcomment_regdate" /></td>
      	      		</tr>
      	      		<tr>
      	      			<td align="left"><font color="gray">원문제목 : <s:property value="rcomment_passwd" /></font></td>
      	     		 <tr bgcolor="#777777">
        				<td height="1" colspan="5"></td>
      				</tr>
      				</s:iterator>
	      
	      			<s:if test="list.size() <= 0">
		      		<tr bgcolor="#FFFFFF"  align="center">
						<td colspan="5">등록된 게시물이 없습니다.</td>
                	 </tr>						
	     			 <tr bgcolor="#777777">
      					<td height="1" colspan="5"></td>
    	    		</tr>
    				 </s:if>
    				 
    				 <tr align="center">
    					<td colspan="5"> <s:property value="pagingHtml"  escape="false" /><br>
    					</td>
    	  		    </tr>
				</table>
		</td>
	</tr>
</table>
<br><br><br>
</center>
</body>
</html>