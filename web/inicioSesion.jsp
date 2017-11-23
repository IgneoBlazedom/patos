

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession xses = request.getSession();
    String msj = (String) xses.getAttribute("msj") == null ? "" : (String) xses.getAttribute("msj");
    xses.invalidate();
    

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Flash Learning</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link rel='icon'  href='img/logo.ico'> 
        <script>
            <%      if (!msj.equals("")) {
                    out.print("alert('"+msj+"');");
                }
            %>
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
                <div class="col-1"><img class="logo" src="img/logo.png" alt="logotipo Flash Learning"></div>
                <div class="col-6"><h1 class="titulo">FLASH LEARNING</h1></div>
            </div>
            <br>
            <div class="row align-items-center ">
                <div class="col"></div>
                <div class="col-auto justifycontent-center">
                    <span><h3 class="tit">Iniciar sesión</h3></span>
                </div>
                <div class="col"></div>
            </div>
            <div class="row justifycontent-center">
                <div class="col"></div>
                <div class="col-6 justify-content-center">
                    <form method="post" action="login">
                        <div class="form-group">
                            <label for="usuario">Usuario</label>
                            <input type="text" class="form-control campo" id="usuario" name="usuario"  placeholder="Nombre de usuario o e-mail">
                        </div>
                        <div class="form-group">
                            <label for="pass">Contraseña</label>
                            <input type="password" class="form-control campo" id="pass" name="pass" placeholder="Contraseña">
                        </div>
                        <br>
                        <center>
                            <button type="submit" class="btn btn-primary boton">Entrar</button><div class="registro">
                                <a href="registro.jsp">
                                    <span >
                                        Registrate
                                    </span>  
                                </a>        
                            </div>
                        </center>
                    </form>
                </div>
                <div class="col"></div>
            </div>
        </div>
</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>
