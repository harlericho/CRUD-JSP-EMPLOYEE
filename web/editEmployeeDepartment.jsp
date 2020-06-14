<%-- 
    Document   : editEmployeeDepartment
    Created on : Jun 13, 2020, 10:13:46 PM
    Author     : Charlie
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Template/header.jsp" %> 
<jsp:useBean id="crud" class="com.controllers.crud" scope="page"></jsp:useBean>
    <!DOCTYPE html>
<%
    int per = 0;
    if (request.getParameter("cod") != null) {
        per = Integer.parseInt(request.getParameter("cod"));
    }
    ResultSet res = crud.getEmployeeDepartmentxID(per);
    ResultSet res1 = crud.getALLDepartment();
%>
<br><br>
<div class="container">
    <div class="row">
        <div class="mx-auto">
            <h1>EDIT EMPLOYEE-DEPARTMENT</h1>
            <p style="color: brown">Only the department is edited!</p>
            <form method="post" action="employeeDepartmentCrud.jsp">
                <% while (res.next()) {%>
                <div class="form-group">
                    <input type="hidden" id="id_em_dep" name="id_em_dep" value="<%= res.getInt(1)%>">
                    <label for="exampleInputPassword1">Employee:</label>
                    <select class="combobox form-control" name="selectEmployee">
                        <option value="<%= res.getInt(2)%>"><%= res.getString(3)%></option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Department:</label>
                    <select class="combobox form-control" name="selectDepartment">
                        <option selected disabled  value="">Select department</option>
                            <% while (res1.next()) {%>
                        <option value="<%= res1.getInt(1)%>"><%= res1.getString(2)%></option>
                        <%}%>  
                    </select>
                </div>
                <button type="submit" class="btn btn-dark" name="btnEdit"> <i class="fa fa-edit"></i> Edit</button>
                <br><br>
                <div class="form-group">
                    <a href="index.jsp">Go to start</a>
                </div>
                <% }%>
            </form>
        </div>
    </div>
</div>
<%@include file="Template/footer.jsp" %> 