<%@page import="clases.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xses = request.getSession();
    String nom = "";
    String img = "";
    String rol = "";
    String id = (String) xses.getAttribute("id");
    if (id == null) {
        response.sendRedirect("inicioSesion.jsp");
    } else {
        persona p = new persona();
        p.todo(id);
        nom = p.nombreComp();
        img = p.getImagen();
        rol = p.getRol();
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Flash Learning</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel='icon'  href='img/logo.ico'> 

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #fff;">
            <a class="navbar-brand " href="#" style="color: #39f; font-size: 2em"><img src="img/logo3.png" width="50" height="50" class="d-inline-block align-top" alt=""><span class="Flash">Flash Learning</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navar" aria-controls="navar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navar">
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link " href="perfil.jsp">Perfil <span class="sr-only"></span></a>
                    </li>
                    <%
                        if (!rol.equals("2")) {


                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="cuest" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                            Cuestionarios
                        </a>
                        <div class="dropdown-menu" aria-labelledby="cuest">
                            <a class="dropdown-item" href="nuevoCuestionario.jsp">Crear cuestionario nuevo</a>
                            <a class="dropdown-item" href="verCuestionario.jsp">Consultar cuestionarios existentes</a>
                            <a class="dropdown-item" href="aplciarCuestionario.jsp">Aplicar Cuestionario</a>
                        </div>
                    </li>
                    <%                        }
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="record.jsp">Récords</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="salir">Salir</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="titulo">
            Bienvenido a Flash Learning <br> <%=nom%>
        </div>
        <br>
        <br>
        <br>
        <div class=" text-center img">
            <img class="usr" src="img/<%=img%>" width="300" height="300"  alt="foto usuario">

        </div>
    </body>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>
