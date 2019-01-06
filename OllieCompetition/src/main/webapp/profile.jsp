<%-- 
    Document   : profile
    Created on : Oct 17, 2016, 4:47:17 PM
    Author     : Wsl_F@ITeazer
--%>
<%@page import="com.iteazer.logic.Contest" %>
<%@ page import="com.iteazer.logic.Results" %>
<%@ page import="com.iteazer.logic.Team" %>
<%@ page import="java.util.List" %>
<%
    String teamName = (String) session.getAttribute("login");
    Team currentTeam = Team.getTeam(teamName);
    Results results = Contest.getResults();
    int timeRound1 = results.getTime(currentTeam, 0);
    int timeRound2 = results.getTime(currentTeam, 1);
    double scoreRound1 = results.getCurrentResult(currentTeam, 0);
    double scoreRound2 = results.getCurrentResult(currentTeam, 1);
    int attemptsLeft1 = results.AttemptLeft(currentTeam, 0);
    int attemptsLeft2 = results.AttemptLeft(currentTeam, 1);
    //String webRes = OllieManager.sendHTTPRequest("http://127.0.0.1:1337/ollie/isConnected?MAC=dc712fb5b631");
%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= teamName%> profile </title>
    <link rel="stylesheet" type="text/css" href="profile.css">
</head>
<body>
<h1><%= teamName%> profile</h1>
<div>
    <%--<div class="row">--%>
    <%--<div class="column">--%>
    <%--<a href="https://docs.google.com/document/d/10C-auIyuGlNLr78_k3pfYUG2wl_GueQHOzbGm7HS4lU/edit">Rules</a>--%>
    <%--</div>--%>
    <%--<div class="column">--%>
    <%--<a href="https://github.com/ITeazer/Ollie_contest">GitHub</a>--%>
    <%--</div>--%>
    <%--<div class="column">--%>
    <%--<a href="results.jsp"> Current results </a>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--        <h5>Webres: <%=webRes%> </h5> ---%>
    <div class="row">
        <div class="column2">
            <h2> Your results: </h2>
            <table>
                <thead>
                <tr>
                    <th>Round</th>
                    <th>Score</th>
                    <th>Time</th>
                    <th>Attempts left</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Round 1</td>
                    <td><%= scoreRound1%>
                    </td>
                    <td><%= timeRound1%>
                    </td>
                    <td><%=attemptsLeft1%>
                    </td>
                </tr>
                <tr>
                    <td>Round 2</td>
                    <td><%= scoreRound2%>
                    </td>
                    <td><%= timeRound2%>
                    </td>
                    <td><%=attemptsLeft2%>
                    </td>
                </tr>
                </tbody>
            </table>

            <br>
            <br>

            <div class="row">
                <div class="column">
                    <center>
                        <form name="doCommands" action="performCommands.jsp" method="POST">
                            <input type="submit" value="Perform Commands" name="pCmd" class="button"
                                   style="background-color: #00FF00"/>
                        </form>
                    </center>
                </div>
                <div class="column">
                    <center>
                        <form name="calibrate" action="calibrate.jsp" method="POST" target="_blank">
                            <input type="submit" value="Calibrate" name="startCalibr" class="button"
                                   style="background-color: #FFD700"/>
                        </form>
                    </center>
                </div>
                <div class="column">
                    <center>
                        <form name="doCommandsFinal" action="performCommandsFinal.jsp" method="POST">
                            <% if (Contest.finalSubmit() >= 0 || true) {%>
                            <input type="submit" value="Final submission" name="pCmd" class="button"
                                   style="background-color: #FF2400"/>
                            <%}%>
                        </form>
                    </center>
                </div>
            </div>


            <div>
                <%
                    List<Team> teams = Team.getAllTeams();
                    results = Contest.getResults();
                %>
                <h2> All results: </h2>
                <table>
                    <thead>
                    <tr>
                        <td>Team</td>
                        <td>Round 1</td>
                        <td>Round 2</td>
                        <td>Total</td>
                    </tr>
                    </thead>
                    <tbody>
                    <%for (Team team : teams) {%>
                    <tr>
                        <td><%= team.getName()%>
                        </td>
                        <td><%= results.getCurrentResult(team, 0)%>
                        </td>
                        <td><%= results.getCurrentResult(team, 1)%>
                        </td>
                        <td><%= results.getCurrentResult(team, 0) + results.getCurrentResult(team, 1)%>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>

            </div>
        </div>

        <div class="column2">
            <div>
                <center>
                    <iframe width="100%" height="800px"
                            src="https://docs.google.com/document/d/e/2PACX-1vRxtYw_1kGx-ri34ChcWKtbsFC55DQ-aZQcgGrZ_44d0dyhCuc0fEt8K4xu56YaDR5KDqQb0GBcqrFb/pub?embedded=true"></iframe>
                </center>
            </div>
        </div>
    </div>
</div>
</body>
</html>
