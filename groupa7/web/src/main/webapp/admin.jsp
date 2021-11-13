<%-- 
    Document   : admin
    Created on : 13 Nov 2021, 16:16:25
    Author     : Sophia
--%>

<%@page import="org.solent.com504.oodd.bank.client.model.dto.CreditCard"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.TransactionReplyMessage"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesFileFactory"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesDaoFile"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage","admin");
    
    
    String cardto = (String) request.getParameter("cardto");
    String cardtoname = (String) request.getParameter("cardtoname");
    String cardtoexpdate = (String) request.getParameter("cardtoexpdate");
    String cardtocvv = (String) request.getParameter("cardtocvv");
    
    String amount = request.getParameter("amount");
    
    // rest client
    BankRestClientImpl rester = new BankRestClientImpl("http://com528bank.ukwest.cloudapp.azure.com:8080/rest");
    CreditCard toCard = new CreditCard();
    
    // get the action
    String action = (String) request.getParameter("action");
    if ("submitadmindetails".equals(action)) {
        
        // set numbers
     
        
        toCard.setCardnumber(cardto);
        toCard.setName(cardtoname);
        toCard.setEndDate(cardtoexpdate);
        toCard.setCvv(cardtocvv);
        
        // do the transfer
    } 
%>
<main role="main" class="container">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin Details</h1>
        <form action="./admin.jsp" method="post" id="adminform" onsubmit="return validate()">
            
            To CreditCard: <input type="text" name="cardto" maxlength="16" value="<%=cardto%>"/> <br>
            Name on Card: <input type="text" name="cardtoname" value="<%=cardtoname%>"/> <br>
            Expiry date: <input type="text" name="cardtoexpdate" value="<%=cardtoexpdate%>"/> <br>
            CVV code: <input type="text" name="cardtocvv" maxlength="3" value="<%=cardtocvv%>"/> <br>
            
            
            
            
            <input type="hidden" name="action" value="submitadmindetails">
            <button type="submit" id="submit" >Submit</button>
            
            <p id="erroroutput"></p>
        </form>
            
        <script src="resources/js/validation.js"></script> 
    </body>
</html>
