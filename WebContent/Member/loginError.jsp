<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>로그인 에러 체크</title>

<script language="javascript">

	window.onload = function(){
		var chk = ${loginCheck}
		if(chk == -1){
			alert('비밀번호가 틀립니다.');
			history.back();
		}
		if(chk == 0){
			alert('아이디가 없습니다');
			history.back();
		}
	}
</script>
</head>
<body>
</body>
</html>