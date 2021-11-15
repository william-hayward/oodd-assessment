<%-- 
    Document   : adminlogin
    Created on : 13 Nov 2021, 16:17:09
    Author     : Sophia
--%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesFileFactory"%>
<%@page import="org.solent.com504.oodd.web.properties.PropertiesDaoFile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("selectedPage", "home");

    PropertiesDaoFile propertiesDaoFile = PropertiesFileFactory.getPropertiesDaoFile();

    // get the action
    String action = (String) request.getParameter("action");

    String adminusername = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.adminusername");
    String adminpassword = propertiesDaoFile.getProperty("org.solent.com504.oodd.web.adminpassword");

    if ("submitdetails".equals(action)) {
        adminusername = (String) request.getParameter("adminusername");
        adminpassword = (String) request.getParameter("adminpassword");

        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.adminusername", adminusername);
        propertiesDaoFile.setProperty("org.solent.com504.oodd.web.adminpassword", adminpassword);

    }
%>
<jsp:include page="header.jsp" />
<main role="main" class="container">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>
        <h1>Admin Login</h1>
        <form action="./admin.jsp" method="post" id="adminlogin" onsubmit="return login()">
            Admin Username: <input type="text" name="adminusername"/> <br>
            Admin Password: <input type="password" name="adminpassword"/> <br>


            <input type="hidden" name="action" value="submitdetails">
            <button type="submit" id="submit" >Submit</button>

            <p id="erroroutput"></p>

        </form>
        
        
       

        <script src="resources/js/adminlogin.js"></script> 
    </body>
</main>
<jsp:include page="footer.jsp" />