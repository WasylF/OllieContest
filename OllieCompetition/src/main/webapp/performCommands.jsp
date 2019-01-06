<%-- 
    Document   : performCommands
    Created on : Oct 17, 2016, 7:41:51 PM
    Author     : Wsl_F@ITeazer
--%>

<%

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perform commands</title>
        <link rel="stylesheet" type="text/css" href="performCommands.css">
    </head>
    <body>
        <h1><%=session.getAttribute("login")%>: perform commands</h1>
        <h2><a href="profile.jsp"> Your profile </a></h2>

        <div class="row">
            <div class="column1">
                <form name="commands" action="doCommands.jsp" method="POST" target="_blank">
                    <textarea name="textCommands" rows="40" cols="30"></textarea>
                    <br>
                    <input type="submit" value="Perform" name="perform"/>
                    <br>
                    <input type="reset" value="Clear" name="clear" />
                </form>
            </div>
            <div class="column2">
                <iframe width="700px" height="700px"
                        src="https://docs.google.com/document/d/e/2PACX-1vRNtppFkQUUJ4s8tLI1zooWNOVHH7Prni2slmx9TM72piEWf0md9_qfLacEiHJmPDZw8TEdV79WNz4P/pub?embedded=true"></iframe>
            </div>
        </div>
    </body>
</html>
