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
<jsp:include page="header.jsp" />
<main role="main" class="container">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Check</title>
        <link rel="stylesheet" href="./resources/css/numpad-dark.css"/>
            <script src="./resources/js/numpad.js"></script>
    </head>
    <body>
        <h1>Credit Card Check</h1>
        <form action="./cardcheck.jsp" method="post">
            <input type="text" id="cardno" name="creditcardno">
            <input type="hidden" name="action" value="removeUser">
            <button type="submit" >Check Card</button>
        </form>
            
        <script>
            window.addEventListener("load", () => {

            // numpad
            numpad.attach({
            target: document.getElementById("cardno"),
                max: 16, // MAX 16 DIGITS
                decimal: false, // NO DECIMALS ALLOWED
       
            });
            });
    
        </script>

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

    </body>
</main>
<jsp:include page="footer.jsp" />
