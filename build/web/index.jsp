<%-- 
    Document   : index
    Created on : 20/09/2021, 19:26:25
    Author     : joseg
--%>

<%@page import="Modelo.Productos"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Marcas"%>
<%@page import="Controlador.p_producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Segundo Examen parcial</title>
    </head>
    <body>
        
        <div class="container">
            <form action="p_producto" method="post" class="form-group" >
                <h1>Formulario de Productos</h1>
            <div class="row">
                    <div class="row g-3">
                        <div class="col-md-6">
                          <label for="lbl_producto"><b>Producto</b></label>
                          <input type="text" class="form-control" name="txt_producto" placeholder="Producto" aria-label="Producto">
                        </div>
                     
                        <div class="col-md-2">
                          <label for="lbl_existencia"><b>Existencia</b></label>
                          <input type="number" class="form-control" name="txt_existencia">
                      </div>
                </div>
            </div>
                <br>
                <label for="lbl_descripcion"><b>Descripción</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Descripcion del producto">
                <br>
                <div class="row">
                    <div class="row g-6">
                        <div class="col-md-6">
                            <label for="lbl_costo"><b>Precio Costo</b></label>
                            <div class="input-group mb-3">
                                
                                <span class="input-group-text" id="basic-addon1">Q</span>
                                <input type="number" step="0.01" name="txt_costo" id="txt_costo" class="form-control" placeholder="Q##. ##">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="lbl_venta"><b>Precio de Venta</b></label>
                            <div class="input-group mb-3">
                                
                                <span class="input-group-text" id="basic-addon1">Q</span>    
                                <input type="number" step="0.01" name="txt_venta" id="txt_venta" class="form-control" placeholder="Q##. ##">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <label for="lbl_marcas"><b>Marca del Producto</b></label>
                          <select name="drop_marcas" id="drop_marcas" class="form-select">
                            <%
                                Marcas marca= new Marcas();
                                HashMap<String,String> desplegar= marca.mostrar_marcas();
                                for(String i:desplegar.keySet())
                                {
                                    out.println("<option value="+i+">"+desplegar.get(i)+ "</option>");
                                }
                            %>
                          </select>
                </div>
                          <br> <br>
                    <div class="d-grid gap-2 col-6 mx-auto">
                    <button name="btn_agregar" id="btn_agregar" class="btn btn-primary" value="agregar">Agregar</button>
                  </div>
            </form>         
            <br> <br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Producto </th>
                        <th>Descripcion </th>
                        <th>Precio Costo </th>
                        <th>Precio Venta </th>
                        <th>Existencia</th>
                        <th>Marca </th>
                    </tr>
                </thead>
                <tbody id="tbl_productos">
                    <%
                    Productos producto = new Productos();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = producto.leer();
                    for (int t=0;t <tabla.getRowCount();t++){
                        out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-idp="+tabla.getValueAt(t, 7)+">");
                        out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");

                        out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
                        out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
                        out.println("</tr>");
                    }
                    %>
                </tbody>
            </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    </body>
</html>
