
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="Recursos/raphael-min.js"></script>
        <script type="text/javascript" src="Recursos/jquery.min.js"></script>
        <style>
            #orgtxt{
                width:450px;
                height:380px;
                background-color: transparent; 
                position: absolute;
                left: 30%;
                border-style: ridge;
                border-width: 4px; 
                -webkit-border-radius: 5px 10px;  /* Safari  */
                -moz-border-radius: 5px 10px;     /* Firefox */
                font-family: "Verdana";
                color: darkgray;
            }
            #lienzo{
                width:300px;
                height:500px;
                background-color: transparent; 
                position: absolute;
                right: 70%;
            }
            #home{
                width:10px;
                height:10px;
                background-color: transparent; 
                position: absolute;
                right: 10%;
                top: 80%;
            }
            p{
                margin: 20px;
            }
            body{
                font-family: "Verdana"
            }
            label
            {
                font-family: Verdana;
                color: darkgray;
                font-weight: bold;
            }
            a{
                text-decoration: none;
                
            }
            .lbl
            {
                cursor: pointer;
            }
            h3
            {
                font-family: Verdana;
                color: darkslategrey;
            }
            body
            {
                overflow: hidden;
            }
        </style>
    </head>
    <body>
        <h3>En esta sección podrás conocer más acerca de algunos organos que se pueden donar</h3>
        <hr/>
            <div id="orgtxt"  align="justify">
                
        </div>
        <div id="lienzo" align="left">
            <img id="loadingicon" src="Recursos/loading.gif" />
        </div>
        <div id="home" align="left">
                <a href="Menu.jsp" target="centro_centro"><img src="Recursos/corazon.png" width="50px" height="50px" align="center"/><label class='lbl'>Regresar</label></a>
        </div>
        <script>
            var corazon="<p>La donación de Corazón puede ser difícil. El Corazón debe ser donado "+
                    "por alguien que esté clinicamente muerto, pero que permanezca con soporte vital."+
                    " El donante de corazón debe ser lo más compatible posible con su tipo de tejido para "+
                   "reducir la probabilidad que su cuerpo lo vaya a rechazar</p> ";
           var intestino="<p>Los transplantes intestinales pueden efectuarse en aquellas personas que se encuentran en una fase final de fallo intestinal, es decir la mayor parte de su intestino ha sido dañado por una enfermedad o ha sido extraído quirúrgicamente. Ésto puede ocurrir en aquellas personas que tienen una Enfermedad Inflamatoria intestinal (EII) grave y sufren el llamado Síndome del intestino corto, que no les permite absorber los nutrientes necesarios. "+
                   "Normalmente se les alimenta mediante alimentación parenteral total, lo cual implica la inserción de un tubo en las venas, o directamente al estómago.</p>";
           var pulmon="<p>Un trasplante de pulmón es un procedimiento quirúrgico que se realiza para extirpar uno a ambos pulmones enfermos de un paciente"+
                   " y reemplazarlo por uno sano de otra persona. La mayoría de los pulmones que se trasplantan provienen de donantes de órganos fallecidos.</p>"+
                   "<p>Los adultos sanos y no fumadores compatibles pueden donar una parte (un lóbulo) de uno de sus pulmones en vida. Las personas que donan "+
                   "una parte del pulmón pueden vivir vidas saludables con el tejido pulmonar remanente.</p>";
           var higado="<p>Un trasplante de higado se puede donar por muerte cerebral. Algunas veces, una persona sana donará parte de su hígado a un paciente. "+
                   "Por ejemplo, uno de los padres puede donarle a un hijo. Este tipo de donante se conoce como donante vivo. El hígado puede regenerarse por sí solo. Ambas personas generalmente terminarán con su hígado funcionando bien después de un trasplante exitoso.</p>";
           var estomago="<p>Aunque hasta la fecha se ha hablado poco de este tipo de trasplante, han existido casos de trasplante del sistema digestivo completo.</p>";
           var esofago="<p>Aunque hasta la fecha se ha hablado poco de este tipo de trasplante, han existido casos de trasplante del sistema digestivo completo.</p>";
           var cuerpos="<p/><p>Por paro cardiaco y muerte cerebral se pude donar corneas, piel, huesos, ligamentos, tendones, válvulas cardíacas, vasos sanguíneos. </p>"+
                  "<p>En vida se puede donar sangre, médula ósea, hueso, duramadre y placenta, así como riñon.</p>"+
            "<p> Los implantes de hueso, básicamente se indican en pacientes que tienen destrucción ósea por trauma, accidentes de tránsito, lesiones por arma de fuego y en un grupo importante de pacientes que tienen destrucción ósea por patologías oncológicas, es el tipo de tejido que más se implanta.</p>";
            var municipios_data = {
                '01': 'Intestino Grueso  <p/>'+intestino,
                '02': 'Pulmón Derecho<p/>'+pulmon,
                '03': 'Higado<p/>'+higado,
                '04': 'Pulmón Izquierdo<p/>'+pulmon,
                '05': 'Intestino Delgado<p/>'+intestino,
                '06': 'Corazón <p/>'+corazon,
                '07': 'Estomago<p/>'+estomago,
                '08': 'undefined',
                '09': 'Esofago<p/>'+esofago,
                '10': 'undefined',
                '11': 'Esofago<p/>',
                '12': 'Cuerpo',
                '13': 'Cuerpo',
                '14': 'Cuerpo',
                '15': 'Cuerpo',
                '16': 'Cuerpo',
                '17': 'Cuerpo',
                '18': 'Cuerpo',
                '19': 'Cuerpo',
                '20': 'Cuerpo',
                '21': 'Cuerpo'
            };

            var default_attributes = {
                fill: '#F09F4F',
                stroke: '#000000',
                'stroke-width': 0
            };
            var undefined_attributes = {
                fill: '#ffffff',
                stroke: '#000000',
                'stroke-width': 0
            };
            var cuerpo_attributes = {
               fill: '#42ABE2',
                stroke: '#000000',
                'stroke-width': 0
            };
            var $orgtxt = $('#orgtxt');

            $.ajax({
                url: 'Recursos/organos.svg',
                type: 'GET',
                dataType: 'xml',
                success: function (xml) {
                    var rjs = Raphael('lienzo', 400, 600);
                    var corr = "";
                    $(xml).find('svg > g > path').each(function () {
                        $orgtxt.html("<p>Selecciona un organo</p>");
                        var path = $(this).attr('d');
                        var pid = $(this).attr('id');
                        var color=$(this).attr("fill");
                        var org = rjs.path(path);
                        if(municipios_data[pid]!=='undefined' && municipios_data[pid]!=='Cuerpo')
                        {org.attr(default_attributes);}
                        else if(municipios_data[pid]==='undefined'){
                           org.attr(undefined_attributes); 
                        }
                        else if(municipios_data[pid]==='Cuerpo'){
                            org.attr(cuerpo_attributes); 
                        }
                        org.hover(function () {
                            this.animate({fill: color});
                            var text = "<p> Organo: ";
                            if ((municipios_data[pid] !== 'undefined'))
                                // if(parte>=0&&parte<=11)
                                text += municipios_data[pid];
                            else {
                                text = "";
                                this.animate({fill: color});
                            }
                            //text += "(" + $(this).attr('id') + ")";
                            if(municipios_data[pid]!=='undefined'&& municipios_data[pid]!=='Cuerpo')
                                 $orgtxt.html(text);
                             else if(municipios_data[pid]==='Cuerpo')
                                 $orgtxt.html(text+cuerpos);
                        }, function () {
                            if(municipios_data[pid]!=='undefined'&& municipios_data[pid]!=='Cuerpo')
                                this.animate({fill: default_attributes.fill});
                            else if(municipios_data[pid]==='undefined')
                                org.attr(undefined_attributes); 
                            else if(municipios_data[pid]==='Cuerpo')
                                org.attr(cuerpo_attributes);
                            $orgtxt.html("<p>Selecciona un organo</p>");
                        }).click(function () {
                            alert("Click sobre el organo. ID = " + $(this).attr('id'));
                        });
                    });
                    $('#loadingicon').hide();
                }
            });

        </script>
    </body>
</html>
