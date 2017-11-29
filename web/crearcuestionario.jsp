<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<%
    HttpSession xses = request.getSession();
    HttpSession cuestionario = request.getSession();
    String nombre = (String) cuestionario.getAttribute("nombre");
    String id = (String) xses.getAttribute("id");
    if (id == null) {
        response.sendRedirect("inicioSesion.jsp");
    } else {
        if (nombre == null) 
        response.sendRedirect("nuevoCuestionario.jsp");
    }
    String msj = (String) cuestionario.getAttribute("msj") == null ? "" : (String) cuestionario.getAttribute("msj");
%>
<head>
    <title>Crear Cuestionario</title>
    <link rel="stylesheet" type="text/css" href="css/crearquest.css" >
</head>
<script>
    window.onload = function(){
        document.getElementById("pregs").value = "";        
        alert('caca');
    };    
    function Send(){
        document.getElementById("siguard").value = "otra";
    }    
    function enviar2(){
        document.getElementById("siguard").value = "continuar";
    }      
    <%            
    if (!msj.equals("")) {
        out.print("alert('"+msj+"');");
        }
    %>

</script>
<body>
<div class="cont">
    <span style="font-family: Arial; font-size: 25px">
            Crear cuestionario nuevo
    </span>
    <br><br>
    <form method="post" action="creacuest" name="forma">
    <div class="formas">
        <input type="hidden"  id="siguard" name="siguard" value="0">
        <span>Inserte la pregunta</span><br>
        <input type="text" name="pregunta" placeholder="Inserte aquí la pregunta" class="texto" style="height: 32px;" required>
        <br><br><br>
        <span>Inserte el tiempo de la pregunta</span><br>
        <input type="text" name="min" placeholder="00 minutos" class="texto" style="width: 120px;" required>
        &nbsp; &nbsp;<b>:</b>&nbsp; &nbsp;
        <input type="text" name="seg" placeholder="00 segundos" class="texto" style="width: 120px;" required>&nbsp;&nbsp;
        <!--<<input type="checkbox" name="">&nbsp;
        div class="smolr">Aplicar el mismo tiempo a todas las preguntas</div>-->
        <br><br><br>
        <span>Inserte las opciones de respuesta</span><br>
        <table cellspacing="10" width="600">
            <tr>
                <td>
                    <div class="abcd">Respuesta A)</div><br>
                    <input type="text" name="respuesta1" placeholder="Inserte aquí la respuesta" class="resp" required>
                    <input type="radio" name="correcto" value="A" required>	
                    <br>&nbsp;		
                </td>
                <td>
                    <div class="abcd">Respuesta B)</div><br>
                    <input type="text" name="respuesta2" placeholder="Inserte aquí la respuesta" class="resp" required>
                    <input type="radio" name="correcto" value="B" required>
                    <br>&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <div class="abcd">Respuesta C)</div><br>
                    <input type="text" name="respuesta3" placeholder="Inserte aquí la respuesta" class="resp" required> 
                    <input type="radio" name="correcto" value="C" required>
                </td>
                <td>
                    <div class="abcd">Respuesta D)</div><br>
                    <input type="text" name="respuesta4" placeholder="Inserte aquí la respuesta" class="resp" required>
                    <input type="radio" name="correcto" value="D" required>
                </td>
            </tr>
        </table>
        <br><br>
        <div align="center">
            <input type="submit" name="enviar" value="Añadir otra pregunta" class="boton" onClick="Send();">
            <div style="width: 60px; display: inline-block;">&nbsp;</div>
            <input type="submit" name="enviar" value="Guardar y continuar" class="boton" onClick="enviar2();">
        </div>
    </div>        
        <input type="hidden"  id="siguard" name="idProf" value="<%out.print(id);%>">
        <input type="hidden"  id="siguard" name="nombrecuest" value="<%out.print(nombre);%>">        
    </form>
</div>
</body>
</html>
