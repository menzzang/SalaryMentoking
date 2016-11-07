<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Struts2 Board</title>

<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css"/>

<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" >
	function check(){
		var memJoin = document.memJoin;
		
		 if (!memJoin.agree.checked) {
			alert('이용 약관에 동의 후 회원가입을 진행하실 수 있습니다.');
			memJoin.agree.focus();
			return false;
		} else if (!memJoin.agree2.checked) {
			alert('개인 정보 수집에 동의 후 회원가입을 진행하실 수 있습니다.');
			memJoin.agree2.focus();
			return false;
		}else if(memJoin.member_id.value==""){
			alert("아이디를 입력해주세요.");
			memJoin.member_id.focus();
			return false;
		}
		else if(memJoin.member_passwd.value==""){
			alert("비밀번호를 입력해주세요.");
			memJoin.member_passwd.focus();
			return false;
		}
		else if(memJoin.member_passwd.value != memJoin.member_passwd1.value){
			alert("비밀번호가 일치하지 않습니다.");
			memJoin.member_passwd1.focus();
			return false;
		}
		else if(memJoin.member_name.value==""){
			alert("이름을 입력해주세요.");
			memJoin.member_name.focus();
			return false;
		}
		else if(memJoin.member_sex.value==""){
			alert("성별을 체크해주세요");
			return false;
		}
		else if(memJoin.member_email.value==""){
			alert("이메일을 입력해주세요.");
			memJoin.member_email.focus();
			return false;
		}
		else if(memJoin.member_phone.value==""){
			alert("핸드폰 번호를 입력해주세요.");
			memJoin.member_phone.focus();
			return false;
		}
		else if(memJoin.member_zipcode.value==""){
			alert("우편번호를 입력해주세요.");
			memJoin.member_zipcode.focus();
			return false;
		}
		else if(memJoin.submit.value=="회원가입"){
			alert("회원가입을 환영합니다!");
			return true;
		}
		else if(memJoin.submit.value=="회원정보수정"){
			alert("회원정보를 수정하였습니다");
			return true;
		}else if (memJoin.agree.checked && memJoin.agree2.checked) {
			location.href="Mem_SelectAction.action?member_index=2"; 
		}
		return false;
	}
	
	function openConfirmId(memJoin){
		var url="Mem_IdCheckAction.action?member_id="+document.memJoin.member_id.value;
		var join=document.memJoin;
		if(memJoin.member_id.value==""){
			alert("아이디를 입력해주세요");
			memJoin.member_id.focus();
			return false;
		}
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400");
	}
	function openZipcode(memJoin){
		var url="ZipCheckAction.action";
		open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=300,height=400");
	}
	
	$(function(){
		$("#datepicker").datepicker({
			dateFormat:'yy-mm-dd',
			monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			changeMonth : true,
			changeYear : true,
			 yearRange: "1988:",
			showMonthAfterYear : true,
		});
		
		$('.onlyAlphabetAndNumber').keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); 
            }
        });
		
		$(".onlyHangul").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
            }
        });
     
        $(".onlyNumber").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
	});
	</script>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<s:if test="#session.member_id == null">
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 회원가입<br></font>
			<img src="/SalaryMentoking/common/image/nametag/join.png" />
		</td>
	</tr>
</table>
<br>


</s:if>
<s:else>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MP_Mypage.action">마이페이지</a> > 회원 정보 수정<br></font>
			<img src="/SalaryMentoking/common/image/nametag/myinfo.png" />
		</td>
	</tr>
</table>
</s:else>

	 <!-- 개인회원 -->
	<s:if test="#session.member_id == null">
		<s:if test="member_index==1">
			<form action="MTor_JoinAction.action" name="memJoin" method="post" onsubmit="return check();">
		</s:if>
		<s:else>
			<form action="Mem_JoinAction.action" name="memJoin" method="post" onsubmit="return check();">
		</s:else>
	
	</s:if>
	<s:else>
	<form action="MP_ModifyAction.action" name="memJoin" method="post" onsubmit="return check();">
	</s:else>

 	<br>
 	<br>
 	<table align="center" width="850" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;이용 약관</strong></td>
		</tr>
		
		<tr height="25">
			<td></td>
		</tr>
		
		<tr align="center" bgcolor="#888888" height="1">
			<td colspan="4"></td>
		</tr>
	</table>
	<br>
	<br>
	
 	
 	<table align="center" width="850" border="0" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td align="center">
				<textarea align="left" wrap="hard" theme="simple" rows="10" cols="90" readonly>
		개인 회원 약관 (개정 2014. 08. 04 / 적용 2014. 08. 04)
제1조(목적)
본 약관은 ㈜셀러리맨-토킹(이하 "계열사")이 각각 운영하는 웹사이트(이하 "사이트")를 통해 인터넷 관련 서비스를 제공함에 있어, 회사가 제공하는 서비스와 관련하여, 이를 이용하는 가입자(이하 "회원" 또는 "개인회원")의 이용조건 및 제반 절차, 기타 필요한 사항을 규정함을 목적으로 한다.
제2조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 아래와 같다.
① "사이트"라 함은 "회사"와 "계열사"가 서비스를 "개인회원" 에게 제공하기 위하여 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함) 등 정보통신설비를 이용하여 설정한 가상의 영업장 또는 회사가 각각 운영하는 웹사이트를 말하며, 통합된 하나의 아이디 및 비밀번호(이하 "통합 계정")를 이용하여 서비스를 제공받을 수 있는 아래의 사이트로 정의한다.
1. 셀러리맨-토킹 : www.JOBara.co.kr
② "계열사"라 함은 아르바이트 구인, 구직 사이트인 셀러리맨-토킹를 운영하고 있는 셀러리맨-토킹그룹의 계열회사를 의미한다.
③ "통합 계정"이라 함은 "개인회원"이 "회사" 혹은 "계열사"에 개인정보를 제공하여 회원등록을 하고, 부여받은 아이디로 '셀러리맨-토킹' 에 자유롭게 접속할 수 있는 회원ID 및 비밀번호를 말한다. 이 때, 각 사이트에 접속을 위한 최소한의 정보를 공유한다.
1. 공유하는 정보의 범위 : 사이트의 로그인에 필요한 인증정보 (아이디, 패스워드, 회원인증정보)
2. 공유방식 : 아이디와 암호화된 패스워드, 회원인증정보를 DB에 저장하는 방식
④ "서비스"라 함은 "회사"가 기업(단체, 사업자, 교육기관) 또는 개인이 구인, 구직과 교육을 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 해당 인터넷 주소에서 제공하는 모든 부대 서비스를 말한다.
⑤ "개인회원"이라 함은 서비스를 이용하기 위하여 동 약관에 동의하고 회사와 이용계약을 체결하여 이용자ID를 부여 받은 개인을 말한다.
⑥ "이용자ID" 또는 "회원ID"라 함은 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 부여하는 문자와 숫자의 조합을 말한다.
⑦ "비밀번호"라 함은 회사의 서비스를 이용하려는 사람이 이용자ID를 부여 받은 자와 동일인임을 확인하고 회원의 권익을 보호하기 위하여 회원이 선정한 문자와 숫자의 조합을 말한다.
제3조 (약관의 명시와 개정)
① 회사는 이 약관의 내용과 상호, 영업소 소재지, 사업자등록번호, 연락처 등을 이용자가 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 이용자에게 공지해야 한다.
② 회사는 약관의규제등에관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.
③ 회사가 약관을 개정할 경우에는 개정 약관 적용일 최소 7일전(약관의 변경이 소비자에게 불리한 경우에는 30일전)부터 웹사이트 초기화면 공지사항 또는 이메일을 통해 고지한다.
④ 이용자는 변경된 약관에 대해 거부할 권리가 있다. "이용자"는 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "이용자"가 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "이용자"에게 사전 통지 후 당해 "이용자"와의 계약을 해지할 수 있다. 만약, "이용자"가 거부의사를 표시하지 않고 "서비스"를 계속 이용하는 경우에는 동의하는 것으로 간주한다.
제4조 (약관 외 준칙)
이 약관에서 규정하지 않은 사항에 관해서는 약관의규제등에관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등의 관계법령에 따른다.
제5조 (이용계약의 성립)
① 회사의 서비스 이용계약(이하 '이용계약'이라 한다)은 서비스를 이용하고자 하는 자의 본 약관과 개인정보취급방침의 내용에 대한 동의 및 이용신청(회원가입신청)에 대하여 회사가 승낙함으로써 성립한다.
② 서비스를 이용하고자 하는 자가 이용신청 당시 웹상의 "동의함"에 체크 후 회원인증 과정을 완료시 본 약관 및 개인정보취급방침에 대하여 동의한 것으로 간주한다.
③ 제1항의 승낙은 이용신청자의 본 약관에 대한 동의를 확인하고 전자메일 또는 서면으로 통지함으로써 이루어지고 이러한 승낙의 통지가 이용신청자에게 도달하면 이용계약이 성립한다.
제6조 (서비스 이용신청)
① 회원으로 가입하여 본 서비스를 이용하고자 하는 이용고객은 회원인증 방식(휴대폰 인증, 아이핀 인증)을 선택하여 회사에서 요청하는 제반정보(이름, 외국인등록번호, 여권번호, 생년월일, 전화번호, 휴대폰 번호 등)를 제공하여야 한다
② 실명으로 등록하지 않은 사용자는 일체의 권리를 주장할 수 없다.
③ 타인의 명의를 도용하여 이용신청을 한 회원의 모든 ID는 삭제되며, 관계법령에 따라 처벌을 받을 수 있다.
④ 만 15세 미만자의 회원가입은 금지되며 성명, 연령, 기타의 정보를 허위로 기재한 경우에는 이용정지, 강제탈퇴, 손해배상청구 등 불이익이 부과될 수 있다.
제7조 (이용신청의 승낙과 제한)
① 회사는 전조의 규정에 이한 이용신청 고객에 대하여 업무수행상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수순서에 따라 서비스 이용을 승낙한다.
② 회사는 아래사항에 해당하는 경우에 대해서는 이용신청을 승낙하지 아니한다.
1. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우
2. 이용계약 신청서의 내용을 허위로 기재한 경우
③ 회사는 아래사항에 해당하는 경우에는 그 신청에 대하여 승낙제한 사유가 해소될 때까지 승낙을 유보할 수 있다.
1. 회사가 설비의 여유가 없는 경우
2. 회사의 기술상 지장이 있는 경우
3. 기타 회사의 사정(회사의 귀책 사유 있는 경우도 포함)으로 이용승낙이 곤란한 경우
제8조 (통합 계정 제도)
① 회원은 하나의 "통합 계정"을 통해 본 약관 2조 1항에 명기한 사이트 및 해당 서비스를 이용할 수 있다.
단, 원활한 서비스 이용을 위해 최초 1회 회원정보 이관 절차를 거친다.
② "통합 계정"을 제외한 최초 1회 이관된 회원정보는 이후 '셀러리맨-토킹' 에서 독립적으로 관리된다.
③ 회원은 탈퇴 시 ‘셀러리맨-토킹’에 대해 개별 또는 일괄 탈퇴 여부를 선택할 수 있다. 개별 탈퇴한 경우에는 탈퇴하지 않은 사이트에서는 통합 계정을 계속해서 이용할 수 있다.
④ 회사는 회원이 사이트 및 서비스를 쉽게 이용할 수 있도록 회원의 통합 계정제도를 관리하거나, 운영측면으로 개선, 변경할 수 있다.
제9조 (서비스의 내용)
① 회사는 제2조 4항의 서비스를 제공할 수 있으며 그 내용은 다음 각 호와 같다.
1. 인재 데이터베이스 검색를 위한 이력서 등록서비스
2. 온라인 입사지원 서비스
3. 헤드헌팅/아웃소싱 서비스
4. 구인/구직과 관련된 제반 서비스
제10조 (개인회원 정보, 이력서 노출)
① 개인회원의 이력서는 개인이 회원가입 또는 이력서 작성 및 수정시 희망한 형태로 이력서를 노출한다.
② 회사는 개인회원이 이력서의 인재정보 등록/미등록 지정, 이력서상의 연락처 공개/비공개를 자유롭게 선택할 수 있도록 하여야 한다.
③ 회사는 개인회원이 이력서를 인재정보에 등록하기를 희망했을 경우 유·무료이력서 검색을 신청한 기업회원이 열람 가능하도록 할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다.
④ 회사는 개인회원이 등록한 이력서를 아이디 휴면상태 이전까지 노출할 수 있으며, 회사가 지정한 기간이 지난 이력서는 개인회원 탈퇴시 까지 관리할 수 있다.
제11조(제휴를 통한 서비스)
① 회사는 제휴 관계를 체결한 여타 인터넷 웹 사이트 또는 신문, 잡지 등의 오프라인 매체를 통해 사이트에 등록한 개인회원의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 개인회원의 경우 제휴 서비스를 통해 노출되는 이력서의 연락처 정보는 제10조의 각 항에 따른다.
② 회사는 개인회원에게 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지하고 동의를 받아야 하며, 제휴 사이트 전체 목록을 사이트내에서 상시 열람할 수 있도록 해야 한다.
제12조 (서비스의 요금)
① 개인회원 가입과 이력서 등록은 무료이다. 다만 기업회원 또는 사이트에 방문한 기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료옵션 등 회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다.
② 회사는 유료서비스를 제공할 경우 사이트에 요금에 대해서 공지를 하여야 한다.
③ 회사는 유료서비스 이용금액이 변경되는 경우 변경된 금액 적용일 최소 7일전(금액의 변경이 소비자에게 불리한 경우에는 30일전)부터 웹사이트 초기화면 공지사항 또는 이메일을 통해 고지한다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.
제13조 (서비스 이용시간)
① 회사는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, 회사는 서비스의 종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 회사는 그 이용시간을 사전에 회원에게 공지 또는 통지하여야 한다.
② 회사는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 정기 PM작업, 시스템 교체작업, 회선 장애 등이 발생한 경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다.
제14조 (서비스 제공의 중지)
① 회사는 다음 각 호에 해당하는 경우 서비스의 제공을 중지할 수 있다.
1. 설비의 보수 등 회사의 필요에 의해 사전에 회원들에게 통지한 경우
2. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우
3. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우
② 전항의 경우, 회사는 기간의 정함이 있는 유료서비스 이용자들에게는 그 이용기간을 연장하는 등의 방법으로 손실을 보상하여야 한다.
제15조 (정보의 제공 및 광고의 게재)
① 회사는 회원에게 서비스 이용에 필요가 있다고 인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보를 회원이 수신동의한 경우, 전자우편, 서신우편, SMS(Short Message Service), MMS(Multimedia Message Service)로 제공할 수 있다.
② 회사는 제공하는 서비스와 관련되는 정보 또는 광고를 서비스 화면, 홈페이지 등에 게재할 수 있으며, 회원들에게 전자우편 및 SMS, MMS를 통해 알릴 수 있다.
③ 회사는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해, 회사의 고의ㆍ중과실로 인한 경우가 아닌 한, 책임을 지지 않는다.
④ 본 서비스의 회원은 서비스 이용 시 노출되는 광고게재에 대해 동의 하는 것으로 간주한다.
제16조 (자료 내용의 책임과 회사의 정보 수정 권한)
① 자료내용은 회원이 등록한 개인정보 및 이력서와 사이트에 게시한 게시물을 말한다.
② 회원은 자료 내용 및 게시물을 사실에 근거하여 성실하게 작성해야 하며, 만일 자료의 내용이 사실이 아니거나 부정확하게 작성되어 발생하는 모든 책임은 회원에게 있다.
③ 모든 자료내용의 관리와 작성은 회원 본인이 하는 것이 원칙이나 사정상 위탁 또는 대행관리를 하더라도 자료내용의 책임은 회원에게 있으며 회원은 주기적으로 자신의 자료를 확인하여 항상 정확하게 관리가 되도록 노력해야 한다.
④ 회사는 개인회원이 등록한 자료 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구가 있을 경우 이를 언제든지 수정할 수 있다.
제17조 (자료 내용의 활용 및 온라인 입사 지원 정보)
① 개인회원이 입력한 정보는 개인을 식별할 수 없는 형태로 제공되어 취업 및 관련 동향의 통계 자료로 활용될 수 있으며 그 자료는 매체를 통해 언론에 배포될 수 있다.
② 회사는 '사이트'의 온라인 입사 지원 시스템을 통해 해당 기업에게 제공된 개인회원의 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에 의한다.
제18조 (회사의 의무)
① 회사는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다해야 한다.
② 회사는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는 기타 방법을 통해 동 회원에게 통지하여야 한다.
③ 회사는 유료 결제와 관련한 결제 사항 정보를 상법 등 관련법령의 규정에 의하여 5년 이상 보존한다.
④ 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는 회사가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다.
⑤ 회원의 자료를 본 서비스 이외의 목적으로 제3자에게 제공하거나 열람시킬 경우 반드시 회원의 동의를 얻어야 한다.
제19조 (회원의 의무)
① 회원은 관계법령과 본 약관의 규정 및 기타 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 해서는 안 된다.
② 회원이 신청한 유료서비스는 등록 또는 신청과 동시에 회사와 채권, 채무 관계가 발생하며, 회원은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다.
③ 회원이 결제 수단으로 신용카드를 사용할 경우 비밀번호 등 정보 유실 방지는 회원 스스로 관리해야 한다. 단, 사이트의 결함에 따른 정보유실의 발생에 대한 책임은 회원의 의무에 해당하지 아니한다.
④ 회원은 서비스를 이용하여 얻은 정보를 회사의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.
⑤ 회원은 본 서비스를 건전한 구인 구직 이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안된다.
1. 다른 회원의 아이디를 부정 사용하는 행위
2. 범죄행위을 목적으로 하거나 기타 범죄행위와 관련된 행위
3. 타인의 명예를 훼손하거나 모욕하는 행위
4. 타인의 지적재산권 등의 권리를 침해하는 행위
5. 해킹행위 또는 바이러스의 유포 행위
6. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 계속적으로 전송하는 행위
7. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위
8. 사이트의 정보 및 서비스를 이용한 영리 행위
9. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위
제20조 (회원의 가입해지/서비스중지/자료삭제)
① 개인회원이 가입 해지를 하고자 할 때는 고객센터 또는 "개인회원 탈퇴" 메뉴를 이용해 해지 신청을 해야 한다, 이때 회원은 '셀러리맨-토킹'에 대해 개별 또는 일괄 탈퇴 여부를 선택할 수 있다.
② "회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸된다.
③ 다음의 사항에 해당하는 경우 회사는 사전 동의없이 가입해지나 서비스 중지, 이력서 삭제 조치를 취할 수 있다.
1. 회원의 의무를 성실하게 이행하지 않았을 때
2. 규정한 유료서비스 이용 요금을 납부하지 않았을 때
3. 본 서비스 목적에 맞지 않는 분야에 정보를 활용하여 사회적 물의가 발생한 때
4. 회원이 등록한 정보의 내용이 사실과 다르거나 조작되었을 때
5. 기타 본 서비스 명예를 훼손하였거나 회사가 판단하기에 적합하지 않은 목적으로 회원가입을 하였을 때
④ 개인회원이 유료서비스를 이용하는 중 회사의 책임에 의해 정상적인 서비스가 제공되지 않을 경우 회원은 본 서비스의 해지를 요청할 수 있으며 회사는 해지일까지 이용일수를 1일기준금액으로 계산하여 이용금액을 공제후 환급한다.
⑤ 회사는 회원 가입이 해제된 경우에 해당 회원의 정보를 임의로 삭제할 수 있다.
제21조 (휴면아이디)
① 회원이 36개월 (1,095일) 이상 로그인을 하지 않은 경우 해당 회원의 아이디는 휴면아이디가 되어 회원 로그인을 비롯한 모든 서비스에 대한 이용이 정지되고, 회사는 휴면아이디의 개인정보를 다른 아이디와 별도로 관리한다.
② 회사는 1항에 의한 서비스 이용정지 30일 전 이메일을 통하여 서비스 이용정지에 대하여 안내하고, 서비스 이용정지가 되는 경우 다시 이메일을 통하여 서비스 이용정지 사실에 대하여 고지한다.
③ 회원은 서비스 이용정지 이후에 사이트 상에서 직접 본인확인을 거쳐 휴면상태 해지신청을 하는 즉시 다시 정상적으로 서비스를 이용할 수 있다.
제22조 (손해배상)
① 회사가 이 약관의 제 9조, 제 18조, 제 20조 등의 규정에 위반한 행위로 이용자에게 손해를 입히거나 기타 회사가 제공하는 모든 서비스와 관련하여 회사의 책임 있는 사유로 인해 이용자에게 손해가 발생한 경우 회사는 그 손해를 배상하여야 한다.
② 회원이 이 약관의 제 6조, 제 19조, 제 20조 등의 규정에 위반한 행위로 회사 및 제3자에게 손해를 입히거나 회원의 책임 있는 사유에 의해 회사 및 제3자에게 손해를 입힌 경우에는 회원은 그 손해를 배상하여야 한다.
제23조 (이용요금 오류의 조정)
회사는 이용요금과 관련하여 오류가 있는 경우에 이용자의 요청, 또는 회사의 사전 통지에 의하여 다음에 해당하는 조치를 취한다.
1. 과다납입한 요금에 대하여는 그 금액을 반환한다. 다만, 이용자가 동의할 경우 다음 달에 청구할 요금에서 해당 금액만큼을 감하여 청구한다.
2. 요금을 반환받아야 할 이용자가 요금체납이 있는 경우에는 반환해야 할 요금에서 이를 우선 공제하고 반환한다.
3. 회사는 과소청구액에 대해서는 익월에 합산청구한다.
제24조 (회원의 개인정보보호)
회사는 이용자의 개인정보보호를 위하여 노력해야 한다. 이용자의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한 법률에 따르고, 사이트에 "개인정보취급방침"을 고지한다.
제25조 (신용정보의 제공 활용 동의)
회사가 회원가입과 관련하여 취득한 회원의 개인신용정보를 타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제32조의 규정에 따라 사전에 그 사유 및 해당기관 또는 업체명 등을 밝히고 해당 회원의 동의를 얻어야 한다.
제26조 (분쟁의 해결)
① 회사와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다.
② 전항의 노력에도 불구하고, 회사와 회원간에 발생한 전자거래 분쟁에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 한다. 다만, 제소 당시 회원의 주소 또는 거소가 분명하지 아니 하거나, 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기한다.
2015.05.21
㈜셀러리맨-토킹</textarea>
			</td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr align="center">
			<td align="center"><input type="checkbox" name="agree" value="anything"><font size="2"> 위 이용 약관에 동의합니다.</font></td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
			
		<tr align="center" bgcolor="#888888" height="1">
			<td colspan="4"></td>
		</tr>
		
	</table>
	
	<br>
	<br>
	
	 	
	<table align="center" width="850" border="0" cellspacing="0" cellpadding="0">
		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;개인 정보 수집</strong></td>
		</tr>
		
		<tr height="25">
			<td></td>
		</tr>
		
		<tr align="center" bgcolor="#888888" height="1">
			<td colspan="4"></td>
		</tr>
	</table>
	
	<br>
	<br>
	
	<table align="center" width="850" border="0" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td align="center">
				<textarea align="left" wrap="hard" theme="simple" rows="10" cols="90" readonly>
	1. 개인정보는 어디에 이용되나요?
셀러리맨-토킹은 다양한 취업관련 정보를 이용자들에게 서비스하고 있으며, 이 때 이용자는 본인이 제공한 개인정보를 통해 보다 편리한 서비스와 정보를 이용할 수 있게 됩니다. 셀러리맨-토킹에 제공한 개인 정보는 아래와 같은 목적으로 사용됩니다.
1) 회원제 서비스 제공과 본인 확인제에 따른 본인확인, 이용자 식별을 위한 목적
: 성명, 휴대폰 인증정보(생년월일, 휴대폰 번호) 또는 아이핀 인증정보(아이핀 고유식별번호), 외국인등록번호(외국인), 여권번호, 아이디, 비밀번호 등
2) 이력서 등록과 입사지원 등 취업활동을 위한 목적
: 연락처, 이메일 주소, 주소, 사진, 구직조건, 경력사항, 학력사항, 보유기술, 외국어능력, 자기소개서 등
3) 원활한 의사소통 경로의 확보, 각종 정보 및 이벤트 관련 사항 소개 및 안내, 맞춤 채용정보의 제공 등을 위한 목적
: 가입경로, 홈페이지, 이메일 주소, 메일 수신설정, SMS/MMS 수신동의, 연락처
4) 유료 정보 이용에 대한 요금 결제를 위한 목적
: 은행계좌정보, 신용카드정보, 휴대폰번호
5) 불량회원(셀러리맨-토킹 개인회원 약관 제20조 3항의 위반사유로 인한 가입해지나 서비스 중지, 이력서 삭제 조치 회원 및 기업회원 약관 제 21조 3항의 위반사유로 인한 가입해지나 서비스 중지, 채용공고 삭제 조치 회원)의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만15세 미만 아동 개인정보 수집 시 “취직 인허증” 발급여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
	
	2. 셀러리맨-토킹는 어떤 개인정보를 수집하나요?
가. 수집하는 개인정보의 항목
1) 회원가입시 수집하는 개인정보의 범위 (회원인증방식에 따른 본인 식별 및 원활한 정보제공 통로)
① 개인회원
- 필수항목 : 성명, 휴대폰 인증정보(생년월일, 휴대폰 번호), 아이핀 인증정보(아이핀 고유식별번호), 외국인등록번호(외국인), 여권번호, 아이디, 비밀번호, 성별, 연락처(전화번호/휴대폰 번호), 이메일 주소, 우편번호, 주소
- 선택항목 : 홈페이지, 메일/SMS 수신설정, 가입경로
② 기업회원
- 필수항목 : 성명, 본인인증 정보(휴대폰 인증 고유식별번호), 아이핀 인증정보(아이핀 고유식별번호), 외국인등록번호(외국인),, 여권번호, 아이디, 비밀번호, 연락처(전화번호/휴대폰 번호), 이메일 주소, 우편번호, 주소
- 선택항목 : 메일/SMS 수신설정, 가입경로
2) 유료정보 이용시 수집하는 개인정보의 범위 (본인확인 및 요금 결제)
① 본인확인정보 : 아이디, 비밀번호, 성명, 이메일주소
② 요금결제정보 : 거래은행명, 계좌번호, 계좌 비밀번호, 거래자 성명, 신용카드종류, 카드번호, 유효기한, 비밀번호, 할부기간, 휴대폰번호
3) 이력서 작성시 수집하는 개인정보의 범위 (구직활동)
- 필수항목 : 이름, 휴대폰, 전화번호, 주소, 성별, 이메일주소, 희망연봉, 학력사항, 경력사항, 지원분야
- 선택항목 : 참여프로젝트, 주요활동 및 사회경험, 해외연수 및 해외경험, 교육이수내역, 자격증/면허증어학시험, OA능력, 어학능력, 보유기술 및 능력, 개인 신상정보, 가족관계, 수상내역/공모전, 저술내역, 내 인생의 책, SWOT 자기분석, 자기소개서
4) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
5) 외부인증(페이스북) 연동
- 필수항목 : 페이스북(이름, 프로필 사진, 성별, 네트워크, 사용자 ID, 친구목록, 내 소개, 내 생년월일, 학력, 출신지, 관심사, 좋아하는 것, 거주지, 노트, 상태, 경력, 이메일)
나. 개인정보 수집방법
회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 고객센터 게시판, 이벤트 응모
	
	3. 개인정보의 보유기간 및 이용기간은 얼마나 되나요?
회원의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.
- 회원 탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
단, 아래 정보는 명시한 근거에 의해 일정기간 보존합니다.
보존 항목: 이름, 로그인ID, E-mail
보존 근거: 불법 사용에 대한 관련 수사 협조
보존 기간: 3개월
보존 항목: 부정 이용 기록
보존 근거: 부정 이용 방지
보존 기간: 1년
상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.
- 계약 또는 청약철회 등에 관한 기록 보유 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)
- 대금결제 및 재화 등의 공급에 관한 기록 보유 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)
- 소비자 불만 또는 분쟁처리에 관한 기록 보유 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)
- 본인확인에 관한 기록 보유 : 6개월 (정보통신망 이용촉진 및 정보보호 등에 관한 법률)
- 방문에 관한 기록 보유 : 3개월 (통신비밀보호법)</textarea>
			</td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr align="center">
			<td align="center"><input type="checkbox" name="agree2" value="anything"><font size="2"> 위 개인 정보 수집에 동의합니다.</font></td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
			
		<tr align="center" bgcolor="#888888" height="1">
			<td colspan="4"></td>
		</tr>	
	</table>
	 
	 <br>
	 <br>
	 	
 	
 	<table align="center" width="850">	
 	  <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
 		<tr bgcolor="000000">
 			<td height="1" colspan="2"></td>
 		</tr>
 		
 		<tr height="50">
 			<td align="center" bgcolor="#e9e9e9" width="130">
 				<font color="#FF0000">*</font>
 				<strong>ID</strong>
 			</td>
 			<td width="255" bgcolor="#FFFFFF">
 			&nbsp;&nbsp;
 			<s:if test="#session.member_id == null">
 				<input type="text" class="form-control onlyAlphabetAndNumber"  name="member_id" placeholder="영어, 숫자, 특수문자만 입력 가능합니다." maxlength="30" size="50"/>
				<input type="button" name="confirmId" value="ID 중복확인" onclick="openConfirmId(this.form)" />
			</s:if>
			<s:else>
				<input readonly name="member_id" value="${resultClass.member_id }" theme="simple" maxlength="20"/> 
			</s:else>
		</td>
 		</tr>
 		
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>비밀번호</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;  <input type="password" name="member_passwd" placeholder="비밀번호를 입력해주세요." maxlength="12" size="30">
		</td>
	</tr>

	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>비밀번호 확인</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;<input type="password" name="member_passwd1" placeholder="비밀번호를 한번 더 입력해주세요." maxlength="12" size="30">
		</td>
	</tr>

	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>이름</strong>
 		</td>		
 		<td width="255" bgcolor="#FFFFFF">
				&nbsp;&nbsp;<input type="text" class="form-control onlyHangul" name="member_name" placeholder="이름을 입력해주세요." maxlength="10" size="15">
				<s:if test="#session.member_id == null">
				&nbsp;&nbsp;<input type="radio" name="member_sex" value="남">남
				&nbsp;&nbsp;<input type="radio" name="member_sex" value="여">여	
				</s:if>
				<s:if test="#session.member_id != null">
					<s:if test='resultClass.member_sex == "여"'>
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="남" >남
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="여" checked="checked">여	
					</s:if>
					<s:else>
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="남" checked="checked">남
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="여" >여	
					</s:else>
				</s:if>
		</td>
	</tr>	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="50"><font size="2"><strong>생년월일</strong></font></td>
		<td width="300" bgcolor="#FFFFFF">
			<table cellpadding=0>
				&nbsp;&nbsp;
				<input readonly type="text" id="datepicker" name="member_birthdate" theme="simple" maxlength="100" value="${resultClass.member_birthdate}" placeholder="생년월일을 입력해주세요">&nbsp;&nbsp;(YYYY-MM-DD) 		
			</table>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>이메일</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input type="text" name="member_email" placeholder="이메일을 입력해주세요." maxlength="30">@
		<input type="text" name="member_email1" maxlength="30">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>핸드폰 번호</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly type="text" class="form-control onlyNumber"name="member_phone1" value="010" maxlength="5" size="3">-
		<input type="text" class="form-control onlyNumber"name="member_phone2" maxlength="4" size="4">-
		<input type="text" class="form-control onlyNumber"name="member_phone3" maxlength="4" size="4">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>우편 번호</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly name="member_zipcode" type="text" theme="simple" maxlength="7" value="${resultClass.member_zipcode}"/>		
		<input name="zipCheck" type="button" value="우편 번호 검색" onclick="openZipcode(this.form)" class="topb"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>주소</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly type="text" name="member_address"  maxlength="50" size="50">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>상세 주소</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input type="text" name="member_address1" placeholder="상세주소를 입력해주세요." maxlength="30" size="30">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
</table>

<br>
<br>

<table align="center" width="300" border="0" cellspacing="0" cellpadding="0">
	<s:if test="#session.member_id == null">
	<tr align="center">
		<td>
			<input type="button" value="돌아가기" onclick="location.href='MainAction.action'" class="button"/>
		</td>
		<s:if test="member_index == 1">
		<td>
			<s:hidden name="member_index" value="1"/>
			<input name="submit" type="submit" value="계속" class="button" />
		</td>
		</s:if>
		<s:else>
		<td>
			<s:hidden name="member_index" value="2"/>
			<input name="submit" type="submit" value="회원가입" class="button" />
		</td>
		</s:else>
		<td>
			<input type="reset" value="리셋" class="button"/>
		</td>
	</s:if>
	<s:else>
	<tr align="center">
		<td>
			<input type="button" value="돌아가기" onclick="location.href='MP_Mypage.action'" class="button"/>
		</td>
		<td>
			<input name="submit" type="submit" value="회원정보수정" class="button" />
		</td>
		<td>
			<input type="button" value="회원탈퇴" onclick="location.href='Mem_DeleteForm.action'" class="button" />
		</td>
	</s:else>
	</tr>
</table>
</form>

<br>
<br>

</body>
</html>