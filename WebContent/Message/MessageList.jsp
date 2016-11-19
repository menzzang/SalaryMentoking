<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">

<script type="text/javascript" src="/SalaryMentoking/common/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

function selectEvent(selectObj){
	location.href = "Message_ListAction.action?" + selectObj.value;
}

//체크박스 전체선택
function allChk(obj){
	var chkObj = document.getElementsByName("dellist");
	var rowCnt = chkObj.length - 1;
	var check = obj.checked;
	
	if(check){
		for(var i = 0; i <= rowCnt; i++){
			if(chkObj[i].type == "checkbox")
				chkObj[i].checked = true;
		}
	}else{
		for(var i = 0; i <= rowCnt; i++){
			if(chkObj[i].type == "checkbox"){
				chkObj[i].checked = false;
			}
		}
	}
}


function checkIt(){
 	var message_no = "";
	var messageChk = document.getElementsByName("dellist");
	var chked = false;
	var indexid = false;
	
	for(i = 0; i < messageChk.length; i++){
		if(messageChk[i].checked){

			indexid = true;
		}
	}
	if(!indexid){							
		alert("삭제할 사용자를 체크해주세요");
		return false;
	}
	
	var agree = confirm("삭제 하시겠습니까?");
	if(agree){
		document.deleteList.submit();					
	}
	return false;
}

function messageWrite(){
	url = "Message_WriteForm.action?state=read";
	window.open(url,"post","toolbar=no,width=600,height=550,direction=no,status=yes,scrollbars=yes,menubar=no");
}

function messageViewR(message_no){
	url = "Message_ViewAction.action?state=read&message_no=" + message_no;
	window.open(url,"post","toolbar=no,width=600,height=600,direction=no,status=yes,scrollbars=yes,menubar=no");
}

function messageViewS(message_no){
	url = "Message_ViewAction.action?state=send&message_no=" + message_no;
	window.open(url,"post","toolbar=no,width=600,height=600,direction=no,status=yes,scrollbars=yes,menubar=no");
}

</script>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 쪽지함<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mymessage.png" />
		</td>
	</tr>
</table>

<br>

<form action="Message_Delete.action" method="post" name="deleteList" enctype="multipart/form-data" onSubmit="return checkIt()">
<table width="1100px" cellpadding="10">
	<tr>
		<td align="left">
			<input type="button" name="write" onClick="messageWrite()" value="쪽지 보내기" class="button">
			<input type="submit" name="confirm" value="선택삭제" class="button">
		</td>
		
		<td align="right">
			<select name="state" onChange="javascript:selectEvent(this)">
				<c:if test="${state == 'read' }">
					<option id="state=read" value="state=read" selected>받은 쪽지함</option>
					<option id="state=send" value="state=send">보낸 쪽지함</option>
				</c:if>
				<c:if test="${state == 'send' }">
					<option id="state=read" value="state=read">받은 쪽지함</option>
					<option id="state=send" value="state=send" selected>보낸 쪽지함</option>
				</c:if>
			</select>
		</td>
	</tr>
</table>

<table width="1100px" cellpadding="10" class="table">
	<thead>
	<tr align="left">
		<th width="75px" align="center">
			<input type="checkbox" onclick="allChk(this);" />
		</th>
		<input type="hidden" name="state" value="${state }" />
		<th width="150px">
			<c:if test="${ state == 'read' }">
				보낸사람
			</c:if>
			<c:if test="${ state == 'send' }">
				받는사람
			</c:if>
		</th>
		
		<c:if test="${ state == 'read' }">
			<th width="725px">
				내용
			</th>
		</c:if>
		
		<c:if test="${ state == 'send' }">
			<th width="650px">
				내용
			</th>
		</c:if>
		
		<c:if test="${ state == 'read' }">
			<th width="100px">
				받은날짜
			</th>
		</c:if>
		<c:if test="${ state == 'send' }">
			<th width="100px">
				보낸날짜
			</th>
			<th width="75px" align="center">
				수신확인
			</th>
		</c:if>
	</tr>
	</thead>
	<c:set var="colNo" value="0" />
	<!-- 반복영역 -->
	<s:iterator value="list" status="stat">
		<tr>
			<td align="center">
				<input type="checkbox" name="dellist" value="<s:property value='message_no' />" />
			</td>
			<td>
				<c:if test="${ state == 'read' }">
					<s:property value="message_send" />
				</c:if>
				<c:if test="${ state == 'send' }">
					<s:property value="message_read" />
				</c:if>
			</td>
			<td>
				<c:if test="${ state == 'read' }">
					<a href="#" onClick="messageViewR(${ message_no })">${message_con[colNo] }</a>
				</c:if>
				<c:if test="${state == 'send' }">
					<a href="#" onClick="messageViewS(${message_no})">${message_con[colNo] }</a>
				</c:if>
			</td>
			<c:if test="${ state == 'read' }">
				<td>
					<s:property value="message_senddate" />
				</td>
			</c:if>
			<c:if test="${ state == 'send' }">
				<td>
					<s:property value="message_senddate" />
				</td>
				<td align="center">
					<s:if test="%{message_readdate == null}">
						X
					</s:if>
					<s:if test="%{message_readdate != null}">
						O
					</s:if>
				</td>
			</c:if>
		</tr>
		<c:set var="colNo" value="${colNo+1 }" />
	</s:iterator>
</table>
<br>
<table>
	<tr>
		<td align="center" align="center" colspan="4">
			<s:property value="pagingHtml" escape="false" />
		</td>
	</tr>
</table>
</form>

<br><br><br><br>


</body>
</html>