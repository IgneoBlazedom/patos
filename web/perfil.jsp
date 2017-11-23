<%@page import="clases.persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xses = request.getSession();
    String nom = "";
    String img = "";
    String rol = "";
    String rfc = "";
    String email = "";
    String usr = "";
    String id = (String) xses.getAttribute("id");
    if (id == null) {
        response.sendRedirect("inicioSesion.jsp");
    } else {
        persona p = new persona();
        p.todo(id);
        nom = p.nombreComp();
        img = p.getImagen();
        rol = p.getRol();
        rfc = p.getBoleta();
        email = p.getEmail();
        usr = p.getUsuario();

    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Flash Learning</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel='icon'  href='img/logo.ico'> 
        <style type="text/css">
            .active{
                box-shadow: 0 5px 0 0  #39f;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #fff;">
            <a class="navbar-brand " href="inicio.jsp" style="color: #9cf; font-size: 2em"><img src="img/logo2.png" width="50" height="50" class="d-inline-block align-top" alt=""><span class="Flash">Flash Learning</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navar" aria-controls="navar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navar">
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link active" href="perfil.jsp">Perfil <span class="sr-only"></span></a>
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
            Perfil

        </div>
        <br>
        
        <div class="contenido" id="formulario" style="display: block;">
            <br>
            <div class="contenido2">
            <form class="fromi">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password</label>
                        <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password</label>
                        <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password</label>
                        <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Sign in</button>
            </form>
            </div>
            

        </div>

        <div class="" id="datos" style="display: none;">
            <div class=" text-left img">
                <img class="usr" src="img/<%=img%>" width="200" height="200"  alt="foto usuario">
            </div>
            <div class="cont">
                <div class="container">
                    <div class="row justifycontent-center" >
                        <div class="col"></div>
                        <div class="col-2"><%=nom%></div>
                        <div class="col-2">RFC <br><%=rfc%></div>
                        <div class="col-2">E-mail <br><%=email%></div>
                        <div class="col"></div>
                    </div>
                    <br>
                    <div class="row justifycontent-center" >
                        <div class="col"></div>
                        <div class="col-2">Usuario <br><%=usr%></div>
                        <div class="col"></div>
                    </div>
                    <br><br>
                    <div class="row justifycontent-center" >
                        <div class="col"></div>
                        <div class="col-2"><button type="submit" class="btn btn-outline-primary">Editar datos</button></div>
                        <div class="col"></div>
                    </div>

                </div>
            </div>
        </div>



    </body>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>
