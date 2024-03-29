<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Domain.Instructor"%>
<%@page import="Domain.CourseSection"%>
<%@page import="Domain.Team" %>
<%@page import="Domain.Student" %>

<%@include file="header.jsp" %>
<div class="middle">
    <h2>View Teams</h2>
    <%@include file="messages.jsp" %> 
    
    <% CourseSection course = (CourseSection) session.getAttribute("courseCode");%>
    <h2> Course: <% course.getCourseName(); %> </h2>
    <% List<Team> teams = course.getTeams();%>
    <% for (Team team : teams) {%>
    <dl>
        <dt><a href="/JoinTeam" onclick="<% session.setAttribute("teamID", team.getId()); %>">Team ID: </a></dt><dd><% team.getId(); %></dd>
        <dt>Team Name: </dt><dd><% team.getTeamName(); %></dd>
        <dt>Date of Creation: </dt><dd><% team.getCreationDate(); %></dd>
        <dt>Status: </dt><dd><% team.getStatusString(); %></dd>     
    </dl>
    <% Student liaison = team.getLiaison();%>
    <h3>Liason Info: </h3>
    <dl>
        <dt>Student Number: </dt><dd><% liaison.getUserID(); %></dd>
        <dt>First Name: </dt><dd><% liaison.getFirstName(); %></dd>
        <dt>Surname: </dt><dd><% liaison.getLastName(); %></dd>
        <dt>Study Program: </dt><dd><% liaison.getStudyProgram(); %></dd>
        <dt>Email: </dt><dd><% liaison.getEmail(); %></dd>     
    </dl>
    <% List<Student> students = team.getMembers();%>
    <h3>Team Member Info: </h3>
    <% for (Student student : students) {%>    
    <dl>
        <dt>Student Number: </dt><dd><% student.getUserID(); %></dd>
        <dt>First Name: </dt><dd><% student.getFirstName(); %></dd>
        <dt>Surname: </dt><dd><% student.getLastName(); %></dd>
        <dt>Study Program: </dt><dd><% student.getStudyProgram(); %></dd>
        <dt>Email: </dt><dd><% student.getEmail(); %></dd>    
    </dl>
    <% } } %>
    
</div>
<%@include file="footer.jsp" %>
