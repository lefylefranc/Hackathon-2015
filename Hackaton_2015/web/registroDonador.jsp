<%-- 
    Document   : registroDonador
    Created on : 07-nov-2015, 9:28:29
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tomar fotos con Webcam</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
            function cambiarVisibilidad(id,estado)
            {
                document.getElementById(id).style.visibility = estado;
            }
            function ocultar()
            {
                cambiarVisibilidad("IMSS","hidden");
                cambiarVisibilidad("ISSSTE","hidden");
                cambiarVisibilidad("POPULAR","hidden");
                cambiarVisibilidad("l1","hidden");
                cambiarVisibilidad("l2","hidden");
                cambiarVisibilidad("l3","hidden");
                cambiarVisibilidad("l4","hidden");
                cambiarVisibilidad("l5","hidden");
                cambiarVisibilidad("numAfiliacion","hidden");
            }
            function mostar()
            {
                cambiarVisibilidad("IMSS","visible");
                cambiarVisibilidad("ISSSTE","visible");
                cambiarVisibilidad("POPULAR","visible");
                cambiarVisibilidad("l1","visible");
                cambiarVisibilidad("l2","visible");
                cambiarVisibilidad("l3","visible");
                cambiarVisibilidad("l4","visible");
                cambiarVisibilidad("l5","visible");
                cambiarVisibilidad("numAfiliacion","visible");
            }
        </script>
        <style type="text/css">
            html {
    background: white;
    height: 100%;
    font-family: verdana;
    //background: linear-gradient( #333, #000);
        }
        canvas {
            display: none;
        }
        video, img, #startbutton ,#btnGuardar{
            display: block;
            float: left;
            border: 3px solid #fff;
            border-color: #FACC2E;
            border-radius: 10px;
        }
        #startbutton {
            background: green;
            border: none;
            color: #fff;
            margin: 100px 20px 20px 20px;
            padding: 10px 20px;
            font-size: 20px;
        }
       *#container {
            overflow: hidden;
            width: 880px;
            margin: 20px auto;
        }
        
        
        
        input[type="text"],input[type="email"],input[type="date"],input[type="password"],input[type="number"],select{
        border:2px solid #456879;
	border-radius:6px;
        height: 22px;
        font:14px Verdana;
        }
        input[type="radio"]:checked{
        background-color: #ededed;
        border: 1px solid #ccc;
        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0 -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1), inset 0 0 10px rgba(0,0,0,0.1);
        }
        #btnGuardar {
            background: red;
            border: none;
            color: #fff;
            margin: 100px 20px 20px 20px;
            padding: 10px 20px;
            font-size: 20px;
        }
        #div1{
            border-radius: 22px 22px 22px 22px;
            -moz-border-radius: 22px 22px 22px 22px;
            -webkit-border-radius: 22px 22px 22px 22px;
            border: 1px solid #a60ec4;
            background:#a60ec4;
            width: 100%;
            color: white;
            
        }
        .R_div1
            {
                position: fixed;
                cursor: pointer;
                top: 80%;
                left: 90%;
                
            }
            .lbl
            {
                cursor: pointer;
                color: darkgray;
                font-weight: bold;
            
            }

        </style>
       
    </head>
    <body>
        
        <div  id="div1">
            <P ALIGN="center"><label>DATOS DEL DONANTE</label></P>
        </div>
        </br>
        <form name="datos" action="datosRegistro.jsp" method="post">
            
            <table cellspacing="5">
                <tr>
                    <td><label for="nombre">Nombre:</label></td>
                    <td><input type="text" name="nombre" placeholder="Nombre" required="required"></td>
                </tr> 
                <tr>
                    <td><label for="apPaterno">Apellido Paterno:</label></td>
                    <td><input type="text" name="apPaterno" placeholder="Apellido Paterno" required="required"></td>
                     <td><label for="apMaterno">Apellido Materno:</label></td>
                    <td><input type="text" name="apMaterno" placeholder="Apellido Materno" required="required"></td>
                </tr>
                <tr>
                    <td><label for="edad">Edad:</label></td>
                    <td><input type="number" name="edad" placeholder="Edad" required="required"></td>
                    <td><label for="sexo">Sexo:</label></td>
                    <td colspan="2">
                            <input type="radio" name="sexo" id="sexo" required="required" value="Femenino" checked="checked"/><label>F</label>

                            <input type="radio" name="sexo" id="sexo" required="required" value="Masculino"/><label>M</label>
                        </td>
                    
                </tr>
                <tr>
                    <td><label for="telCasa">Teléfono de casa:</label></td>
                    <td><input type="number" name="telCasa" placeholder="Telefono Casa" min="0000000000" max="9999999999" ></td>
                    <td><label for="telCel">Teléfono Celular:</label></td>
                    <td><input type="number" name="telCel" placeholder="Telefono Cel"  min="0000000000" max="9999999999" ></td>
                </tr>
                <tr>
                    <td><label for="grpSanguineo">Grupo Sanguíneo:</label></td>
                    <td> <select name="_grpSanguineo">
                            <option selected>--- Elige Grupo Sanguíneo ---</option>
                            <option value="A+">A+</option>
                            <option value="A-">A-</option>
                            <option value="O+">O+</option>
                            <option value="O-">O-</option>
                            <option value="B+">B+</option>
                            <option value="B-">B+</option>
                            <option value="AB+">AB+</option>
                            <option value="AB-">AB-</option>
                        
                        </select></td>
                </tr>
                <tr><td></td></tr>
                <tr><td><label for="domicilio">Domicilio:</label></td></tr>
                <tr>
                     <td><label for="calle">Calle:</label></td>
                    <td><input type="text" name="calle" placeholder="Calle" required="required"></td>
                    <td><label for="colonia">Colonia:</label></td>
                    <td><input type="text" name="colonia" placeholder="Colonia" required="required"></td>
                </tr>
                <tr>
                    <td><label for="municipio">Municipio:</label></td>
                    <td><input type="text" name="municipio" placeholder="Municipio" required="required"></td>
                    <td><label for="Estado">Estado:</label></td>
                     <td> <select name="_estado">
                             <option selected>--- Elige Estado ---</option>
                            <option value="Aguascalientes">Aguascalientes </option><option value="Baja California ">Baja California </option>
                            <option value="Baja California Sur ">Baja California Sur </option><option value="Campeche ">Campeche </option>
                            <option value="Chiapas ">Chiapas </option><option value="Chihuahua ">Chihuahua </option> <option value="Coahuila ">Coahuila </option>
                            <option value="Colima ">Colima </option><option value="Distrito Federal ">Distrito Federal </option>
                            <option value="Durango ">Durango  </option>  <option value="Estado de México ">Estado de México  </option>  <option value="Guanajuato ">Guanajuato </option>
                            <option value="Guerrero ">Guerrero  </option>  <option value="Hidalgo ">Hidalgo  </option>  <option value="Jalisco ">Jalisco  </option>
                            <option value="Michoacán ">Michoacán  </option>  <option value="Morelos ">Morelos  </option>  <option value="Nayarit">Nayarit </option>
                            <option value="Nuevo León ">Nuevo León  </option>  <option value="Oaxaca ">Oaxaca  </option>  <option value="Puebla ">Puebla </option>
                            <option value="Querétaro ">Querétaro </option><option value="Quintana Roo ">Quintana Roo </option><option value="San Luis Potosí ">San Luis Potosí </option>
                            <option value="Sinaloa ">Sinaloa </option><option value="Sonora ">Sonora </option><option value="Tabasco">Tabasco</option>
                            <option value="Tamaulipas">Tamaulipas</option><option value="Tlaxcala ">Tlaxcala </option><option value="Veracruz ">Veracruz </option>
                            <option value="Yucatan ">Yucatan </option><option value="Zacatecas ">Zacatecas </option>
                        
                        </select></td>
                    <tr>
                    
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td colspan="2"><label for="aviso">En caso de accidente avisar al teléfono:</label></td>
                    <td><input type="number" name="telAccidente" placeholder="Teléfono" required="required"  min="0000000000" max="9999999999"></td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td colspan="4"><label for="aviso"> Dono mis órganos para fines de trasplante al momento de mi muerte.</td>
                </tr>
                 <tr>
                    <td colspan="4"> Con la esperanza de ayudar a salvar una vida, dono:</td>
                </tr>
                <tr>
                    <td></td><td colspan="2"><input type="radio" name="opcdonar" id="opca" required="required" value="cualquier organo o tejido" checked="checked"/><label>a)Cualquier órgano o tejido</label><td></td>
                </tr>
                 <tr>
                    <td></td><td colspan="2"><input type="radio" name="opcdonar" id="opcb" required="required" value="Sólo los siguientes órganos o tejidos" checked="checked"/><label>b)Sólo los siguientes órganos o tejidos</label><td></td>
                </tr>
            </table>
            <br>
            <table cellspacing="15" >
                <tr>
                    <td><input type="checkbox" id="cornea" name="organos" value="Cornea"/><label>Córnea</label></td>
                     <td><input type="checkbox" id="piel" name="organos" value="Piel"/><label>Piel</label></td>
                      <td><input type="checkbox" id="huesos" name="organos" value="Huesos"/><label>Huesos</label></td>
                       <td><input type="checkbox" id="ligamentos" name="organos" value="Ligamentos"/><label>Ligamentos</label></td>
                </tr>
                 <tr>
                    <td><input type="checkbox" id="tendones" name="organos" value="Tendones"/><label>Tendones</label></td>
                     <td><input type="checkbox" id="riñones" name="organos" value="Riñones"/><label>Riñones</label></td>
                      <td><input type="checkbox" id="higado" name="organos" value="Higado"/><label>Higado</label></td>
                       <td><input type="checkbox" id="corazon" name="organos" value="Corazon"/><label>Corazón</label></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="pulmones" name="organos" value="Pulmones"/><label>Pulmones</label></td>
                     <td><input type="checkbox" id="pancreas" name="organos" value="Pancreas"/><label>Páncreas</label></td>
                      <td><input type="checkbox" id="intestino" name="organos" value="Intestino"/><label>Intestino</label></td>
                       <td><input type="checkbox" id="corazon" name="organos" value="Corazon"/><label>Corazón</label></td>
                </tr>
            </table>
            <br><br>
            <table cellspacing="5">
                <tr>
                    <td><label>¿Cuentas con algún tipo de Seguro Médico?</label></td>
                    <td colspan="2">
                        <input type="radio" name="seguro" id="segurosi" required="required" value="Si" onclick="mostar();"/><label>Si</label>
                            <input type="radio" name="seguro" id="segurono" required="required" value="No" checked="checked" onclick="ocultar();"/><label>No</label>
                    </td>
                </tr>
                <tr><td> </td></tr>
                <tr>
                    <td><label id="l1"> ¿Con qué Seguro Cuentas?</label></td>
                    <td colspan="2">
                            <input type="radio" name="tipoSeguro" id="IMSS" required="required" value="IMSS" checked="checked"/><label id="l2">IMSS</label>
                            <input type="radio" name="tipoSeguro" id="ISSSTE" required="required" value="ISSSTE"/><label id="l3">ISSSTE</label>
                            <input type="radio" name="tipoSeguro" id="POPULAR" required="required" value="POPULAR"/><label id="l4">SEGURO POPULAR</label>
                    </td>
                </tr>
                <tr><td> </td></tr>
                <tr>
                    <td><label id="l5">Escribe tu número de afiliación:</label></td>
                    <td><input type="number" id = "numAfiliacion" name="numAfiliacion" placeholder="Número Afiliación" </td>
                </tr>
                
                
            </table>
            <br><br>
            <table cellspacing="5" >
                <tr>
                    <td colspan="3"><label>Captura tu foto:</label></td>
                </tr>
                <tr>
                    <td></td><td></td><td><td><video id="video"></video></td>
                    <td><button id="startbutton">Tomar foto</button></td>
                    <td><canvas id="canvas"></canvas>
                    <img id="photo" name="photo" ></td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td colspan="3"> <input type="submit" id="btnGuardar" value="Guardar"></td>
                </tr>
            </table>
            <script>ocultar();</script>    
        </br></br>
            
        <input type="hidden" id="datosImagen" name="datosFoto"/>  
        </form>

        <script>
            (function() {

                var streaming = false,
                    video        = document.querySelector('#video'),
                    cover        = document.querySelector('#cover'),
                    canvas       = document.querySelector('#canvas'),
                    photo        = document.querySelector('#photo'),
                    startbutton  = document.querySelector('#startbutton'),
                    foto         = document.querySelector('#datosImagen'),
                    width = 200,
                    height = 0;

                navigator.getMedia = ( navigator.getUserMedia || 
                                       navigator.webkitGetUserMedia ||
                                       navigator.mozGetUserMedia ||
                                       navigator.msGetUserMedia);

                navigator.getMedia(
                  { 
                    video: true, 
                    audio: false 
                  },
                  function(stream) {
                    if (navigator.mozGetUserMedia) { 
                      video.mozSrcObject = stream;
                    } else {
                      var vendorURL = window.URL || window.webkitURL;
                      video.src = vendorURL ? vendorURL.createObjectURL(stream) : stream;
                    }
                    video.play();
                  },
                  function(err) {
                    console.log("An error occured! " + err);
                  }
                );

                video.addEventListener('canplay', function(ev){
                  if (!streaming) {
                    height = video.videoHeight / (video.videoWidth/width);
                    video.setAttribute('width', width);
                    video.setAttribute('height', height);
                    canvas.setAttribute('width', width);
                    canvas.setAttribute('height', height);
                    streaming = true;
                  }
                }, false);

                function takepicture() {
                  canvas.width = width;
                  canvas.height = height;
                  canvas.getContext('2d').drawImage(video, 0, 0, width, height);
                  var data = canvas.toDataURL('image/png');
                  photo.setAttribute('src', data);
                  foto.setAttribute('value', data);
                }

                startbutton.addEventListener('click', function(ev){
                    takepicture();
                  ev.preventDefault();
                }, false);

              })();
        </script>
        <div align="right" class="R_div1" onclick="parent.frames[4].location.href='Menu.jsp';">
            <img src="Recursos/corazon.png" width="50px" height="50px" align="center" style="border: 0px;"><br>
            <label class="lbl">Regresar</label>
        </div>
    </body>
</html>

