<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<title></title>

<style>
		/*메인 이미지 슬라이드 */ 

	.cycle-slideshow, .cycle-slideshow * { -wedkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
	.cycle-slideshow { width: 100%; min-width: 1100px; max-width: 1100px; margin: 10px auto; padding:0; position: relative;}
	.cycle-slideshow div.slide { width: 100%; height: 100% }
	.cycle-slideshow img {
		position: absolute; top: 0; left: 0;
		width: 100%; padding:0; display: block;
	}
	.cycle-slideshow img:first-child{
		position: static; z-index: 100;
	}
 	.cycle-pager span{
		font-family: arial;  /* font-size: 50px; */  width: 16px; height: 16px;
		display: inline-block; color: #ddd; cursor: pointer;
	} 
 	.cycle-pager span.cycle-pager-active { color: #162dad;}
	.cycle-pager > * { cursor: pointer; } 



        /*여기서부터는 드롭메뉴바 스타일*/
    a, a:hover {
      text-decoration: none;
    }
    
        
    /**********/
    
    ul#navWrapper {
      border: 0 ;
      margin-left: 0px;
      float: left;
    }
        
    ul#navWrapper li {
      border: 1px ;    
      float: left;
      list-style: none;
      margin-right: 0px;
      background-color: #FFFFFF;
      padding: 0px;
      border-radius: 0px;
    }
    
    ul#navWrapper li li {
      border: 0 ;    
      float: none;
      margin-left: 0px;
      margin-top: 0px;
      width:150px;
    }

    ul#navWrapper li li:first-child { 
      margin-top: 0px;
    }


    ul#navWrapper ul {
      display: none;
      position: absolute;
      background-color: #FFFFFF; /* For non-CSS3 browsers. */
      background-color: rgba(255, 255, 255, 0);
    }
    
    ul#navWrapper li:hover ul {
      display: block;
      margin-left: -40px;
      opacity: 0.6;
    }
    
    ul#navWrapper a {
      font-weight: bold;
    }
    
    ul#navWrapper li li:hover {
      background-color: #FFFFFF;
      outline: 1px solid #000000;
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
    
    </style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

</head>
<body> 
<center>

<table width="900" border="0" cellspacing="0" cellpadding="0" align="center" height="100" >
	<tr align="center">
		<td width="200" align="center" >
			<ul id="navWrapper">
				<li class="main"><input type="image" src="/SalaryMentoking/common/image/mentorInfo.png" onfocus="this.blur()" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='1'"/>
					<ul class="submenu">
						<li><a href="MTor_ListAction.action">멘토리스트</a></li>
						<li><a href="IB_ListAction.action">직무게시판</a></li>
					</ul>	
				</li>
			</ul>
		</td>
		<td width="100" align="center">
		<br>
			<div style="color:black; font-size:10pt;" onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">MENTOR</div>
			'<b><font color="#162dad"> ${mv.member_no} </font></b>'명
		</td>
		<td width="100" align="center">
		<br>
			<div style="color:black; font-size:10pt;" onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">MENTORING</div>
			'<b><font color="#162dad"> ${tv.mentor_no} </font></b>'건
		</td> 
		<td width="100" align="center">
		<br>
			<div style="color:black; font-size:10pt;" onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">JOB INTERVIEW</div>
			'<b><font color="#162dad"> ${iv.iboard_no } </font></b>'건
		</td>
		<td width="100" align="center">
		<br>
			<div style="color:black; font-size:10pt;" onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">REVIEW</div>
			'<b><font color="#162dad"> ${rv.rboard_no } </font></b>'건
		</td>
		<td width="100" align="center">
		<br>
			<div style="color:black; font-size:10pt;" onmouseover="this.style.color='blue'" onmouseout="this.style.color='black'">APPLY</div>
			'<b><font color="#162dad"> ${av.apply_no} </font></b>'건
		</td>
		<td width="200" align="center" >
 
				<ul id="navWrapper">
					<li class="main"><input type="image" src="/SalaryMentoking/common/image/community.png" onfocus="this.blur()" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='1'"/>
						<ul class="submenu">
							<li><a href="N_ListAction.action">공지사항</a></li>
							<li><a href="UG_ViewAction.action">가이드</a></li>
							<li><a href="CB_ListAction.action">자유게시판</a></li>
						</ul>	
					</li>
				</ul>

			
		</td>
	</tr>
	<tr>
		<td colspan="7" height="1" bgcolor="#e0e0e0"></td>
	</tr>

</table>

<br><br>
</center>
<center>
<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="2200">
	<div class="cycle-pager" ></div>
	    <img src="/SalaryMentoking/common/image/main2.png" class="slider_image" border="0" width="1100" height="430"/>
		<img src="/SalaryMentoking/common/image/main3.png" class="slider_image" border="0" width="1100" height="430"/>
		<img src="/SalaryMentoking/common/image/main1.png" class="slider_image" border="0" width="1100" height="430"/>
</div>

<br><br><br>



</center>
</body>
</html>