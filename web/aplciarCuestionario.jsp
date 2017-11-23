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
	<title>Aplicar Cuestionario</title>
	<link rel="stylesheet" type="text/css" href="aplicarquest.css">
	<meta charset="UTF-8">
</head>
<body>
	<div class="banner">
		<div class="bannerint">Aplicar Cuestionario</div>
	</div>
	<br>
	<div class="cont">
		<p>Nombre del Cuestionario</p>
		<div style="margin-left: 20px;  width: 100%;">
			<select>
			  <option value="default">Seleccionar cuestionario</option>
			  <option value="">Cuestionario historia1</option>
			  <option value="">Cuestionario Español1</option>
			  <option value="">Cuestionario historia2</option>
			</select>
			<br>
			<input type="text" name=""  placeholder="Ingrese el grupo a evaluar" class="texto">
			<br>
			<input type="text" name=""  placeholder="Ingrese la calve de la evaluación" class="texto">
			<br><br>
			<span class="boop" id="numero" name="numero" style="font-size: 24px">00</span>
			<span class="boop">&nbsp;Alumnos se han unido a la evaluación</span>
		</div>
		<div class="derecha" align="center">
			<input type="submit" name="continuar" value="Comenzar Evaluación" class="boton">
		</div>
	</div>
</body>
</html>