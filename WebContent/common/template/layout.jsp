<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
<title><tiles:getAsString name="title" /></title>
<style>
A { color: blue; font-weight: bold; text-decoration: none}
A:hover { color: blue; font-weight: bold; text-decoration: underline}
</style>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        <tiles:insertAttribute name="header" />
    </td>
</tr>
<tr>
    <td>
        <!-- ���� �κ�: ���� -->
        <tiles:insertAttribute name="body" />
        <!-- ���� �κ�: �� -->
    </td>
</tr>
<tr>
    <td>
        <tiles:insertAttribute name="footer" />
    </td>
</tr>
</table>
</body>
</html>