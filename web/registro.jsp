<%@page contentType="text/html" pageEncoding="UTF-8" session="true" import="clases.persona"%>
<%
    HttpSession vali = request.getSession();
    String msj = (String) vali.getAttribute("msj") == null ? "" : (String) vali.getAttribute("msj");
    String nombre = (String) vali.getAttribute("nombre") == null ? "" : (String) vali.getAttribute("nombre");
    String appat = (String) vali.getAttribute("appat") == null ? "" : (String) vali.getAttribute("appat");
    String apmat = (String) vali.getAttribute("apmat") == null ? "" : (String) vali.getAttribute("apmat");
    String rfc = (String) vali.getAttribute("rfc") == null ? "" : (String) vali.getAttribute("rfc");
    String usuario = (String) vali.getAttribute("usuario") == null ? "" : (String) vali.getAttribute("usuario");
    String veces = (String) vali.getAttribute("veces") == null ? "" : (String) vali.getAttribute("veces");
    vali.invalidate();
    

%>

<!DOCTYPE html>
<html>
<head>
	<title>registro</title>
	<link rel="stylesheet" type="text/css" href="css/registro.css"> 
	<meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/iconos.css">
        <script>         
        <%            
        if (!msj.equals("")) {
            out.print("alert('"+msj+"');");
            }
        if (veces.equals("1")&&msj.equals("")) {
            out.print("alert('Registro Correcto');");
            out.print("window.location = 'https://www.google.com';");
            }
        %>
        </script>
</head>
<body>
	<div class="banner">
		Registro
	</div>
	<br><br><br>
	<div class="ops">
		<a href="registroal.jsp"><div class="opsiesnac centrar" style="float: right;">
			<i class="material-icons" style="font-size: 100px;">face</i>
		</div></a>
		<div class="opsiesac centrar" style="float: left;">
			<i class="material-icons" style="font-size: 100px;">school</i>
		</div>
	</div>
	<br>
	<div align="center" style="font-family: arial; font-size: 30px; color: #0c67c3;">Profesor</div>
	<br><br>
	<div class="cont">
            <form method="post" action="registro">
		Nombre <br>
		<input type="text" name="nombre" placeholder="Ingrese su(s) nombre(s)" class="texto" required value="<%out.print(nombre);%>"> 
		<br><br>
		Apellido Paterno <br>
		<input type="text" name="appat" placeholder="Ingrese su apellido paterno" class="texto" required value="<%out.print(appat);%>"> 
		<br><br>
		Apellido Materno <br>
		<input type="text" name="apmat" placeholder="Ingrese su apellido materno" class="texto" required value="<%out.print(apmat);%>"> 
		<br><br>
		RFC <br>
		<input type="text" name="rfc" placeholder="Ingrese su RFC" class="texto" required value="<%out.print(rfc);%>"> 
		<br><br>
		Nombre de Usuario <br>
		<input type="text" name="usuario" placeholder="Ingrese un nombre de usuario" class="texto" required value="<%out.print(usuario);%>"> 
		<br><br>
		Contraseña <br>
		<input type="password" name="contra" placeholder="Ingrese una contraseña" class="texto" required> 
		<br><br>
		Confirmar Contraseña <br>
		<input type="password" name="contra2" placeholder="Ingrese una contraseña" class="texto" required> 
		<br><br>
		Correo <br>
		<input type="email" name="email" placeholder="Ingrese su correo electronico" class="texto" required> 
		<br><br>
		Confirme su correo <br>
		<input type="email" name="email2" placeholder="Confirme su correo electronico" class="texto" required> 
		<br><br>
		<input type="submit" name="enviar" value="Guardar y continuar" class="boton">
		<br><br>
                <input type="hidden" name="rol" value="1">
                <input type="hidden" name="regis" value="maestro">
            </form>
	</div>
</body>
</html>