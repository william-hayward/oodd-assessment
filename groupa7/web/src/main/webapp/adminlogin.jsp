<%-- 
    Document   : adminlogin
    Created on : 13 Nov 2021, 16:17:09
    Author     : Sophia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
</html>
