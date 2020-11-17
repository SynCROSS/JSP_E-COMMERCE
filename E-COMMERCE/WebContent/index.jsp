<%@ page language="java" contentType="text/html; charset=EUC-KR"
<<<<<<< Updated upstream
	pageEncoding="EUC-KR"%>
=======
<<<<<<< Updated upstream
    pageEncoding="EUC-KR"%>
=======
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
		int i = 0, tmp = 1, preTmp = 1;
=======
		int sum = 0, tmp = 1, preTmp = 1;
>>>>>>> Stashed changes
	%><%=preTmp%>
	<%=tmp%>
	<%
		while (true) {
<<<<<<< Updated upstream
		i = tmp + preTmp;
	%>
	<%=i%>
	<%
		preTmp = tmp;
	tmp = i;
	if (i > 100)
=======
		sum = tmp + preTmp;
	%>
	<%=sum%>
	<%
		preTmp = tmp;
	tmp = sum;
	if (sum > 100)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
	<table border = "1">
	<tr>
		<td>ID</td>
		<td>카테고리명</td>
		<td>이름</td>
		<td>가격</td>
		<td>재고</td>
		<td>설명</td>
		<td>원산지</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = "SELECT " +
					"PRODUCT.ID, PRODUCT.CATEGORY_ID, CATEGORY.NAME AS CATEGORY_NAME, PRODUCT.NAME AS PRODUCT_NAME, PRODUCT.PRICE, PRODUCT.STOCK, PRODUCT.DESCRIPTION, PRODUCT.ORIGIN " +
					"FROM " +
					"PRODUCT, CATEGORY "+
					"WHERE "+
					"PRODUCT.ID=CATEGORY.ID";
	
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getString("CATEGORY_NAME")%></td><%
		%><td><%=rs.getString("PRODUCT_NAME")%></td><%
		%><td><%=rs.getInt("PRICE")%></td><%
		%><td><%=rs.getInt("STOCK")%></td><%
		%><td><%=rs.getString("DESCRIPTION")%></td><%
		%><td><%=rs.getString("ORIGIN")%></td><%
														
		
		%><tr><%
	}
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
<%-- <table>
<tr>
<% int first_num=0,second_num=1;
	for(int i7=1; i7<=33; i7++){%>
		<td><%=second_num%></td>
		<%
		int temp = first_num+second_num;
		first_num=second_num;
		second_num=tmp;
		
		if(i7%3==0){
			%></tr><tr><%
		}
	}
%>
</tr>
</table> --%>
<table border = "1">
<tr>
<%
    int first_number = 0;
    int second_number = 1;

    for (int i = 1; i <= 33; i++) {
        %> <td><%=second_number%></td> <%
        int temp_number = first_number + second_number;
        first_number = second_number;
        second_number = temp_number;

        if (i % 3 == 0) {
            %></tr><tr> <%
        }
    }
%>
</tr>
</table>
<table border = "1">
	<tr>
		<td>ID</td>
		<td>PASSWORD</td>
		<td>NAME</td>
		<td>EMAIL</td>
		<td>PHONE</td>
		<td>ADDRESS</td>
		<td>AGE</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = "SELECT "+
					"* "+
					"FROM MEMBER ";
	
	
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
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
<table border = "1">
	<tr>
		<td>ID</td>
		<td>가격</td>
		<td>주문량</td>
	</tr>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = "SELECT "+
	"PRODUCT.ID, PRODUCT.PRICE, PAYMENT_HISTORY.ORDER_COUNT "+
	"FROM PAYMENT_HISTORY, PRODUCT "+
	"WHERE "+
	"PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID"; 
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getInt("PRICE")%></td><%
		%><td><%=rs.getString("ORDER_COUNT")%></td><%
														
		
		%><tr><%
	}
	
	  
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>
<%
try
{  
	//step1 load the driver class  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	  
	//step2 create  the connection object  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	  
	//step3 create the statement object  
	Statement stmt=con.createStatement();  
	  
	//step4 execute query  
	String query = 
	"UPDATE "+"payment_history "+
	"SET "+
	"order_price = order_count *"+ 
	"("+" SELECT "+
	"product.price "+
	"FROM "+
	"product "+
	"WHERE "+
	"payment_history.product_id = product.id "+
	")";; 
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next())
	
	//step5 close the connection object  
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
</body>
</html>