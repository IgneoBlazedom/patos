<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xses = request.getSession();
    String id = (String) xses.getAttribute("id");
    if (id == null) {
        response.sendRedirect("inicioSesion.jsp");
    } else {
    }
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/newquest.css">
</head>
<body>
	<div class="banner">
		<div class="bannerint">Crear cuestionario nuevo</div>
	</div>
	<div class="cont">
		Nombre del Cuestionario
		<br>
		<textarea placeholder="Ingrese el nombre del cuestionario"></textarea>
		<br>
		<div align="center"><input type="submit" name="continuar" value="Guardar y continuar" class="boton"></div>		
	</div>
</body>
</html> 		