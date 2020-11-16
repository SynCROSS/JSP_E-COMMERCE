<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>
<style>
table, tr, td {
	border: 1px solid #000;
	border-collapse: collapse;
}

td {
	width: 100px;
	height: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<%
		String str1 = "I'm a String.";
	%>
	<a>str1은</a>
	<%=str1%>
	<br />
	<%
		for (int i = 0; i <= 5; i++) {
		for (int j = 0; j <= i; j++) {
	%>
	<a>*</a>
	<%
		}
	%>
	<br />
	<%
		}
	%>
	<br>
	<%
		int i = 0, tmp = 1, preTmp = 1;
	%><%=preTmp%>
	<%=tmp%>
	<%
		while (true) {
		i = tmp + preTmp;
	%>
	<%=i%>
	<%
		preTmp = tmp;
	tmp = i;
	if (i > 100)
		break;
	}
	%>
	<br />
	<table>
		<%
			for (int i1 = 1; i1 <= 9; i1++) {
		%>
		<tr>
			<%
				for (int j1 = 1; j1 <= 9; j1++) {
			%>
			<td><%=i1%> × <%=j1%> = <%=i1 * j1%></td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
	<%
		String[][] starArr = new String[5][5];
	for (int i3 = 0; i3 < 5; i3++) {
		for (int j3 = 0; j3 <= i3; j3++) {
			starArr[i3][j3] = "*";
		}
	}
	%>
	<table>
		<%
			for (int i2 = 0; i2 < 5; i2++) {
		%>
		<tr>
			<%
				for (int j2 = 0; j2 < 5; j2++) {
			%>
			<%
				if (starArr[i2][j2] == null) {
			%>
			<td>&nbsp;</td>
			<%
				} else {
			%>
			<td><%=starArr[i2][j2]%></td>
			<%
				}
			%>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
	<%
		String[][] starArr2 = new String[5][5];
	for (int i5 = 0; i5 < 5; i5++) {
		for (int j5 = 0; j5 <= i5; j5++) {
			starArr2[i5][4 - j5] = "*";
		}
	}
	%>
	<table>
		<%
			for (int i4 = 0; i4 < 5; i4++) {
		%>
		<tr>
			<%
				for (int j4 = 0; j4 < 5; j4++) {
			%>
			<%
				if (starArr2[i4][j4] == null) {
			%>
			<td>&nbsp;</td>
			<%
				} else {
			%>
			<td><%=starArr2[i4][j4]%></td>
			<%
				}
			%>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>