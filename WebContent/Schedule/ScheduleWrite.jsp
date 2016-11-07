<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>스케쥴 쓰기</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<SCRIPT type="text/javascript">
	function check() {
			
			var schedule = document.schedule;
			if(schedule.schedule_subject.value == "") {
				alert("제목을 입력해주세요.");
				schedule.schedule_subject.focus();
				return false;			
			} 
			
			else if(schedule.schedule_content.value == "") {
				alert("내용을 입력해주세요.");
				schedule.schedule_content.focus();
				return false;			
			} 

			else if(schedule.schedule_time.value == "") {
				alert("시간을 입력해주세요.");
				schedule.schedule_time.focus();
				return false;
			} 
			
			else if(schedule.schedule_day.value == "") {
				alert("날짜를 입력해주세요.");
				schedule.schedule_day.focus();
				return false;
			} 
			
			else if(schedule.schedule_addr1.value == "") {
				alert("주소를 입력해주세요.");
				schedule.schedule_addr1.focus();
				return false;
			} 
		
			else if(schedule.schedule_addr4.value == "") {
				alert("장소를 입력해주세요.");
				schedule.schedule_addr1.focus();
				return false;
			} 
		
		
			
			else if(schedule.schedule_passwd.value == "") {
				alert("비밀번호를 입력해주세요.");
				schedule.schedule_passwd.focus();
				return false;			
			} 
			
			return true;
		}
</SCRIPT>

<script>	

		function openZipcode(schedule){
			var url="S_ZipCheckAction.action";
			open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=400");
		}
		
</script>
<SCRIPT LANGUAGE="JavaScript">
//  Written by Tan Ling wee
//  on 19 June 2005
//  email :  info@sparrowscripts.com
//    url : www.sparrowscripts.com

  var imagePath='http://www.blueb.co.kr/SRC/javascript/image4/';  //이미지경로
  var ie=document.all;
  var dom=document.getElementById;
  var ns4=document.layers;
  var bShow=false;
  var textCtl;

  function setTimePicker(t) {
    textCtl.value=t;
    closeTimePicker();
  }

  function refreshTimePicker(mode) {
    if (mode==0)
      { 
        suffix="am"; 
      }
    else
      { 
        suffix="pm"; 
      }

    sHTML = "<table><tr><td><table cellpadding=3 cellspacing=0 bgcolor='#f0f0f0'>";
    for (i=0;i<=11;i++) {

      sHTML+="<tr align=right style='font-family:verdana;font-size:9px;color:#000000;'>";

      if (i==0) {
        hr = 12;
      }
      else {
        hr=i;
      }  

      for (j=0;j<4;j++) {
        sHTML+="<td width=57 style='cursor:hand' onmouseover='this.style.backgroundColor=\"#66CCFF\"' onmouseout='this.style.backgroundColor=\"\"' onclick='setTimePicker(\""+ hr + ":" + padZero(j*15) + " " + suffix + "\")'><a style='text-decoration:none;color:#000000' href='javascript:setTimePicker(\""+ hr + ":" + padZero(j*15) + " " + suffix + "\")'>" + hr + ":"+padZero(j*15) + "<font color=\"#808080\">" + suffix + "</font></a></td>";
      }

      sHTML+="</tr>";
    }
    sHTML += "</table></td></tr></table>";
    document.getElementById("timePickerContent").innerHTML = sHTML;
  }

  if (dom){
    document.write ("<div id='timepicker' style='z-index:+999;position:absolute;visibility:hidden;'><table style='border-width:3px;border-style:solid;border-color:#0033AA' bgcolor='#ffffff' cellpadding=0><tr bgcolor='#0033AA'><td><table cellpadding=0 cellspacing=0 width='100%' background='" + imagePath + "titleback.gif'><tr valign=bottom height=21><td style='font-family:verdana;font-size:11px;color:#ffffff;padding:3px' valign=center><B>     </B></td><td><img id='iconAM' src='" + imagePath + "am1.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am1.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm2.gif\";refreshTimePicker(0)' style='cursor:hand'></td><td><img id='iconPM' src='" + imagePath + "pm2.gif' onclick='document.getElementById(\"iconAM\").src=\"" + imagePath + "am2.gif\";document.getElementById(\"iconPM\").src=\"" + imagePath + "pm1.gif\";refreshTimePicker(1)' style='cursor:hand'></td><td align=right valign=center> <img onclick='closeTimePicker()' src='" + imagePath + "close.gif'  STYLE='cursor:hand'> </td></tr></table></td></tr><tr><td colspan=2><span id='timePickerContent'></span></td></tr></table></div>");
    refreshTimePicker(0);
  }

  var crossobj=(dom)?document.getElementById("timepicker").style : ie? document.all.timepicker : document.timepicker;
  var currentCtl

  function selectTime(ctl,ctl2) {
    var leftpos=0
    var toppos=0

    textCtl=ctl2;
    currentCtl = ctl
    currentCtl.src=imagePath + "timepicker2.gif";

    aTag = ctl
    do {
      aTag = aTag.offsetParent;
      leftpos  += aTag.offsetLeft;
      toppos += aTag.offsetTop;
    } while(aTag.tagName!="BODY");
    crossobj.left =  ctl.offsetLeft  + leftpos 
    crossobj.top = ctl.offsetTop +  toppos + ctl.offsetHeight +  2 
    crossobj.visibility=(dom||ie)? "visible" : "show"
    hideElement( 'SELECT', document.getElementById("calendar") );
    hideElement( 'APPLET', document.getElementById("calendar") );      
    bShow = true;
  }

  // hides <select> and <applet> objects (for IE only)
  function hideElement( elmID, overDiv ){
    if( ie ){
      for( i = 0; i < document.all.tags( elmID ).length; i++ ){
        obj = document.all.tags( elmID )[i];
        if( !obj || !obj.offsetParent ){
            continue;
        }
          // Find the element's offsetTop and offsetLeft relative to the BODY tag.
          objLeft   = obj.offsetLeft;
          objTop    = obj.offsetTop;
          objParent = obj.offsetParent;
          while( objParent.tagName.toUpperCase() != "BODY" )
          {
          objLeft  += objParent.offsetLeft;
          objTop   += objParent.offsetTop;
          objParent = objParent.offsetParent;
          }
          objHeight = obj.offsetHeight;
          objWidth = obj.offsetWidth;
          if(( overDiv.offsetLeft + overDiv.offsetWidth ) <= objLeft );
          else if(( overDiv.offsetTop + overDiv.offsetHeight ) <= objTop );
          else if( overDiv.offsetTop >= ( objTop + objHeight + obj.height ));
          else if( overDiv.offsetLeft >= ( objLeft + objWidth ));
          else
          {
          obj.style.visibility = "hidden";
          }
      }
    }
  }
  //unhides <select> and <applet> objects (for IE only)
  function showElement( elmID ){
    if( ie ){
      for( i = 0; i < document.all.tags( elmID ).length; i++ ){
        obj = document.all.tags( elmID )[i];
        if( !obj || !obj.offsetParent ){
            continue;
        }
        obj.style.visibility = "";
      }
    }
  }

  function closeTimePicker() {
    crossobj.visibility="hidden"
    showElement( 'SELECT' );
    showElement( 'APPLET' );
    currentCtl.src=imagePath + "timepicker.gif"
  }

  document.onkeypress = function hideTimePicker1 () { 
    if (event.keyCode==27){
      if (!bShow){
        closeTimePicker();
      }
    }
  }

  function isDigit(c) {
    return ((c=='0')||(c=='1')||(c=='2')||(c=='3')||(c=='4')||(c=='5')||(c=='6')||(c=='7')||(c=='8')||(c=='9'))
  }

  function isNumeric(n) {
    num = parseInt(n,10);

    return !isNaN(num);
  }

  function padZero(n) {
    v="";
    if (n<10){ 
      return ('0'+n);
    }
    else
    {
      return n;
    }
  }

  function validateDatePicker(ctl) {

    t=ctl.value.toLowerCase();
    t=t.replace(" ","");
    t=t.replace(".",":");
    t=t.replace("-","");

    if ((isNumeric(t))&&(t.length==4))
    {
      t=t.charAt(0)+t.charAt(1)+":"+t.charAt(2)+t.charAt(3);
    }

    var t=new String(t);
    tl=t.length;

    if (tl==1 ) {
      if (isDigit(t)) {
        ctl.value=t+":00 am";
      }
      else {
        return false;
      }
    }
    else if (tl==2) {
      if (isNumeric(t)) {
        if (parseInt(t,10)<13){
          if (t.charAt(1)!=":") {
            ctl.value= t + ':00 am';
          } 
          else {
            ctl.value= t + '00 am';
          }
        }
        else if (parseInt(t,10)==24) {
          ctl.value= "0:00 am";
        }
        else if (parseInt(t,10)<24) {
          if (t.charAt(1)!=":") {
            ctl.value= (t-12) + ':00 pm';
          } 
          else {
            ctl.value= (t-12) + '00 pm';
          }
        }
        else if (parseInt(t,10)<=60) {
          ctl.value= '0:'+padZero(t)+' am';
        }
        else {
          ctl.value= '1:'+padZero(t%60)+' am';
        }
      }
      else
           {
        if ((t.charAt(0)==":")&&(isDigit(t.charAt(1)))) {
          ctl.value = "0:" + padZero(parseInt(t.charAt(1),10)) + " am";
        }
        else {
          return false;
        }
      }
    }
    else if (tl>=3) {

      var arr = t.split(":");
      if (t.indexOf(":") > 0)
      {
        hr=parseInt(arr[0],10);
        mn=parseInt(arr[1],10);

        if (t.indexOf("pm")>0) {
          mode="pm";
        }
        else {
          mode="am";
        }

        if (isNaN(hr)) {
          hr=0;
        } else {
          if (hr>24) {
            return false;
          }
          else if (hr==24) {
            mode="am";
            hr=0;
          }
          else if (hr>12) {
            mode="pm";
            hr-=12;
          }
        }
        if (isNaN(mn)) {
          mn=0;
        }
        else {
          if (mn>60) {
            mn=mn%60;
            hr+=1;
          }
        }
      } else {

        hr=parseInt(arr[0],10);

        if (isNaN(hr)) {
          hr=0;
        } else {
          if (hr>24) {
            return false;
          }
          else if (hr==24) {
            mode="am";
            hr=0;
          }
          else if (hr>12) {
            mode="pm";
            hr-=12;
          }
        }

        mn = 0;
      }
      if (hr==24) {
        hr=0;
        mode="am";
      }
      ctl.value=hr+":"+padZero(mn)+" "+mode;
    }
  }

</SCRIPT>



</script>

<link rel="stylesheet" type="text/css" href="http://www.blueb.co.kr/SRC/javascript/epoch_styles.css" />
	<script type="text/javascript" src="http://www.blueb.co.kr/SRC/javascript/epoch_classes.js"></script>
	<script type="text/javascript">
	var bas_cal,dp_cal,ms_cal;      
	window.onload = function () {

	dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));

};
	
</script>

</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="javascript:history.go(-1)">멘토 리스트</a> > 스케쥴 등록하기<br></font>
			<img src="/choi/common/image/nametag/schedule.png" /> 
		</td>
	</tr>
</table>
<br><br>
  	<table width="850" border="0" cellspacing="0" cellpadding="2">

  		

  	<s:if test="resultClass == NULL">
			<form name="schedule" action="S_WriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return check();">
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:if test="MTorresultClass == null">
				<s:hidden name="mentor_no" value="%{mentor_no}"/>
			</s:if>
			<s:else>
				<s:hidden name="mentor_no" value="%{MTorresultClass.mentor_no}"/>
			</s:else>
	</s:if>
	<s:else>
		  <form action="S_ModifyAction.action" method="post" enctype="multipart/form-data" onsubmit="return check();">
 		  <s:hidden name="schedule_no" value="%{resultClass.schedule_no}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:if test="MTorresultClass == null">
			<s:hidden name="mentor_no" value="%{mentor_no}"/>
	    </s:if>
		<s:else>
			<s:hidden name="mentor_no" value="%{MTorresultClass.mentor_no}"/>
		</s:else>
	</s:else>
	
  	</table>
	 
	 <table width="850" border="0" cellspacing="0" cellpadding="0">
		 <input type="hidden" name="mentor_no" value="${mentor_no}" />
       <input type="hidden" name="currentPage" value="${currentPage}" />
        <tr>
          <td align="left" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
          
    <tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  제목 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="schedule_subject" theme="simple" value="%{resultClass.schedule_subject}" cols="50" rows="2" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
         <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>   내용</td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="schedule_content" theme="simple" value="%{resultClass.schedule_content}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
          
         <tr>
          <td bgcolor="#e9e9e9"><font color="#FF0000">*</font> 멘토링 시간</td>
          <td bgcolor="#FFFFFF">
          
 	<table> 
    <tr valign=center>
      <td><input id='timepicker1'  name="schedule_time"   type='text' value='12:00 pm' size=8 maxlength=8 ONBLUR="validateDatePicker(this)"></td>
      <td><IMG SRC="http://www.blueb.co.kr/SRC/javascript/image4/timepicker.gif" BORDER="0" ALT="Pick a Time!" ONCLICK="selectTime(this,timepicker1)" STYLE="cursor:hand"></td>
    </tr>
        <tr valign=right>
      <td><input id='timepicker2'  name="schedule_time" type='text' value='12:00 pm' size=8 maxlength=8 ONBLUR="validateDatePicker(this)"></td>
      <td><IMG SRC="http://www.blueb.co.kr/SRC/javascript/image4/timepicker.gif" BORDER="0" ALT="Pick a Time!" ONCLICK="selectTime(this,timepicker2)" STYLE="cursor:hand"></td>
    </tr>
  </table>
          </td>
        </tr>
      <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
            <tr bgcolor="000000">
			<td height="1" colspan="2"></td>
		</tr>
          
        <tr bgcolor="000000">
			<td height="1" colspan="2"></td>
		</tr>
		<tr height="50">
			<td align="center" bgcolor="#e9e9e9" width="50">*<font size="2"><strong>멘토링 날짜</strong></font></td>
			<td width="300" bgcolor="#FFFFFF">
				<table cellpadding=0>
				&nbsp;&nbsp;<input readonly type="text" id="popup_container" name="schedule_day" theme="simple" maxlength="100" onclick="fnPopUpCalendar(txtDate,txtDate,'yyyymmdd')" class='text_box1'>&nbsp;&nbsp;(MM/DD)
				</table>
			</td>
		</tr>
		
		<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
		</tr>
          
    <tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">*<font size="2"><strong>주소</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly type="text" name="schedule_addr1" theme="simple" maxlength="7" value="${resultClass.schedule_addr1}"/>		
		<input type="button" name="zipCheck" value="검색" onclick="openZipcode(this.form)" class="topb"/>
		</td>
	</tr>

	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">*<font size="2"><strong>나머지 주소 및 상세주소</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;<input readOnly type="text" name="schedule_addr2" theme="simple" maxlength="7" value="${resultClass.schedule_addr2}"/>
			<input readOnly name="schedule_addr3" theme="simple" maxlength="7" value="${resultClass.schedule_addr3}"/>
			<input type="text" name="schedule_addr4" theme="simple" maxlength="7" value="${resultClass.schedule_addr4}"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>인원수</td>
				<td colspan="5">

						<select name="schedule_count" theme="simple" value="%{resultClass.schedule_count}" cssStyle="width:100px" maxlength="20"/>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select>
				</td>
			</tr>
			
		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>	
        
         <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비밀번호 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="schedule_passwd" theme="simple" value="%{resultClass.schedule_passwd}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        <tr>
          <td align="right" colspan="2">
 			<input name="submit" type="submit" value="등록하기" class="button">
            <input name="list" type="button" value="취소" class="button" onClick="javascript:location.href='S_ListAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>
    	</table>
    	</form>
    	<br><br><br>
  </body>
</html>

