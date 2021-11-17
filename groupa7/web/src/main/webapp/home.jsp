<%-- 
    Document   : home
    Created on : 11 Nov 2021, 19:30:02
    Author     : Sophia
--%>

<%@page import="java.io.IOException"%>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.CreditCard"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.TransactionReplyMessage"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesFileFactory"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesDaoFile"%>
<%@page import="org.solent.com504.oodd.web.logger.Logger"%>
<%@page import="org.solent.com504.oodd.bank.client.cardcheck.CardValidationResult" %>
<%@page import="org.solent.com504.oodd.bank.client.cardcheck.RegexCardValidator" %>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.BankTransaction" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage", "home");

    PropertiesDaoFile propertiesDaoFile = PropertiesFileFactory.getPropertiesDaoFile();

    String cardno = (String) request.getParameter("cardno");
    String cardfromname = (String) request.getParameter("cardfromname");
    String cardfromexpdate = (String) request.getParameter("cardfromexpdate");
    String cardfromcvv = (String) request.getParameter("cardfromcvv");

    String cardto = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardto");
    String cardtoname = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoname");
    String cardtoexpdate = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoexpdate");
    String cardtocvv = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtocvv");
    String url = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.url");

    String amount = request.getParameter("amount");

    String message = "";

    // rest client
    try {
        BankRestClientImpl rester = new BankRestClientImpl(url);
        CreditCard fromCard = new CreditCard();
        CreditCard toCard = new CreditCard();

        // get the action
        String action = (String) request.getParameter("action");

        if ("submitdetails".equals(action)) {

            // set numbers
            fromCard.setCardnumber(cardno);
            fromCard.setName(cardfromname);
            fromCard.setEndDate(cardfromexpdate);
            fromCard.setCvv(cardfromcvv);

            toCard.setCardnumber(cardto);
            toCard.setName(cardtoname);
            toCard.setEndDate(cardtoexpdate);
            toCard.setCvv(cardtocvv);

            // do the transfer
            TransactionReplyMessage query = rester.transferMoney(fromCard, toCard, Double.valueOf(amount));

            String transactionMessage = "";
            TransactionReplyMessage transactionReplyMessage = new TransactionReplyMessage();
            transactionMessage = transactionReplyMessage.toString();

            String errormessage = "";
            errormessage = query.getMessage();

            if (errormessage == null) {

                String logmsg = "Transaction complete with card" + " " + cardno + " " + "for the amount of" + " " + amount + "." + "Full report: " + query;
                Logger.Logger(logmsg);
                message = "transaction sent successfully";
            } else {
                String logmsg = "Transaction was unsuccessful with card" + " " + cardno + " " + "for the amount of" + " " + amount + "." + "Full report: " + query;
                Logger.Logger(logmsg);
                message = "transaction failed, please check or card details or contact admin";
            }
        }
        if ("submitdetails".equals(action)) {

            cardto = (String) request.getParameter("cardto");
            cardtoname = (String) request.getParameter("cardtoname");
            cardtoexpdate = (String) request.getParameter("cardtoexpdate");
            cardtocvv = (String) request.getParameter("cardtocvv");

        }
    } catch (Exception e) {
        message = "Error connecting to website, please contact admin";
    }
%>
<jsp:include page="header.jsp" />
<main role="main" class="container">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="./resources/css/numpad-dark.css"/>
            <script src="./resources/js/numpad.js"></script>
        </head>
        <body>
            <h1>Transfer Money</h1>

            <form action="./home.jsp" method="post" id="transactionform" onsubmit="return validate()">
                Your Card Number: <input type="text" id="cardno" name="cardno" maxlength="16"/> <br>
                Name on Card: <input type="text" name="cardfromname"/> <br>
                Expiry date: <input type="text" name="cardfromexpdate"/> <br>
                CVV code: <input type="text" name="cardfromcvv" maxlength="3"/> <br> <br>

                Amount: <input type="text" name="amount"/>



                <input type="hidden" name="action" value="submitdetails">
                <button type="submit" id="submit" >Submit</button>

                <p id="erroroutput"></p>
                <p><%=message%></p>
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

            <script src="resources/js/validation.js"></script> 
        </body>
</main>
<jsp:include page="footer.jsp" />
