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
    .act{
  box-shadow: 0 5px 0 0  #39f;
}
  </style>
  <script type="text/javascript">
    function editar(idbtn){
      var btn=document.getElementById(idbtn);
      var preg=document.getElementById(idbtn+"P"), 
            res=document.getElementById(idbtn+"R"),
            res1=document.getElementById(idbtn+"R1"),
            res2=document.getElementById(idbtn+"R2"),
            res3=document.getElementById(idbtn+"R3");

            if(btn.innerHTML=="editar"){
            preg.innerHTML="<input type='text' name='"+idbtn+"p1P' id='"+idbtn+"1P' value='"+preg.innerHTML+"' />";
            res.innerHTML="<input type='text' name='"+idbtn+"p1R' id='"+idbtn+"1R' value='"+res.innerHTML+"' />";
            res1.innerHTML="<input type='text' name='"+idbtn+"p1R1' id='"+idbtn+"1R1' value='"+res1.innerHTML+"' />";
            res2.innerHTML="<input type='text' name='"+idbtn+"p1R2' id='"+idbtn+"1R2' value='"+res2.innerHTML+"' />";
            res3.innerHTML="<input type='text' name='"+idbtn+"p1R3' id='"+idbtn+"1R3' value='"+res3.innerHTML+"' />";
            btn.innerHTML="hecho";
          }else{
            var pregv=document.getElementById(idbtn+"1P"), 
              resv=document.getElementById(idbtn+"1R"),
              res1v=document.getElementById(idbtn+"1R1"),
              res2v=document.getElementById(idbtn+"1R2"),
              res3v=document.getElementById(idbtn+"1R3");

            preg.innerHTML=pregv.value;
            res.innerHTML=resv.value;
            res1.innerHTML=res1v.value;
            res2.innerHTML=res2v.value;
            res3.innerHTML=res3v.value;
            btn.innerHTML="editar";

          }

    }


  </script>
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
      
      <li class="nav-item dropdown active act">
        <a class="nav-link dropdown-toggle" href="#" id="cuest" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          
          Cuestionarios
        </a>
        <div class="dropdown-menu" aria-labelledby="cuest">
          <a class="dropdown-item" href="nuevoCuestionario.jsp">Crear cuestionario nuevo</a>
          <a class="dropdown-item active" href="verCuestionario.jsp">Consultar cuestionarios existentes</a>
          <a class="dropdown-item" href="aplciarCuestionario.jsp">Aplicar Cuestionario</a>
        </div>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="record.html">Récords</a>
      </li>
    </ul>
  </div>
</nav>


<br>
<div class="titulo">
Cuestionario Historia v.1
</div>
<br>
<div class="contenido">
  <table class="table table-striped table-hover">
  <thead ">
    <tr class="bg-info">
      <th scope="col">#</th>
      <th scope="col">Pregunta</th>
      <th scope="col">Respuesta correcta</th>
      <th scope="col">Respuesta incorrecta 1</th>
      <th scope="col">Respuesta incorrecta 2</th>
      <th scope="col">Respuesta incorrecta 3</th>
      <th scope="col">Editar</th>
      <th scope="col">Eliminar</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-info">
      <th scope="row">1</th>
      <td id="p1P">¿Quién descubrió América?</td>
      <td id="p1R">Cristobal Colón</td>
      <td id="p1R1">Dante Alighieri</td>
      <td id="p1R2">Napoleón Bonaparte</td>
      <td id="p1R3">Nicolás Maquiavelo</td>
      <td><button class="btn btn-info" id="p1" onclick="editar(this.id)">editar</button></td>
      <td><button class="btn btn-danger">eliminar</button></td>

    </tr>
    <tr>
      <th scope="row">2</th>
      <td id="p2P">¿En que año inició la revolución mexicana?</td>
      <td id="p2R">1910</td>
      <td id="p2R1">1810</td>
      <td id="p2R2">1528</td>
      <td id="p2R3">1912</td>
      <td ><button class="btn btn-info" id="p2" onclick="editar(this.id)">editar</button></td>
      <td><button class="btn btn-danger">eliminar</button></td>

    </tr>
    <tr class="table-info">
      <th scope="row">3</th>
      <td id="p3P" >¿Quién fundó la ciudad de Alejandría?</td>
      <td id="p3R" >Alejandro Magno</td>
      <td id="p3R1" >Alejandra de Olimpia</td>
      <td id="p3R2" >Alejandro de Macedonia</td>
      <td id="p3R3" >Alejandro de Epiro</td>
      <td><button class="btn btn-info" id="p3" onclick="editar(this.id)">editar</button></td>
      <td><button class="btn btn-danger">eliminar</button></td>

    </tr>
    <tr >
      <th scope="row">4</th>
      <td id="p4P">¿Quién es el dios Egpcio del Sol?</td>
      <td id="p4R"  >Ra</td>
      <td id="p4R1" >Osiris</td>
      <td id="p4R2" >Anubis</td>
      <td id="p4R3" >Sedth</td>
      <td><button class="btn btn-info" id="p4" onclick="editar(this.id)">editar</button></td>
      <td><button class="btn btn-danger">eliminar</button></td>

    </tr>
  </tbody>
</table>

</div>



</body>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</html>
