/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author joseg
 */
public class Productos {
    private String producto, descripcion;
    private int id_marca, existencia;
    private float precio_costo, precio_venta;
    Conexion cn;

    public Productos(){}
    
    public Productos(String producto, String descripcion, int id_marca, int existencia, float precio_costo, float precio_venta) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.id_marca = id_marca;
        this.existencia = existencia;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public float getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(float precio_costo) {
        this.precio_costo = precio_costo;
    }

    public float getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(float precio_venta) {
        this.precio_venta = precio_venta;
    }
    
    
    public int agregar()
    {
        int devolver=0;
        try
        {
            PreparedStatement parametro;
            String codigo_sql="Insert into examen_2.productos (producto,Descripcion,idmarca,Existencia,precio_costo,precio_venta) values (?,?,?,?,?,?)";
            cn = new Conexion();
            cn.abrir_conexion();
            parametro=(PreparedStatement) cn.conexionBD.prepareStatement(codigo_sql);
            parametro.setString(1, getProducto());
            parametro.setString(2, getDescripcion());
            parametro.setInt(3, getId_marca());
            parametro.setInt(4, getExistencia());
            parametro.setFloat(5, getPrecio_costo());
            parametro.setFloat(6, getPrecio_venta());
            
            devolver=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(HeadlessException | SQLException ex)
        {
            System.out.println("error........"+ex.getMessage());
        }
        
        return devolver;
    }
    
    public DefaultTableModel leer()
    {
        DefaultTableModel tabla = new DefaultTableModel();
        try
        {
            cn = new Conexion();
            String query="SELECT p.id_producto as id,p.producto,p.descripcion,p.precio_costo,p.precio_venta,p.existencia,m.marca,p.idmarca FROM examen_2.productos as p inner join examen_2.marcas as m on p.idmarca = m.idmarca order by id_producto;";
            cn.abrir_conexion();
            ResultSet consulta=cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id","producto","descripcion","precio_costo","precio_venta","Existencias","marca","id_marca"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[]= new String [8];
            while(consulta.next())
            {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("descripcion");
                datos[3] = consulta.getString("precio_costo");
                datos[4] = consulta.getString("precio_venta");
                datos[5] = consulta.getString("existencia");
                datos[6] = consulta.getString("marca");
                datos[7] = consulta.getString("idmarca");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex)
        {
            System.out.println("Error:"+ex.getMessage());
        }
        return tabla;
    }
}
