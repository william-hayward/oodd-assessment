<%-- 
    Document   : cardcheck
    Created on : 12 Nov 2021, 16:31:36
    Author     : William
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.solent.com504.oodd.bank.client.cardcheck.CardValidationResult" %>
<%@ page import="org.solent.com504.oodd.bank.client.cardcheck.RegexCardValidator" %>

<%
    String creditcardno = request.getParameter("creditcardno");

    CardValidationResult result = RegexCardValidator.isValid(creditcardno);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Check</title>
    </head>
    <body>
        <h1>Credit Card Check</h1>
        <form action="./cardcheck.jsp" method="post">
            <input type="text" name="creditcardno" value="<%=creditcardno%>">
            <input type="hidden" name="action" value="removeUser">
            <button type="submit" >Check Card</button>
        </form>

        <% if (result.isValid()) {%>
        <p>"<%= result.getCardNo()%>" is a valid card number issued by  <%= result.getCardType()%> </p>
        <%
        } else {
        %>
        <p>"<%= result.getCardNo()%>" is an invalid card : <%= result.getError()%> </p>
        <%
            }
        %>
        
        <br>
        <br>
        <p>Go back to Index Page</P>
        <a href="./index.html" target="_blank" >Go back</a>
    </body>
</html>
