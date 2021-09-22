/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author joseg
 */
public class Marcas {
    private String marca;
    private int id_marca;
    Conexion cn;

    public Marcas(){}
    
    public Marcas(String marca, int id_marca) {
        this.marca = marca;
        this.id_marca = id_marca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }
    
    
    public HashMap mostrar_marcas()
    {
        HashMap<String, String> drop_marca = new HashMap();
        try
        {
            String codigo_sql="Select idmarca as id, marca from examen_2.marcas";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta=cn.conexionBD.createStatement().executeQuery(codigo_sql);
            while(consulta.next())
            {
                drop_marca.put(consulta.getString("id"), consulta.getString("marca"));
            }
            
            cn.cerrar_conexion();    
        }catch(SQLException ex)
        {
         System.out.println(ex.getMessage());   
        }
        
        return drop_marca;
    }
    
}
