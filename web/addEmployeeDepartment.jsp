<%-- 
    Document   : addPersons
    Created on : Jun 8, 2020, 12:04:02 PM
    Author     : Charlie
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Template/header.jsp" %> 
<jsp:useBean id="crud" class="com.controllers.crud" scope="page"></jsp:useBean>
    <!DOCTYPE html>
<%
    ResultSet rs = crud.getALLEmployee();
    ResultSet rs1 = crud.getALLDepartment();
%>
<br><br>
<div class="container">
    <div class="row">
        <div class="mx-auto">
            <h1>ADD EMPLOYEE-DEPARTMENT</h1>
            <p style="color: brown">Here are registered employees who don't have a department!</p>
            <form method="post" action="employeeDepartmentCrud.jsp">

                <div class="form-group">

                    <label for="exampleInputPassword1">Employee:</label>
                    <select class="combobox form-control" name="selectEmployee">
                        <option selected disabled  value="">Select employee</option>
                        <% while (rs.next()) {%>
                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
                        <%}%>  
                    </select>

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Department:</label>
                    <select class="combobox form-control" name="selectDepartment">
                        <option selected disabled  value="">Select department</option>
                        <% while (rs1.next()) {%>
                        <option value="<%= rs1.getInt(1)%>"><%= rs1.getString(2)%></option>
                        <%}%>  
                    </select>
                </div>
                <button type="submit" class="btn btn-dark" name="btnSave"> <i class="fa fa-save"></i> Save</button>
                <br><br>
                <div class="form-group">
                    <a href="index.jsp">Go to start</a>
                </div>

            </form>
        </div>
    </div>
</div>
<%@include file="Template/footer.jsp" %> 