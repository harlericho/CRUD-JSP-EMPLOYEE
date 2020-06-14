/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import java.sql.*;
import com.data.conexion;

/**
 *
 * @author Charlie
 */
public class crud {

    conexion db = new conexion();
    String sql;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    //Mostrara todos los datos de la tabla empelado y departamento
    public ResultSet getALLEmployeeDepartment() {
        sql = "SELECT \n"
                + "ed.ID_EM_DEP,\n"
                + "e.NAME_EM,d.NAME_DEP,d.COMPANY_CODE_DEP\n"
                + "FROM\n"
                + "employye_department ed\n"
                + "INNER JOIN employee e ON ed.ID_EM=e.ID_EM\n"
                + "INNER JOIN department d ON ed.ID_DEP=d.ID_DEP";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            return rs;
        } catch (SQLException | ClassNotFoundException e) {
            return rs;
        }
    }

    //mostrar todos los empleados sin departameto registrado
    public ResultSet getALLEmployee() {
        sql = "SELECT \n"
                + "e.ID_EM,e.NAME_EM\n"
                + "FROM \n"
                + "employee e\n"
                + "left JOIN employye_department d ON e.ID_EM=d.ID_EM\n"
                + "WHERE d.ID_EM is null";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            return rs;
        } catch (SQLException | ClassNotFoundException e) {
            return rs;
        }
    }

    //mostrar todos los departamentos
    public ResultSet getALLDepartment() {
        sql = "SELECT d.ID_DEP, d.NAME_DEP FROM department d";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            return rs;
        } catch (SQLException | ClassNotFoundException e) {
            return rs;
        }
    }

    //agregar datos nuevos a la tabla seleccionada
    public void addEmployeeDepartment(String idemp, String iddep) {
        sql = "INSERT INTO employye_department (ID_EM, ID_DEP) VALUES('" + idemp + "','" + iddep + "')";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.executeUpdate();
            con.close();
            pst.close();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    //eliminar datos de la tabla seleccionada
    public void deleteEmployeeDepartment(int id) {
        sql = "DELETE FROM employye_department WHERE id_em_dep=" + id;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.executeUpdate();
            con.close();
            pst.close();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }

    //obtener informacion del dato seleccionado de la tabla
    public ResultSet getEmployeeDepartmentxID(int id) {
        sql = "SELECT ed.ID_EM_DEP,\n"
                + "ed.ID_EM,\n"
                + "e.NAME_EM\n"
                + "FROM\n"
                + "employye_department ed\n"
                + "INNER JOIN employee e ON ed.ID_EM=e.ID_EM\n"
                + "WHERE id_em_dep=" + id;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            return rs;
        } catch (SQLException | ClassNotFoundException e) {
            return rs;
        }
    }

    //actualizar los datos de la tabla seleccionada
    public void updateEmployeeDepartment(int id, String id_em, String id_dep) {
        sql = "UPDATE employye_department SET id_em='" + id_em + "',id_dep='" + id_dep + "' WHERE id_em_dep=" + id;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUsuario(), db.getContraseña());
            pst = con.prepareStatement(sql);
            pst.executeUpdate();
            con.close();
            pst.close();
        } catch (SQLException | ClassNotFoundException e) {
        }
    }
}
