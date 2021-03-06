<%-- 
    Document   : adminlogin
    Created on : 13 Nov 2021, 16:17:09
    Author     : Sophia
--%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesFileFactory"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesDaoFile"%>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.CreditCard"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import="org.solent.com504.oodd.bank.client.model.dto.TransactionReplyMessage"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesFileFactory"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesDaoFile"%>
<%@page import="org.solent.com504.oodd.web.logger.Logger"%>
<%@page import="org.solent.com504.oodd.bank.client.cardcheck.CardValidationResult" %>
<%@page import="org.solent.com504.oodd.bank.client.cardcheck.RegexCardValidator" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


    request.setAttribute("selectedPage", "admin");

    PropertiesDaoFile propertiesDaoFile = PropertiesFileFactory.getPropertiesDaoFile();

    String cardto = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardto");
    String cardtoname = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoname");
    String cardtoexpdate = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoexpdate");
    String cardtocvv = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtocvv");
    String url = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.url");

    String cardno = (String) request.getParameter("cardno");

    String amount = request.getParameter("amount");

    String loggedIn = "false";

    String message = "";

    try {
        // rest client
        BankRestClientImpl rester = new BankRestClientImpl(url);
        CreditCard toCard = new CreditCard();
        CreditCard fromCard = new CreditCard();

        // get the action
        String action = (String) request.getParameter("action");

        if ("submitadmindetails".equals(action)) {
            loggedIn = "true";
            cardto = (String) request.getParameter("cardto");
            cardtoname = (String) request.getParameter("cardtoname");
            cardtoexpdate = (String) request.getParameter("cardtoexpdate");
            cardtocvv = (String) request.getParameter("cardtocvv");

            propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardto", cardto);
            propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtoname", cardtoname);
            propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtoexpdate", cardtoexpdate);
            propertiesDaoFile.setProperty("org.solent.com504.oodd.web.cardtocvv", cardtocvv);

            // set numbers
            toCard.setCardnumber(cardto);
            toCard.setName(cardtoname);
            toCard.setEndDate(cardtoexpdate);
            toCard.setCvv(cardtocvv);
            message = "bank details are set";
            // do the transfer
        }

        if ("submitrefund".equals(action)) {
            loggedIn = "true";

            fromCard.setCardnumber(cardto);

            toCard.setCardnumber(cardno);

            TransactionReplyMessage query = rester.transferMoney(fromCard, toCard, Double.valueOf(amount));

            String transactionMessage = "";
            TransactionReplyMessage transactionReplyMessage = new TransactionReplyMessage();
            transactionMessage = transactionReplyMessage.toString();

            String errormessage = "";
            errormessage = query.getMessage();

            if (errormessage == null) {

                String logmsg = "Refund complete with card" + " " + cardno + " " + "for the amount of" + " " + amount + "." + "Full report: " + query;
                Logger.Logger(logmsg);
                message = "refund complete";
            } else {
                String logmsg = "Refund was unsuccessful with card" + " " + cardno + " " + "for the amount of" + " " + amount + "." + "Full report: " + query;
                Logger.Logger(logmsg);
                message = "refund was unsuccessful, check the card details and amount or the logs for a full report";
            }

        }

        if ("submiturl".equals(action)) {
            loggedIn = "true";
            message = "url for the bank is set";
            url = (String) request.getParameter("url");
            propertiesDaoFile.setProperty("org.solent.com504.oodd.web.url", url);
            rester = new BankRestClientImpl(url);
        }
    } catch (Exception e) {
        message = "Error connecting to website, please check the url to the website";
    }
%>
<jsp:include page="header.jsp" />
<main role="main" class="container">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="./resources/css/numpad-dark.css"/>
        <script src="./resources/js/numpad.js"></script>
    </head>
    <body>
        <h1>Admin Login</h1>
        <form action="./adminlogin.jsp" method="post" id="adminlogin">
            Admin Username: <input type="text" name="adminusername"/> <br>
            Admin Password: <input type="password" name="adminpassword"/> <br>


            <input type="hidden" name="action" value="submitdetails">
            <button type="submit" id="submitpass" name="submitpass" >Submit</button>

            <p id="erroroutput"></p>

        </form>
        <div id="adminforms">
            <form action="./adminlogin.jsp" method="post" id="urlform" >
                URL <input type="text" name="url" value="<%=url%>"/> <br>

                <input type="hidden" name="isloggedin" value="<%=loggedIn%>">
                <input type="hidden" name="action" value="submiturl">
                <button type="submit" id="submit" >Submit URL</button>

                <p id="erroroutput"></p>


            </form>

            <form action="./adminlogin.jsp" method="post" id="adminform" onsubmit="return validate()">

                To CreditCard: <input type="text" id="cardno" name="cardto" maxlength="16" value="<%=cardto%>"/> <br>
                Name on Card: <input type="text" name="cardtoname" value="<%=cardtoname%>"/> <br>
                Expiry date: <input type="text" name="cardtoexpdate" value="<%=cardtoexpdate%>"/> <br>
                CVV code: <input type="text" name="cardtocvv" maxlength="3" value="<%=cardtocvv%>"/> <br>



                <input type="hidden" name="isloggedin" value="<%=loggedIn%>">
                <input type="hidden" name="action" value="submitadmindetails">
                <button type="submit" id="submit" >Submit</button>

                <p id="erroroutput"></p>
            </form>

            <h1>Refund Details</h1>

            <form action="./adminlogin.jsp" method="post" id="transactionform" onsubmit="return validate()">
                The Card Number: <input type="text" id="cardno2" name="cardno" maxlength="16"/> <br>

                Amount: <input type="text" name="amount"/>


                <input type="hidden" name="isloggedin" value="<%=loggedIn%>">
                <input type="hidden" name="action" value="submitrefund">
                <button type="submit" id="submit" >Submit</button>

                <p id="erroroutput"></p>
                <p><%=message%></p>
            </form>
        </div>
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

        <script>
            window.addEventListener("load", () => {

                // numpad
                numpad.attach({
                    target: document.getElementById("cardno2"),
                    max: 16, // MAX 16 DIGITS
                    decimal: false, // NO DECIMALS ALLOWED

                });
            });

        </script>



        <script src="resources/js/adminlogin.js"></script> 
    </body>
</main>
<jsp:include page="footer.jsp" />