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
			alert('�̿� ����� ���� �� ȸ�������� �����Ͻ� �� �ֽ��ϴ�.');
			memJoin.agree.focus();
			return false;
		} else if (!memJoin.agree2.checked) {
			alert('���� ���� ������ ���� �� ȸ�������� �����Ͻ� �� �ֽ��ϴ�.');
			memJoin.agree2.focus();
			return false;
		}else if(memJoin.member_id.value==""){
			alert("���̵� �Է����ּ���.");
			memJoin.member_id.focus();
			return false;
		}
		else if(memJoin.member_passwd.value==""){
			alert("��й�ȣ�� �Է����ּ���.");
			memJoin.member_passwd.focus();
			return false;
		}
		else if(memJoin.member_passwd.value != memJoin.member_passwd1.value){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			memJoin.member_passwd1.focus();
			return false;
		}
		else if(memJoin.member_name.value==""){
			alert("�̸��� �Է����ּ���.");
			memJoin.member_name.focus();
			return false;
		}
		else if(memJoin.member_sex.value==""){
			alert("������ üũ���ּ���");
			return false;
		}
		else if(memJoin.member_email.value==""){
			alert("�̸����� �Է����ּ���.");
			memJoin.member_email.focus();
			return false;
		}
		else if(memJoin.member_phone.value==""){
			alert("�ڵ��� ��ȣ�� �Է����ּ���.");
			memJoin.member_phone.focus();
			return false;
		}
		else if(memJoin.member_zipcode.value==""){
			alert("������ȣ�� �Է����ּ���.");
			memJoin.member_zipcode.focus();
			return false;
		}
		else if(memJoin.submit.value=="ȸ������"){
			alert("ȸ�������� ȯ���մϴ�!");
			return true;
		}
		else if(memJoin.submit.value=="ȸ����������"){
			alert("ȸ�������� �����Ͽ����ϴ�");
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
			alert("���̵� �Է����ּ���");
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
			monthNamesShort:['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
			dayNamesMin:['��', '��', 'ȭ', '��', '��', '��', '��'],
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">����</a> > ȸ������<br></font>
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">����</a> > <a href="MP_Mypage.action">����������</a> > ȸ�� ���� ����<br></font>
			<img src="/SalaryMentoking/common/image/nametag/myinfo.png" />
		</td>
	</tr>
</table>
</s:else>

	 <!-- ����ȸ�� -->
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
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;�̿� ���</strong></td>
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
		���� ȸ�� ��� (���� 2014. 08. 04 / ���� 2014. 08. 04)
��1��(����)
�� ����� �߼�������-��ŷ(���� "�迭��")�� ���� ��ϴ� ������Ʈ(���� "����Ʈ")�� ���� ���ͳ� ���� ���񽺸� �����Կ� �־�, ȸ�簡 �����ϴ� ���񽺿� �����Ͽ�, �̸� �̿��ϴ� ������(���� "ȸ��" �Ǵ� "����ȸ��")�� �̿����� �� ���� ����, ��Ÿ �ʿ��� ������ �������� �������� �Ѵ�.
��2�� (����� ����)
�� ������� ����ϴ� ����� ���Ǵ� �Ʒ��� ����.
�� "����Ʈ"�� ���� "ȸ��"�� "�迭��"�� ���񽺸� "����ȸ��" ���� �����ϱ� ���Ͽ� �ܸ���(PC, TV, �޴����ܸ��� ���� ���� ������ ��ġ�� ����) �� ������ż��� �̿��Ͽ� ������ ������ ������ �Ǵ� ȸ�簡 ���� ��ϴ� ������Ʈ�� ���ϸ�, ���յ� �ϳ��� ���̵� �� ��й�ȣ(���� "���� ����")�� �̿��Ͽ� ���񽺸� �������� �� �ִ� �Ʒ��� ����Ʈ�� �����Ѵ�.
1. ��������-��ŷ : www.JOBara.co.kr
�� "�迭��"�� ���� �Ƹ�����Ʈ ����, ���� ����Ʈ�� ��������-��ŷ�� ��ϰ� �ִ� ��������-��ŷ�׷��� �迭ȸ�縦 �ǹ��Ѵ�.
�� "���� ����"�̶� ���� "����ȸ��"�� "ȸ��" Ȥ�� "�迭��"�� ���������� �����Ͽ� ȸ������� �ϰ�, �ο����� ���̵�� '��������-��ŷ' �� �����Ӱ� ������ �� �ִ� ȸ��ID �� ��й�ȣ�� ���Ѵ�. �� ��, �� ����Ʈ�� ������ ���� �ּ����� ������ �����Ѵ�.
1. �����ϴ� ������ ���� : ����Ʈ�� �α��ο� �ʿ��� �������� (���̵�, �н�����, ȸ����������)
2. ������� : ���̵�� ��ȣȭ�� �н�����, ȸ������������ DB�� �����ϴ� ���
�� "����"�� ���� "ȸ��"�� ���(��ü, �����, �������) �Ǵ� ������ ����, ������ ������ �������� ����ϴ� �ڷḦ DBȭ�Ͽ� ������ ������ �°� �з� ����, �����Ͽ� ������ �����ϴ� ���񽺿� �ش� ���ͳ� �ּҿ��� �����ϴ� ��� �δ� ���񽺸� ���Ѵ�.
�� "����ȸ��"�̶� ���� ���񽺸� �̿��ϱ� ���Ͽ� �� ����� �����ϰ� ȸ��� �̿����� ü���Ͽ� �̿���ID�� �ο� ���� ������ ���Ѵ�.
�� "�̿���ID" �Ǵ� "ȸ��ID"�� ���� ȸ���� �ĺ��� ȸ���� ���� �̿��� ���Ͽ� ȸ���� �����ϰ� ȸ�簡 �ο��ϴ� ���ڿ� ������ ������ ���Ѵ�.
�� "��й�ȣ"�� ���� ȸ���� ���񽺸� �̿��Ϸ��� ����� �̿���ID�� �ο� ���� �ڿ� ���������� Ȯ���ϰ� ȸ���� ������ ��ȣ�ϱ� ���Ͽ� ȸ���� ������ ���ڿ� ������ ������ ���Ѵ�.
��3�� (����� ���ÿ� ����)
�� ȸ��� �� ����� ����� ��ȣ, ������ ������, ����ڵ�Ϲ�ȣ, ����ó ���� �̿��ڰ� �� �� �ֵ��� �ʱ� ȭ�鿡 �Խ��ϰų� ��Ÿ�� ������� �̿��ڿ��� �����ؾ� �Ѵ�.
�� ȸ��� ����Ǳ�������ѹ���, ������ű⺻��, ������Ż����, ������Ÿ��̿���������ѹ��� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ִ�.
�� ȸ�簡 ����� ������ ��쿡�� ���� ��� ������ �ּ� 7����(����� ������ �Һ��ڿ��� �Ҹ��� ��쿡�� 30����)���� ������Ʈ �ʱ�ȭ�� �������� �Ǵ� �̸����� ���� �����Ѵ�.
�� �̿��ڴ� ����� ����� ���� �ź��� �Ǹ��� �ִ�. "�̿���"�� ����� ����� ������ �� 15�� �̳��� �ź��ǻ縦 ǥ���� �� �ִ�. "�̿���"�� �ź��ϴ� ��� �� ���� �������� "ȸ��"�� 15���� �Ⱓ�� ���Ͽ� "�̿���"���� ���� ���� �� ���� "�̿���"���� ����� ������ �� �ִ�. ����, "�̿���"�� �ź��ǻ縦 ǥ������ �ʰ� "����"�� ��� �̿��ϴ� ��쿡�� �����ϴ� ������ �����Ѵ�.
��4�� (��� �� ��Ģ)
�� ������� �������� ���� ���׿� ���ؼ��� ����Ǳ�������ѹ���, ������ű⺻��, ������Ż����, ������Ÿ��̿���������ѹ��� ���� ������ɿ� ������.
��5�� (�̿����� ����)
�� ȸ���� ���� �̿���(���� '�̿���'�̶� �Ѵ�)�� ���񽺸� �̿��ϰ��� �ϴ� ���� �� ����� ����������޹�ħ�� ���뿡 ���� ���� �� �̿��û(ȸ�����Խ�û)�� ���Ͽ� ȸ�簡 �³������ν� �����Ѵ�.
�� ���񽺸� �̿��ϰ��� �ϴ� �ڰ� �̿��û ��� ������ "������"�� üũ �� ȸ������ ������ �Ϸ�� �� ��� �� ����������޹�ħ�� ���Ͽ� ������ ������ �����Ѵ�.
�� ��1���� �³��� �̿��û���� �� ����� ���� ���Ǹ� Ȯ���ϰ� ���ڸ��� �Ǵ� �������� ���������ν� �̷������ �̷��� �³��� ������ �̿��û�ڿ��� �����ϸ� �̿����� �����Ѵ�.
��6�� (���� �̿��û)
�� ȸ������ �����Ͽ� �� ���񽺸� �̿��ϰ��� �ϴ� �̿������ ȸ������ ���(�޴��� ����, ������ ����)�� �����Ͽ� ȸ�翡�� ��û�ϴ� ��������(�̸�, �ܱ��ε�Ϲ�ȣ, ���ǹ�ȣ, �������, ��ȭ��ȣ, �޴��� ��ȣ ��)�� �����Ͽ��� �Ѵ�
�� �Ǹ����� ������� ���� ����ڴ� ��ü�� �Ǹ��� ������ �� ����.
�� Ÿ���� ���Ǹ� �����Ͽ� �̿��û�� �� ȸ���� ��� ID�� �����Ǹ�, ������ɿ� ���� ó���� ���� �� �ִ�.
�� �� 15�� �̸����� ȸ�������� �����Ǹ� ����, ����, ��Ÿ�� ������ ������ ������ ��쿡�� �̿�����, ����Ż��, ���ع��û�� �� �������� �ΰ��� �� �ִ�.
��7�� (�̿��û�� �³��� ����)
�� ȸ��� ������ ������ ���� �̿��û ������ ���Ͽ� ��������� �Ǵ� ����� ������ ���� ��쿡�� ��Ģ������ ���������� ���� ���� �̿��� �³��Ѵ�.
�� ȸ��� �Ʒ����׿� �ش��ϴ� ��쿡 ���ؼ��� �̿��û�� �³����� �ƴ��Ѵ�.
1. �Ǹ��� �ƴϰų� Ÿ���� ���Ǹ� �̿��Ͽ� ��û�� ���
2. �̿��� ��û���� ������ ������ ������ ���
�� ȸ��� �Ʒ����׿� �ش��ϴ� ��쿡�� �� ��û�� ���Ͽ� �³����� ������ �ؼҵ� ������ �³��� ������ �� �ִ�.
1. ȸ�簡 ������ ������ ���� ���
2. ȸ���� ����� ������ �ִ� ���
3. ��Ÿ ȸ���� ����(ȸ���� ��å ���� �ִ� ��쵵 ����)���� �̿�³��� ����� ���
��8�� (���� ���� ����)
�� ȸ���� �ϳ��� "���� ����"�� ���� �� ��� 2�� 1�׿� ������ ����Ʈ �� �ش� ���񽺸� �̿��� �� �ִ�.
��, ��Ȱ�� ���� �̿��� ���� ���� 1ȸ ȸ������ �̰� ������ ��ģ��.
�� "���� ����"�� ������ ���� 1ȸ �̰��� ȸ�������� ���� '��������-��ŷ' ���� ���������� �����ȴ�.
�� ȸ���� Ż�� �� ����������-��ŷ���� ���� ���� �Ǵ� �ϰ� Ż�� ���θ� ������ �� �ִ�. ���� Ż���� ��쿡�� Ż������ ���� ����Ʈ������ ���� ������ ����ؼ� �̿��� �� �ִ�.
�� ȸ��� ȸ���� ����Ʈ �� ���񽺸� ���� �̿��� �� �ֵ��� ȸ���� ���� ���������� �����ϰų�, ��������� ����, ������ �� �ִ�.
��9�� (������ ����)
�� ȸ��� ��2�� 4���� ���񽺸� ������ �� ������ �� ������ ���� �� ȣ�� ����.
1. ���� �����ͺ��̽� �˻��� ���� �̷¼� ��ϼ���
2. �¶��� �Ի����� ����
3. �������/�ƿ��ҽ� ����
4. ����/������ ���õ� ���� ����
��10�� (����ȸ�� ����, �̷¼� ����)
�� ����ȸ���� �̷¼��� ������ ȸ������ �Ǵ� �̷¼� �ۼ� �� ������ ����� ���·� �̷¼��� �����Ѵ�.
�� ȸ��� ����ȸ���� �̷¼��� �������� ���/�̵�� ����, �̷¼����� ����ó ����/������� �����Ӱ� ������ �� �ֵ��� �Ͽ��� �Ѵ�.
�� ȸ��� ����ȸ���� �̷¼��� ���������� ����ϱ⸦ ������� ��� ���������̷¼� �˻��� ��û�� ���ȸ���� ���� �����ϵ��� �� �� �ִ�. �ٸ�, ����ó �� �׸��� ������� ������ ��� �ش� �׸� ����ó�� ������ �� ����.
�� ȸ��� ����ȸ���� ����� �̷¼��� ���̵� �޸���� �������� ������ �� ������, ȸ�簡 ������ �Ⱓ�� ���� �̷¼��� ����ȸ�� Ż��� ���� ������ �� �ִ�.
��11��(���޸� ���� ����)
�� ȸ��� ���� ���踦 ü���� ��Ÿ ���ͳ� �� ����Ʈ �Ǵ� �Ź�, ���� ���� �������� ��ü�� ���� ����Ʈ�� ����� ����ȸ���� �̷¼� ������ ������ �� �ֵ��� ���񽺸� ������ �� �ִ�. ��, ����ȸ���� ��� ���� ���񽺸� ���� ����Ǵ� �̷¼��� ����ó ������ ��10���� �� �׿� ������.
�� ȸ��� ����ȸ������ ���޸� ���� Ÿ ����Ʈ �� ��ü�� ��ϵ� �� ������ �����ϰ� ���Ǹ� �޾ƾ� �ϸ�, ���� ����Ʈ ��ü ����� ����Ʈ������ ��� ������ �� �ֵ��� �ؾ� �Ѵ�.
��12�� (������ ���)
�� ����ȸ�� ���԰� �̷¼� ����� �����̴�. �ٸ� ���ȸ�� �Ǵ� ����Ʈ�� �湮�� ���ü���� �ڽ��� �̷¼� ������ ���� ȿ�������� �����Ű�� ���� ����ɼ� �� ȸ�� ���� ���� �� ��Ÿ ���񽺸� �̿��ϱ� ���� ������ ���񽺴� ����� ������ �� �ִ�.
�� ȸ��� ���Ἥ�񽺸� ������ ��� ����Ʈ�� ��ݿ� ���ؼ� ������ �Ͽ��� �Ѵ�.
�� ȸ��� ���Ἥ�� �̿�ݾ��� ����Ǵ� ��� ����� �ݾ� ������ �ּ� 7����(�ݾ��� ������ �Һ��ڿ��� �Ҹ��� ��쿡�� 30����)���� ������Ʈ �ʱ�ȭ�� �������� �Ǵ� �̸����� ���� �����Ѵ�. �ٸ�, ���� ������ ���� �Ǵ� ����� �ݾ��� �ұ��Ͽ� �������� �ƴ��Ѵ�.
��13�� (���� �̿�ð�)
�� ȸ��� Ư���� ������ ���� �� ���߹���, 1�� 24�ð� ���񽺸� �����Ѵ�. �ٸ�, ȸ��� ������ ������ ������ ���� �����ϴ� ���� �� �Ϻο� ���ؼ��� ������ �̿�ð��� ���� �� ������, �� ��� ȸ��� �� �̿�ð��� ������ ȸ������ ���� �Ǵ� �����Ͽ��� �Ѵ�.
�� ȸ��� �ڷ��� ������ ������ ���� �ý��� �۾��ð�, ����ذ��� ���� �����۾� �ð�, ���� PM�۾�, �ý��� ��ü�۾�, ȸ�� ��� ���� �߻��� ��� �Ͻ������� ���񽺸� �ߴ��� �� ������ ��ȹ�� �۾��� ��� �������� ���� �ߴ� �ð��� �۾� ������ �˷��� �Ѵ�.
��14�� (���� ������ ����)
�� ȸ��� ���� �� ȣ�� �ش��ϴ� ��� ������ ������ ������ �� �ִ�.
1. ������ ���� �� ȸ���� �ʿ信 ���� ������ ȸ���鿡�� ������ ���
2. �Ⱓ��Ż���ڰ� ������ż��� ������ �����ϴ� ���
3. ��Ÿ �Ұ��׷����� ������ ���� ���� ������ ���������� �Ұ����� ���
�� ������ ���, ȸ��� �Ⱓ�� ������ �ִ� ���Ἥ�� �̿��ڵ鿡�Դ� �� �̿�Ⱓ�� �����ϴ� ���� ������� �ս��� �����Ͽ��� �Ѵ�.
��15�� (������ ���� �� ������ ����)
�� ȸ��� ȸ������ ���� �̿뿡 �ʿ䰡 �ִٰ� �����ǰų� ���� ���� �� ȸ������� ���� �Ұ� ���� �������� �ϴ� ���� ������ ȸ���� ���ŵ����� ���, ���ڿ���, ���ſ���, SMS(Short Message Service), MMS(Multimedia Message Service)�� ������ �� �ִ�.
�� ȸ��� �����ϴ� ���񽺿� ���õǴ� ���� �Ǵ� ������ ���� ȭ��, Ȩ������ � ������ �� ������, ȸ���鿡�� ���ڿ��� �� SMS, MMS�� ���� �˸� �� �ִ�.
�� ȸ��� ���񽺻� ����Ǿ� �ְų� �� ���񽺸� ���� �������� ����Ȱ���� ȸ���� �����ϰų� ���� �Ǵ� �ŷ��� �����ν� �߻��ϴ� ��� �սǰ� ���ؿ� ����, ȸ���� ���Ǥ��߰��Ƿ� ���� ��찡 �ƴ� ��, å���� ���� �ʴ´�.
�� �� ������ ȸ���� ���� �̿� �� ����Ǵ� �������翡 ���� ���� �ϴ� ������ �����Ѵ�.
��16�� (�ڷ� ������ å�Ӱ� ȸ���� ���� ���� ����)
�� �ڷ᳻���� ȸ���� ����� �������� �� �̷¼��� ����Ʈ�� �Խ��� �Խù��� ���Ѵ�.
�� ȸ���� �ڷ� ���� �� �Խù��� ��ǿ� �ٰ��Ͽ� �����ϰ� �ۼ��ؾ� �ϸ�, ���� �ڷ��� ������ ����� �ƴϰų� ����Ȯ�ϰ� �ۼ��Ǿ� �߻��ϴ� ��� å���� ȸ������ �ִ�.
�� ��� �ڷ᳻���� ������ �ۼ��� ȸ�� ������ �ϴ� ���� ��Ģ�̳� ������ ��Ź �Ǵ� ��������� �ϴ��� �ڷ᳻���� å���� ȸ������ ������ ȸ���� �ֱ������� �ڽ��� �ڷḦ Ȯ���Ͽ� �׻� ��Ȯ�ϰ� ������ �ǵ��� ����ؾ� �Ѵ�.
�� ȸ��� ����ȸ���� ����� �ڷ� ���뿡 ����, Ż�� �Ǵ� ��ȸ�� ��信 ��߳��� ������ ���� ��� �̸� �������� ������ �� �ִ�.
��17�� (�ڷ� ������ Ȱ�� �� �¶��� �Ի� ���� ����)
�� ����ȸ���� �Է��� ������ ������ �ĺ��� �� ���� ���·� �����Ǿ� ��� �� ���� ������ ��� �ڷ�� Ȱ��� �� ������ �� �ڷ�� ��ü�� ���� ��п� ������ �� �ִ�.
�� ȸ��� '����Ʈ'�� �¶��� �Ի� ���� �ý����� ���� �ش� ������� ������ ����ȸ���� ������ �ش� ����� �λ��ڷ��̸� �̿� ���� ���� ������ �ش� ����� ��å�� ���Ѵ�.
��18�� (ȸ���� �ǹ�)
�� ȸ��� �� ������� ���� �ٿ� ���� �����, ���������� ���񽺸� ������ �� �ֵ��� �ּ��� ����� ���ؾ� �Ѵ�.
�� ȸ��� ���񽺿� ������ ȸ���� �Ҹ������� �����Ǵ� ��� �̸� ��� ó���Ͽ��� �ϸ�, ��� ó���� ����� ��쿡�� �� ������ ó�������� ���� ȭ�� �Ǵ� ��Ÿ ����� ���� �� ȸ������ �����Ͽ��� �Ѵ�.
�� ȸ��� ���� ������ ������ ���� ���� ������ ��� �� ���ù����� ������ ���Ͽ� 5�� �̻� �����Ѵ�.
�� õ������ �� �������� ���� ���� �߻��ϰų� �ý����� ��ְ� �߻��Ͽ� ���񽺰� �ߴܵ� ��� �̿� ���� ���ؿ� ���ؼ��� ȸ�簡 å���� ���� �ʴ´�. �ٸ� �ڷ��� ������ �������� ���� ������ �ǵ��� �ּ��� ���� �ǹ��� ����.
�� ȸ���� �ڷḦ �� ���� �̿��� �������� ��3�ڿ��� �����ϰų� ������ų ��� �ݵ�� ȸ���� ���Ǹ� ���� �Ѵ�.
��19�� (ȸ���� �ǹ�)
�� ȸ���� ������ɰ� �� ����� ���� �� ��Ÿ ȸ�簡 �����ϴ� ������ �ؼ��Ͽ��� �ϸ�, ��Ÿ ȸ���� ������ ���صǴ� ������ �ؼ��� �� �ȴ�.
�� ȸ���� ��û�� ���Ἥ�񽺴� ��� �Ǵ� ��û�� ���ÿ� ȸ��� ä��, ä�� ���谡 �߻��ϸ�, ȸ���� �̿� ���� ����� ������ ���� ���� �����Ͽ��� �Ѵ�.
�� ȸ���� ���� �������� �ſ�ī�带 ����� ��� ��й�ȣ �� ���� ���� ������ ȸ�� ������ �����ؾ� �Ѵ�. ��, ����Ʈ�� ���Կ� ���� ���������� �߻��� ���� å���� ȸ���� �ǹ��� �ش����� �ƴ��Ѵ�.
�� ȸ���� ���񽺸� �̿��Ͽ� ���� ������ ȸ���� �������� ���� ����, ����, ����, ����, ��� ��Ÿ�� ������� ����ϰų� �̸� Ÿ�ο��� ������ �� ����.
�� ȸ���� �� ���񽺸� ������ ���� ���� �̿��� �������� ����ؼ��� �ȵǸ� �̿� �� ���� �� ȣ�� ������ �ؼ��� �ȵȴ�.
1. �ٸ� ȸ���� ���̵� ���� ����ϴ� ����
2. ���������� �������� �ϰų� ��Ÿ ���������� ���õ� ����
3. Ÿ���� ������ �Ѽ��ϰų� ����ϴ� ����
4. Ÿ���� �������� ���� �Ǹ��� ħ���ϴ� ����
5. ��ŷ���� �Ǵ� ���̷����� ���� ����
6. Ÿ���� �ǻ翡 ���Ͽ� ������ ���� �� ������ ������ ��������� �����ϴ� ����
7. ������ �������� ��� ������ �ְų� �� ����� �ִٰ� �ǴܵǴ� ����
8. ����Ʈ�� ���� �� ���񽺸� �̿��� ���� ����
9. �׹ۿ� ������ ǳ��, ��Ÿ ��ȸ������ ���ϰų� ������ɿ� �����ϴ� ����
��20�� (ȸ���� ��������/��������/�ڷ����)
�� ����ȸ���� ���� ������ �ϰ��� �� ���� �������� �Ǵ� "����ȸ�� Ż��" �޴��� �̿��� ���� ��û�� �ؾ� �Ѵ�, �̶� ȸ���� '��������-��ŷ'�� ���� ���� �Ǵ� �ϰ� Ż�� ���θ� ������ �� �ִ�.
�� "ȸ��"�� ����� ������ ���, ���ù� �� ����������޹�ħ�� ���� "ȸ��"�� ȸ�������� �����ϴ� ��츦 �����ϰ��� ���� ��� "ȸ��"�� ��� �����ʹ� �Ҹ�ȴ�.
�� ������ ���׿� �ش��ϴ� ��� ȸ��� ���� ���Ǿ��� ���������� ���� ����, �̷¼� ���� ��ġ�� ���� �� �ִ�.
1. ȸ���� �ǹ��� �����ϰ� �������� �ʾ��� ��
2. ������ ���Ἥ�� �̿� ����� �������� �ʾ��� ��
3. �� ���� ������ ���� �ʴ� �о߿� ������ Ȱ���Ͽ� ��ȸ�� ���ǰ� �߻��� ��
4. ȸ���� ����� ������ ������ ��ǰ� �ٸ��ų� ���۵Ǿ��� ��
5. ��Ÿ �� ���� ������ �Ѽ��Ͽ��ų� ȸ�簡 �Ǵ��ϱ⿡ �������� ���� �������� ȸ�������� �Ͽ��� ��
�� ����ȸ���� ���Ἥ�񽺸� �̿��ϴ� �� ȸ���� å�ӿ� ���� �������� ���񽺰� �������� ���� ��� ȸ���� �� ������ ������ ��û�� �� ������ ȸ��� �����ϱ��� �̿��ϼ��� 1�ϱ��رݾ����� ����Ͽ� �̿�ݾ��� ������ ȯ���Ѵ�.
�� ȸ��� ȸ�� ������ ������ ��쿡 �ش� ȸ���� ������ ���Ƿ� ������ �� �ִ�.
��21�� (�޸���̵�)
�� ȸ���� 36���� (1,095��) �̻� �α����� ���� ���� ��� �ش� ȸ���� ���̵�� �޸���̵� �Ǿ� ȸ�� �α����� ����� ��� ���񽺿� ���� �̿��� �����ǰ�, ȸ��� �޸���̵��� ���������� �ٸ� ���̵�� ������ �����Ѵ�.
�� ȸ��� 1�׿� ���� ���� �̿����� 30�� �� �̸����� ���Ͽ� ���� �̿������� ���Ͽ� �ȳ��ϰ�, ���� �̿������� �Ǵ� ��� �ٽ� �̸����� ���Ͽ� ���� �̿����� ��ǿ� ���Ͽ� �����Ѵ�.
�� ȸ���� ���� �̿����� ���Ŀ� ����Ʈ �󿡼� ���� ����Ȯ���� ���� �޸���� ������û�� �ϴ� ��� �ٽ� ���������� ���񽺸� �̿��� �� �ִ�.
��22�� (���ع��)
�� ȸ�簡 �� ����� �� 9��, �� 18��, �� 20�� ���� ������ ������ ������ �̿��ڿ��� ���ظ� �����ų� ��Ÿ ȸ�簡 �����ϴ� ��� ���񽺿� �����Ͽ� ȸ���� å�� �ִ� ������ ���� �̿��ڿ��� ���ذ� �߻��� ��� ȸ��� �� ���ظ� ����Ͽ��� �Ѵ�.
�� ȸ���� �� ����� �� 6��, �� 19��, �� 20�� ���� ������ ������ ������ ȸ�� �� ��3�ڿ��� ���ظ� �����ų� ȸ���� å�� �ִ� ������ ���� ȸ�� �� ��3�ڿ��� ���ظ� ���� ��쿡�� ȸ���� �� ���ظ� ����Ͽ��� �Ѵ�.
��23�� (�̿��� ������ ����)
ȸ��� �̿��ݰ� �����Ͽ� ������ �ִ� ��쿡 �̿����� ��û, �Ǵ� ȸ���� ���� ������ ���Ͽ� ������ �ش��ϴ� ��ġ�� ���Ѵ�.
1. ���ٳ����� ��ݿ� ���Ͽ��� �� �ݾ��� ��ȯ�Ѵ�. �ٸ�, �̿��ڰ� ������ ��� ���� �޿� û���� ��ݿ��� �ش� �ݾ׸�ŭ�� ���Ͽ� û���Ѵ�.
2. ����� ��ȯ�޾ƾ� �� �̿��ڰ� ���ü���� �ִ� ��쿡�� ��ȯ�ؾ� �� ��ݿ��� �̸� �켱 �����ϰ� ��ȯ�Ѵ�.
3. ȸ��� ����û���׿� ���ؼ��� �Ϳ��� �ջ�û���Ѵ�.
��24�� (ȸ���� ����������ȣ)
ȸ��� �̿����� ����������ȣ�� ���Ͽ� ����ؾ� �Ѵ�. �̿����� ����������ȣ�� ���ؼ��� ������Ÿ��̿����� �� ������ȣ � ���� ������ ������, ����Ʈ�� "����������޹�ħ"�� �����Ѵ�.
��25�� (�ſ������� ���� Ȱ�� ����)
ȸ�簡 ȸ�����԰� �����Ͽ� ����� ȸ���� ���νſ������� Ÿ�ο��� �����ϰų� Ȱ���ϰ��� �� ������ �ſ������� �̿� �� ��ȣ�� ���� ���� ��32���� ������ ���� ������ �� ���� �� �ش��� �Ǵ� ��ü�� ���� ������ �ش� ȸ���� ���Ǹ� ���� �Ѵ�.
��26�� (������ �ذ�)
�� ȸ��� ȸ���� ���񽺿� �����Ͽ� �߻��� ������ �����ϰ� �ذ��ϱ� ���Ͽ� �ʿ��� ��� ����� �Ͽ��� �Ѵ�.
�� ������ ��¿��� �ұ��ϰ�, ȸ��� ȸ������ �߻��� ���ڰŷ� ���￡ ���� �Ҽ��� ���� ����� ȸ���� �ּҿ� ���ϰ�, �ּҰ� ���� ��쿡�� �żҸ� �����ϴ� ���� ������ ���� ���ҷ� �Ѵ�. �ٸ�, ���� ��� ȸ���� �ּ� �Ǵ� �żҰ� �и����� �ƴ� �ϰų�, �ܱ� �������� ��쿡�� �λ�Ҽ۹����� ���ҹ����� �����Ѵ�.
2015.05.21
�߼�������-��ŷ</textarea>
			</td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr align="center">
			<td align="center"><input type="checkbox" name="agree" value="anything"><font size="2"> �� �̿� ����� �����մϴ�.</font></td>
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
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;���� ���� ����</strong></td>
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
	1. ���������� ��� �̿�ǳ���?
��������-��ŷ�� �پ��� ������� ������ �̿��ڵ鿡�� �����ϰ� ������, �� �� �̿��ڴ� ������ ������ ���������� ���� ���� ������ ���񽺿� ������ �̿��� �� �ְ� �˴ϴ�. ��������-��ŷ�� ������ ���� ������ �Ʒ��� ���� �������� ���˴ϴ�.
1) ȸ���� ���� ������ ���� Ȯ������ ���� ����Ȯ��, �̿��� �ĺ��� ���� ����
: ����, �޴��� ��������(�������, �޴��� ��ȣ) �Ǵ� ������ ��������(������ �����ĺ���ȣ), �ܱ��ε�Ϲ�ȣ(�ܱ���), ���ǹ�ȣ, ���̵�, ��й�ȣ ��
2) �̷¼� ��ϰ� �Ի����� �� ���Ȱ���� ���� ����
: ����ó, �̸��� �ּ�, �ּ�, ����, ��������, ��»���, �з»���, �������, �ܱ���ɷ�, �ڱ�Ұ��� ��
3) ��Ȱ�� �ǻ���� ����� Ȯ��, ���� ���� �� �̺�Ʈ ���� ���� �Ұ� �� �ȳ�, ���� ä�������� ���� ���� ���� ����
: ���԰��, Ȩ������, �̸��� �ּ�, ���� ���ż���, SMS/MMS ���ŵ���, ����ó
4) ���� ���� �̿뿡 ���� ��� ������ ���� ����
: �����������, �ſ�ī������, �޴�����ȣ
5) �ҷ�ȸ��(��������-��ŷ ����ȸ�� ��� ��20�� 3���� ���ݻ����� ���� ���������� ���� ����, �̷¼� ���� ��ġ ȸ�� �� ���ȸ�� ��� �� 21�� 3���� ���ݻ����� ���� ���������� ���� ����, ä����� ���� ��ġ ȸ��)�� ���� �̿������ ���ΰ� ������, �����ǻ� Ȯ��, ���� �� ����Ƚ�� ����, ��15�� �̸� �Ƶ� �������� ���� �� ������ �������� �߱޿��� Ȯ��, ���� ������ ���� ��Ϻ���, �Ҹ�ó�� �� �ο�ó��, �������� ����
	
	2. ��������-��ŷ�� � ���������� �����ϳ���?
��. �����ϴ� ���������� �׸�
1) ȸ�����Խ� �����ϴ� ���������� ���� (ȸ��������Ŀ� ���� ���� �ĺ� �� ��Ȱ�� �������� ���)
�� ����ȸ��
- �ʼ��׸� : ����, �޴��� ��������(�������, �޴��� ��ȣ), ������ ��������(������ �����ĺ���ȣ), �ܱ��ε�Ϲ�ȣ(�ܱ���), ���ǹ�ȣ, ���̵�, ��й�ȣ, ����, ����ó(��ȭ��ȣ/�޴��� ��ȣ), �̸��� �ּ�, ������ȣ, �ּ�
- �����׸� : Ȩ������, ����/SMS ���ż���, ���԰��
�� ���ȸ��
- �ʼ��׸� : ����, �������� ����(�޴��� ���� �����ĺ���ȣ), ������ ��������(������ �����ĺ���ȣ), �ܱ��ε�Ϲ�ȣ(�ܱ���),, ���ǹ�ȣ, ���̵�, ��й�ȣ, ����ó(��ȭ��ȣ/�޴��� ��ȣ), �̸��� �ּ�, ������ȣ, �ּ�
- �����׸� : ����/SMS ���ż���, ���԰��
2) �������� �̿�� �����ϴ� ���������� ���� (����Ȯ�� �� ��� ����)
�� ����Ȯ������ : ���̵�, ��й�ȣ, ����, �̸����ּ�
�� ��ݰ������� : �ŷ������, ���¹�ȣ, ���� ��й�ȣ, �ŷ��� ����, �ſ�ī������, ī���ȣ, ��ȿ����, ��й�ȣ, �ҺαⰣ, �޴�����ȣ
3) �̷¼� �ۼ��� �����ϴ� ���������� ���� (����Ȱ��)
- �ʼ��׸� : �̸�, �޴���, ��ȭ��ȣ, �ּ�, ����, �̸����ּ�, �������, �з»���, ��»���, �����о�
- �����׸� : ����������Ʈ, �ֿ�Ȱ�� �� ��ȸ����, �ؿܿ��� �� �ؿܰ���, �����̼�����, �ڰ���/���������н���, OA�ɷ�, ���дɷ�, ������� �� �ɷ�, ���� �Ż�����, ��������, ���󳻿�/������, ��������, �� �λ��� å, SWOT �ڱ�м�, �ڱ�Ұ���
4) ���� �̿�����̳� ���ó�� �������� �Ʒ��� ���� �������� �ڵ����� �����Ǿ� ������ �� �ֽ��ϴ�.
- IP Address, ��Ű, �湮 �Ͻ�, ���� �̿� ���, �ҷ� �̿� ���
5) �ܺ�����(���̽���) ����
- �ʼ��׸� : ���̽���(�̸�, ������ ����, ����, ��Ʈ��ũ, ����� ID, ģ�����, �� �Ұ�, �� �������, �з�, �����, ���ɻ�, �����ϴ� ��, ������, ��Ʈ, ����, ���, �̸���)
��. �������� �������
ȸ��� ������ ���� ������� ���������� �����մϴ�.
- Ȩ������, ������, �ѽ�, ��ȭ, �������� �Խ���, �̺�Ʈ ����
	
	3. ���������� �����Ⱓ �� �̿�Ⱓ�� �󸶳� �ǳ���?
ȸ���� ���������� ������ ���� ���������� �������� �Ǵ� �������� ������ �޼��Ǹ� �ı�˴ϴ�.
- ȸ�� Ż�� ��û�ϰų� ���������� ���� �� �̿뿡 ���� ���Ǹ� öȸ�ϴ� ���, ���� �� �̿������ �޼��ǰų� ���� �� �̿�Ⱓ�� ������ ��� �ش� ���������� ��ü ���� �ı��մϴ�.
��, �Ʒ� ������ ������ �ٰſ� ���� �����Ⱓ �����մϴ�.
���� �׸�: �̸�, �α���ID, E-mail
���� �ٰ�: �ҹ� ��뿡 ���� ���� ���� ����
���� �Ⱓ: 3����
���� �׸�: ���� �̿� ���
���� �ٰ�: ���� �̿� ����
���� �Ⱓ: 1��
��� �� ���ù����� ������ ���Ͽ� ������ ���� �ŷ� ���� �Ǹ� �ǹ� ������ Ȯ�� ���� ������ �����Ⱓ �����Ͽ��� �� �ʿ䰡 ���� ��쿡�� �����Ⱓ �����մϴ�.
- ��� �Ǵ� û��öȸ � ���� ��� ���� : 5�� (���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����)
- ��ݰ��� �� ��ȭ ���� ���޿� ���� ��� ���� : 5�� (���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����)
- �Һ��� �Ҹ� �Ǵ� ����ó���� ���� ��� ���� : 3�� (���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����)
- ����Ȯ�ο� ���� ��� ���� : 6���� (������Ÿ� �̿����� �� ������ȣ � ���� ����)
- �湮�� ���� ��� ���� : 3���� (��ź�к�ȣ��)</textarea>
			</td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr align="center">
			<td align="center"><input type="checkbox" name="agree2" value="anything"><font size="2"> �� ���� ���� ������ �����մϴ�.</font></td>
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
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
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
 				<input type="text" class="form-control onlyAlphabetAndNumber"  name="member_id" placeholder="����, ����, Ư�����ڸ� �Է� �����մϴ�." maxlength="30" size="50"/>
				<input type="button" name="confirmId" value="ID �ߺ�Ȯ��" onclick="openConfirmId(this.form)" />
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
	 		<strong>��й�ȣ</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;  <input type="password" name="member_passwd" placeholder="��й�ȣ�� �Է����ּ���." maxlength="12" size="30">
		</td>
	</tr>

	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>��й�ȣ Ȯ��</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;<input type="password" name="member_passwd1" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���." maxlength="12" size="30">
		</td>
	</tr>

	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>�̸�</strong>
 		</td>		
 		<td width="255" bgcolor="#FFFFFF">
				&nbsp;&nbsp;<input type="text" class="form-control onlyHangul" name="member_name" placeholder="�̸��� �Է����ּ���." maxlength="10" size="15">
				<s:if test="#session.member_id == null">
				&nbsp;&nbsp;<input type="radio" name="member_sex" value="��">��
				&nbsp;&nbsp;<input type="radio" name="member_sex" value="��">��	
				</s:if>
				<s:if test="#session.member_id != null">
					<s:if test='resultClass.member_sex == "��"'>
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="��" >��
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="��" checked="checked">��	
					</s:if>
					<s:else>
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="��" checked="checked">��
					&nbsp;&nbsp;<input type="radio" name="member_sex" value="��" >��	
					</s:else>
				</s:if>
		</td>
	</tr>	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="50"><font size="2"><strong>�������</strong></font></td>
		<td width="300" bgcolor="#FFFFFF">
			<table cellpadding=0>
				&nbsp;&nbsp;
				<input readonly type="text" id="datepicker" name="member_birthdate" theme="simple" maxlength="100" value="${resultClass.member_birthdate}" placeholder="��������� �Է����ּ���">&nbsp;&nbsp;(YYYY-MM-DD) 		
			</table>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>�̸���</strong>
 		</td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input type="text" name="member_email" placeholder="�̸����� �Է����ּ���." maxlength="30">@
		<input type="text" name="member_email1" maxlength="30">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130">
			<font color="#FF0000">*</font>
	 		<strong>�ڵ��� ��ȣ</strong>
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
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>���� ��ȣ</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly name="member_zipcode" type="text" theme="simple" maxlength="7" value="${resultClass.member_zipcode}"/>		
		<input name="zipCheck" type="button" value="���� ��ȣ �˻�" onclick="openZipcode(this.form)" class="topb"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>�ּ�</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input readonly type="text" name="member_address"  maxlength="50" size="50">
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="50">
		<td align="center" bgcolor="#e9e9e9" width="130"><font size="2"><strong>�� �ּ�</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<input type="text" name="member_address1" placeholder="���ּҸ� �Է����ּ���." maxlength="30" size="30">
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
			<input type="button" value="���ư���" onclick="location.href='MainAction.action'" class="button"/>
		</td>
		<s:if test="member_index == 1">
		<td>
			<s:hidden name="member_index" value="1"/>
			<input name="submit" type="submit" value="���" class="button" />
		</td>
		</s:if>
		<s:else>
		<td>
			<s:hidden name="member_index" value="2"/>
			<input name="submit" type="submit" value="ȸ������" class="button" />
		</td>
		</s:else>
		<td>
			<input type="reset" value="����" class="button"/>
		</td>
	</s:if>
	<s:else>
	<tr align="center">
		<td>
			<input type="button" value="���ư���" onclick="location.href='MP_Mypage.action'" class="button"/>
		</td>
		<td>
			<input name="submit" type="submit" value="ȸ����������" class="button" />
		</td>
		<td>
			<input type="button" value="ȸ��Ż��" onclick="location.href='Mem_DeleteForm.action'" class="button" />
		</td>
	</s:else>
	</tr>
</table>
</form>

<br>
<br>

</body>
</html>