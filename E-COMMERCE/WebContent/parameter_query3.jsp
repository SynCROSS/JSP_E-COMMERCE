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
<%
String phone_number = request.getParameter("phone_number"); 
String email = request.getParameter("email");

if(phone_number==null){
	phone_number="";
}%>
<p>Enter the Phone Number</p>
<input type="text" id="phone_number">
<%=phone_number%>
<p>Enter the E-MAIL</p>
<input type="text" id="email">
<%=email%>
<br>
<input type="button" onclick="click_search()" value="submit">
<table border = "1">
<tr>
	<td>PHONE</td>
	<td>EMAIL</td>
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
	" MEMBER.PHONE, MEMBER.EMAIL, MEMBER.NAME, "+
	" PAYMENT_HISTORY.ORDER_PRICE, PAYMENT_HISTORY.PRODUCT_ID, "+
	" PAYMENT_HISTORY.ORDER_COUNT "+
	" FROM MEMBER, PAYMENT_HISTORY "+
	" WHERE MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID ";
	
	if(phone_number!=null){
		query+=" AND MEMBER.PHONE LIKE '%"+phone_number+"' ";
	}
	if(email!=null){
		query+=" AND MEMBER.EMAIL LIKE '%"+email+"%' ";
	}
		        
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("PHONE")%></td><%
			%><td><%=rs.getString("EMAIL")%></td><%
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
		const phone_number = document.getElementById("phone_number").value;
		const email = document.getElementById('email').value;
		
		redirect_with_get_params(phone_number, email);
	}
	
	function redirect_with_get_params(phone_number, email) {
		window.location.href = 'parameter_query3.jsp?phone_number=' + phone_number + '&email=' + email;
	}
</script>
</body>
</html>