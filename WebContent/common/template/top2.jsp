<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style>
/*���⼭���ʹ� ��Ӹ޴��� ��Ÿ��*/
    a, a:hover {
      text-decoration: none;
    }
        
    /**********/
    
    ul#navWrapper {
      border: 0 ;
      margin-top: 0px;
      margin-left: 0px;
      float: left;
    }
        
    ul#navWrapper li {
      border: 0 ;    
      float: left;
      list-style: none;
      margin-right: 0px;
      padding: 0px;
      border-radius: 0px;
    }
    
    ul#navWrapper li li {
      border: 0px ;    
      float: none;
      margin-left: -30px;
      margin-top: 0px;
      width:120px;
    }

    ul#navWrapper li li:first-child { 
      margin-top: 16px;
    }


    ul#navWrapper ul {
      display: none;
      position: absolute;
    
      background-color: rgba(255, 255, 255, 0);
    }
    
    ul#navWrapper li:hover ul {
      display: block;
      margin-left: -45px;
      opacity: 0.8;
    }
    
    ul#navWrapper a {
      font-weight: bold;
    }
    
    ul#navWrapper li li:hover {
  
      outline: 1px solid #fff;
      background-color:#e6e6ea;
    }    
    
    /**********/
    
    div#banner {
      border: 1px black solid;
      border-radius: 4px;    
      clear: both;
      height: 4em;
      background-color: rgba(255, 255, 255, 0); /* For non-CSS3 browsers. */
      background-image: -webkit-radial-gradient(100% 0%, circle cover, rgb(104,24,136) 0%, rgb(85,126,185) 100%);
      background-image: radial-gradient(circle at 100% 0%, rgb(104,24,136) 0%, rgb(85,126,185) 100%); /* IE10 and later */
    }
    
    
/*  ���� ��ܹ� �޴� */
   
    html, body {
    margin: 0px;
    padding: 0px;
     
}


.submenu{
	font-size: 13px;
}
      
#blog-header-container {
    position: fixed;
    top: 0px;
    left: 0px;
      
    width: 100%;
    height: 100px;
      
    background-color: #fff;
}
      
#blog-header-container h1 {
    position: relative;
    top: 40px;
    left: 20px;
      
    font-size: 2.0em;
    font-weight: bold;
}
      
#menu-container {
    position: fixed;
    top: 100px;
    left: 0px;
      
    width:100%;
    height: 50px;
    padding-left: 20px;
    padding-top: 15px;
    box-sizing: border-box;
      
    background-color: #000040;
      
    -webkit-transition: padding-left 200ms linear;
    -moz-transition: padding-left 200ms linear;
    -ms-transition: padding-left 200ms linear;
    -o-transition: padding-left 200ms linear;
    transition: padding-left 200ms linear;
}
#menu-container.fixed {
    padding-left: 70px;
    opacity: 0.95;
    -webkit-box-shadow: 0 1px 5px 1px rgba(0,0,0,0.2);
    box-shadow: 0 1px 5px 1px rgba(0,0,0,0.2);
}


#menu-container .menu-item {
    font-size: 1.4em;
    font-weight: bold;
    color: #fff;
}
#menu-container .menu-icon {
    display: block !important;
    position: absolute;
    left: -90px;
    top: 14px;
      
    font-size: 1.6em;
    font-weight: bold;
    color: #fff;
      
    -webkit-transition: left 300ms linear;
    -moz-transition: left 300ms linear;
    -ms-transition: left 300ms linear;
    -o-transition: left 300ms linear;
    transition: left 300ms linear;
}
#menu-container .menu-icon.on {
    left: 0px;
}
      
/* #blog-container {
    margin-top:200px;
    padding: 20px;
} */

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script>
function testLogin(){
	alert("�α����� �ʿ��� �����Դϴ�");
	location.href="LoginForm.action";
}
	
/* ���� ��ܹ� ����� */
	
// ���� ��ũ�ѹ��� ��ġ�� �����ϴ� ���� (px)
var currentScrollTop = 0;
     
// �񵿱�� jQuery�̹Ƿ� window load �� jQuery�� �����ؾ� ��
window.onload = function() {
    // ���ΰ�ħ ���� ��츦 ����� �޼ҵ� ����
    scrollController();
     
    // ��ũ���� �ϴ� ��쿡�� �����
    $(window).on('scroll', function() {
        scrollController();
    });
}
     
// ���� �޴��� ��ġ�� �����ϴ� �Լ�
function scrollController() {
    currentScrollTop = $(window).scrollTop();
    if (currentScrollTop < 100) {
        $('#blog-header-container').css('top', -(currentScrollTop));
        $('#menu-container').css('top', 100-(currentScrollTop));
        if ($('#menu-container').hasClass('fixed')) {
            $('#menu-container').removeClass('fixed');
            $('#menu-container .menu-icon').removeClass('on');
        }
    } else {
        if (!$('#menu-container').hasClass('fixed')) {
            $('#blog-header-container').css('top', -100);
            $('#menu-container').css('top', 0);
            $('#menu-container').addClass('fixed');
            $('#menu-container .menu-icon').addClass('on');
        }
    }
}
</script>
</head>

<body>

    <div id="blog-header-container" align="left">
    <table width="100%">
    <tr>
    	<td><input type="image" src="/SalaryMentoking/common/image/mainlogo1.png" onClick="location.href='MainAction.action'" onfocus="this.blur()" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='1'"/>
    	</td>
    	<td align="right">
    		<br><br><br>
    <s:if test="#session.member_id == null">	<!-- ��α��� �� -->
		
			<s:a href="LoginForm.action" >�α���</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<s:a href="Mem_SelectForm.action" >ȸ������</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<s:a href="javascript:testLogin();">����������</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>

</s:if>
<s:else>	<!-- �α��� �� -->
		
		<strong>'${ session.member_id }'�� ȯ���մϴ�! </strong>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="LogoutAction.action">�α׾ƿ�</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="MP_Mypage.action">����������</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="Message_ListAction.action?state=read">������</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>

</table>
</s:else>
    </div>
    <div id="menu-container">
        <div class="menu-icon" style="display:none;"><img src="/SalaryMentoking/common/image/mainlogo3.png"></div>
        <div class="menu-item">
			<ul id="navWrapper">
					<li class="submenu">��������
						<ul class="submenu">
							<li><a href="MTor_ListAction.action">�������丮��Ʈ</a></li>
							<li><a href="IB_ListAction.action">���������Խ���</a></li>
						</ul>	
					</li>
				</ul>
				
				<ul id="navWrapper">
					<li class="submenu">Ŀ�´�Ƽ
						<ul class="submenu">
							<li><a href="N_ListAction.action">���� ��������</a></li>
							<li><a href="UG_ViewAction.action">���������̵�</a></li>
							<li><a href="CB_ListAction.action">���������Խ���</a></li>
						</ul>	
					</li>
				</ul>
		</div>
    </div>
</div>    

</center>

</body>
</html>