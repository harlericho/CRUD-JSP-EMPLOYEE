/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.data;

/**
 *
 * @author Charlie
 */
public class conexion {

    //Aqui se llena los datos de la base mysql, se carga el controlador JDBC
    private final String driver;
    private final String url;
    private final String usuario;
    private final String contraseña;

    public conexion() {
        this.driver = "com.mysql.jdbc.Driver";
        this.url = "jdbc:mysql://localhost:3306/crud2?";
        this.usuario = "root";
        this.contraseña = "";

    }

    public String getDriver() {
        return driver;
    }

    public String getUrl() {
        return url;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getContraseña() {
        return contraseña;
    }
}
