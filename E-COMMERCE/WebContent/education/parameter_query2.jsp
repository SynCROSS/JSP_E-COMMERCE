<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>parameter example</title>
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
	<td>PHONE</td>
	<td>NAME</td>
	<td>ORDER_PRICE</td>
	<td>PRODUCT ID</td>
	<td>ORDER COUNT</td>
</tr>
<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT "+
	" MEMBER.PHONE, MEMBER.NAME, "+
	" PAYMENT_HISTORY.ORDER_PRICE, PAYMENT_HISTORY.PRODUCT_ID, "+
	" PAYMENT_HISTORY.ORDER_COUNT "+
	" FROM MEMBER, PAYMENT_HISTORY "+
	" WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID ";
	
	if(phone_number!=null){
		query+=" AND MEMBER.PHONE LIKE '%"+phone_number+"' ";
	}
		        
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getInt("ORDER_PRICE")%></td><%
			%><td><%=rs.getInt("PRODUCT_ID")%></td><%
			%><td><%=rs.getInt("ORDER_COUNT")%></td><%
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
		window.location.href = 'parameter_query2.jsp?test=' + param;
	}
</script>
</body>
</html>