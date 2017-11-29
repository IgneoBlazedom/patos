<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xses = request.getSession();
    String id = (String) xses.getAttribute("id");
    if (id == null) {
        response.sendRedirect("inicioSesion.jsp");
    } else {
    }
    
    HttpSession cuestionario = request.getSession();
    String msj = (String) cuestionario.getAttribute("msj") == null ? "" : (String) cuestionario.getAttribute("msj");
    cuestionario.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/newquest.css">
</head>
<script>         
        <%            
        if (!msj.equals("")) {
            out.print("alert('"+msj+"');");
            }
        %>
        </script>
<body>
    <div class="banner">
        <div class="bannerint">Crear cuestionario nuevo</div>
    </div>
    <form action="NuevoCuestionario" method="post">
    <div class="cont">
        Nombre del Cuestionario
        <br>
        <textarea placeholder="Ingrese el nombre del cuestionario" required name="nombrecuest"></textarea>
        <br>
        <div align="center"><input type="submit" name="continuar" value="Guardar y continuar" class="boton"></div>		
    </div>
    <input type="hidden"  id="siguard" name="idProf" value="<%out.print(id);%>">
    </form>
</body>
</html> 		