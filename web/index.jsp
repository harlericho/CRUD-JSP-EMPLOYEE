<%-- 
    Document   : index.jsp
    Created on : Jun 13, 2020, 8:44:24 PM
    Author     : Charlie
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Template/header.jsp" %> 
<jsp:useBean id="crud" class="com.controllers.crud" scope="page"></jsp:useBean>
    <div class="container">
        <br>
        <h1>CRUD EMPLOYEE-DEPARTMENT</h1>
        <br>
        <div class="row">
            <div class="mx-auto table-responsive-sm">
                <a href="addEmployeeDepartment.jsp" class="btn btn-outline-dark" title="Add">
                    <i class="fa fa-user-plus"></i> Add
                </a>
                <br><br>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Department</th>
                            <th scope="col">Code</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                <%
                    ResultSet rs = crud.getALLEmployeeDepartment();
                %>
                <tbody>
                    <%while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><%= rs.getString(1)%></th>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td>
                            <a href="editEmployeeDepartment.jsp?cod=<%= rs.getString(1)%>" class="btn btn-outline-primary btn-sm" title="Edit">
                                <i class="fa fa-edit"></i>
                            </a>
                            <a href="employeeDepartmentCrud.jsp?cod=<%= rs.getString(1)%>" class="btn btn-outline-danger btn-sm" title="Delete">
                                <i class="fa fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="Template/footer.jsp" %>
