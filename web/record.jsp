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
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>Flash Learning</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style4.css">
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
  <div class="collapse navbar-collapse" id="navar" >
    <ul class="navbar-nav">
      <li class="nav-item ">
        <a class="nav-link " href="perfil.jsp">Perfil <span class="sr-only"></span></a>
      </li>
      
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
      <li class="nav-item active">
        <a class="nav-link" href="record.jsp">Récords</a>
      </li>
    </ul>
  </div>
</nav>


<br>
<div class="titulo">
  Récords

</div>
<br>
<div class="contenido">
  <table class="table table-striped table-hover">
  <thead ">
    <tr class="bg-info">
      <th scope="col">#</th>
      <th scope="col">Nombre del cuestionario</th>
      <th scope="col">Fecha de aplicación</th>
      <th scope="col">Grupo Aplicado</th>
      <th scope="col">Promedio de grupo</th>
      <th scope="col">Puntuación más alta</th>
      <th scope="col">Ver cuestionario</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-info">
      <th scope="row">1</th>
      <td>Cuestionario Historia v.1</td>
      <td>28 de octubre de 2017</td>
      <td>2°A</td>
      <td>8.7</td>
      <td>Armando Reyes</td>
      
      <td><button class="btn btn-info">ver</button></td>

    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Cuestionario Historia v.1</td>
      <td>28 de octubre de 2017</td>
      <td>2°B</td>
      <td>8.9</td>
      <td>Sofía Sánchez</td>
      
      <td><button class="btn btn-info">ver</button></td>

    </tr>
    <tr class="table-info">
      <th scope="row">3</th>
      <td>Cuestionario Español v.1</td>
      <td>08 de julio de 2017</td>
      <td>1°C</td>
      <td>9.6</td>
      <td>Lucía Rodríguez</td>
      
      <td><button class="btn btn-info">ver</button></td>

    </tr>
    <tr >
      <th scope="row">4</th>
      <td>Cuestionario Español v.2</td>
      <td>10 de julio de 2017</td>
      <td>1°C</td>
      <td>9.2</td>
      <td>Lucía Rodríguez</td>
      
      <td><button class="btn btn-info">ver</button></td>

    </tr>
  </tbody>
</table>

</div>



</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>
