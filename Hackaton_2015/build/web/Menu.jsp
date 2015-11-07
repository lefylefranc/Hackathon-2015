
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            .contenedor
            {
                position: absolute;
                left: 20%;
            }
            .div1
            {
                position: absolute;
                width: 150px;
                height: 175px;
                left: 10px;
                top: 30px;
                cursor: pointer;
            }
            .div1 img
            {
                max-height: 100%;
                max-width: 100%;
            }
            .div2
            {
                position: absolute;
                width: 150px;
                height: 175px;
                left: 200px;
                top: 30px;
                cursor: pointer;
            }
            .div2 img
            {
                max-height: 100%;
                max-width: 100%;
            }
            .div3
            {
                position: absolute;
                width: 150px;
                height: 175px;
                left: 390px;
                top: 30px;
                cursor: pointer;
            }
            .div3 img
            {
                max-height: 100%;
                max-width: 100%;
            }
            .div4
            {
                position: absolute;
                width: 150px;
                height: 175px;
                left: 100px;
                top: 240px;
                cursor: pointer;
            }
            .div4 img
            {
                max-height: 100%;
                max-width: 100%;
            }
            .div5
            {
                position: absolute;
                width: 150px;
                height: 175px;
                left: 290px;
                top: 240px;
                cursor: pointer;
            }
            .div5 img
            {
                max-height: 100%;
                max-width: 100%;
            }
            label
            {
                cursor: pointer;
                color: darkgrey;
                font-family: Verdana;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div align='center' id='contenedor' class='contenedor'>
        <div id="div1" class='div1' onclick="parent.frames[4].location.href='cuerpo.jsp';">
            <img src='Recursos/corazon.png'/>
            <label>Interactuar</label>
        </div>
        <div id="div2" class='div2' onclick="parent.frames[4].location.href='registroDonador.jsp';">
            <img src='Recursos/pulmones.png'/>
            <label>Sé un Héroe</label>
        </div>
        <div id="div3" class='div3' onclick="parent.frames[4].location.href='MayoresDonadores.html';">
            <img src='Recursos/rinones.png'/>
            <label>¿Sabías que...?</label>
        </div>
        <div id="div4" class='div4' onclick="parent.frames[4].location.href='Razones.html';">
            <img src='Recursos/huesos.png'/>
            <label>¿Por qué donar?</label>
        </div>
        <div id="div5" class='div5' onclick="parent.frames[4].location.href='CENATRA.html';">
            <img src='Recursos/intestinos.png'/>
            <label>¿Qué es el CENATRA?</label>
        </div>
        </div>
    </body>
</html>
