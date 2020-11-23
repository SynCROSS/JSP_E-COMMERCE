<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%String phone_number = request.getParameter("test"); 
if(phone_number==null){
	phone_number="";
}%>
<p>Enter the Phone Number</p>
<input type="text" id="search_condition">
<input type="button" onclick="click_search()">
<%=phone_number%>
<table border = "1">
<tr>
	<td>ID</td>
	<td>카테고리ID</td>
	<td>이름</td>
	<td>가격</td>
	<td>재고</td>
	<td>설명</td>
	<td>원산지</td>
</tr>
<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT ID, PASSWORD, NAME, EMAIL, PHONE, ADDRESS, AGE FROM MEMBER WHERE PHONE LIKE '%"+phone_number+"'";
		        
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getInt("ID")%></td><%
			%><td><%=rs.getString("PASSWORD")%></td><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getString("EMAIL")%></td><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("ADDRESS")%></td><%
			%><td><%=rs.getInt("AGE")%></td><%
		%><tr><%
	}
	
	con.commit();
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<script>
	function click_search() {
		const search_condition = document.getElementById("search_condition").value;
		
		redirect_with_get_params(search_condition);
	}
	
	function redirect_with_get_params(param) {
		window.location.href = 'parameter_query.jsp?test=' + param;
	}
</script>
</body>
</html>