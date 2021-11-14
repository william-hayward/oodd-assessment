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
    request.setAttribute("selectedPage", "admin");

    PropertiesDaoFile propertiesDaoFile = PropertiesFileFactory.getPropertiesDaoFile();

    String cardto = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardto");
    String cardtoname = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoname");
    String cardtoexpdate = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtoexpdate");
    String cardtocvv = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.cardtocvv");
    String url = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.url");

    // rest client
    BankRestClientImpl rester = new BankRestClientImpl(url);
    CreditCard toCard = new CreditCard();
    String message = "";

    // get the action
    String action = (String) request.getParameter("action");
    if ("submitadmindetails".equals(action)) {

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

    if ("submiturl".equals(action)) {
        message = "url for the bank is set";
        url = (String) request.getParameter("url");
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.url", url);
        rester = new BankRestClientImpl(url);
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

            <form action="./admin.jsp" method="post" id="urlform">
                URL <input type="text" name="url" value="<%=url%>"/> <br>

                <input type="hidden" name="action" value="submiturl">
                <button type="submit" id="submit" >Submit URL</button>

                <p id="erroroutput"></p>

            </form>

            <form action="./admin.jsp" method="post" id="adminform" onsubmit="return validate()">

                To CreditCard: <input type="text" name="cardto" maxlength="16" value="<%=cardto%>"/> <br>
                Name on Card: <input type="text" name="cardtoname" value="<%=cardtoname%>"/> <br>
                Expiry date: <input type="text" name="cardtoexpdate" value="<%=cardtoexpdate%>"/> <br>
                CVV code: <input type="text" name="cardtocvv" maxlength="3" value="<%=cardtocvv%>"/> <br>




                <input type="hidden" name="action" value="submitadmindetails">
                <button type="submit" id="submit" >Submit</button>

                <p id="erroroutput"></p>
                <p><%=message%></p>
            </form>

            <script src="resources/js/validation.js"></script> 
        </body>
    </html>
