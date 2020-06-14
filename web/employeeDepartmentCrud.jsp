<%-- 
    Document   : persona
    Created on : Jun 8, 2020, 11:28:34 AM
    Author     : Charlie
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="crud" class="com.controllers.crud" scope="page"></jsp:useBean>
    <!DOCTYPE html>
<%
    //Aqui hacemos el controlador para realziar todos los crud
    //Guardar
    if (request.getParameter("btnSave") != null) {
        String idem = request.getParameter("selectEmployee");
        String iddep = request.getParameter("selectDepartment");
        crud.addEmployeeDepartment(idem, iddep);
        out.println("<html><head></head><body onload=\"alert('Save data!'); window.location='index.jsp' \"></body></html>");
    }

    //Eliminar
    if (request.getParameter("cod") != null) {
        int codigo = Integer.parseInt(request.getParameter("cod"));
        crud.deleteEmployeeDepartment(codigo);
        out.println("<html><head></head><body onload=\"alert('Delete Data!!'); window.location='index.jsp' \"></body></html>");
        
    }

    //Modificar
    if (request.getParameter("btnEdit") != null) {
        int id = Integer.parseInt(request.getParameter("id_em_dep"));
        String id_em = request.getParameter("selectEmployee");
        String id_dep = request.getParameter("selectDepartment");
        crud.updateEmployeeDepartment(id, id_em, id_dep);
        out.println("<html><head></head><body onload=\"alert('Update Data!'); window.location='index.jsp' \"></body></html>");
        
    }
    

%>
