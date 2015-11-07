<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Estadisticas</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
                ${demo.css}
		</style>
                <style type="text/css">
                    .R_div1
                    {
                        position: absolute;
                        cursor: pointer;
                        top: 80%;
                        left: 90%
                    }
                    .lbl
                    {
                        font-family: Verdana;
                        cursor: pointer;
                        color: darkgray;
                        font-weight: bold;
                    }
                </style>
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        title: {
            text: 'Tasa de donación por millón de habitantes',
            x: -20 //center
        },
        subtitle: {
            text: 'Fuente: Sistema informático del registro nacional de transplantes, CENATRA',
            x: -20
        },
        xAxis: {
            categories: ['2006', '2007', '2008', '2009', '2010', '2011',
                '2012','2013']
        },
        yAxis: {
            title: {
                text: 'Millones de Habitantes'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Donación Renal de Donador Vivo',
            data: [13.95, 14.44, 15.25, 16.45, 16.87, 17.5, 17.3, 16.66]
        }, {
            name: 'Donación con Paro Cardiaco Irreversible',
            data: [3.17, 4.61, 5.22, 6.03, 7.13, 7.87, 10.13, 9.76]
        }, {
            name: 'Donación Con Muerte Encefálica',
            data: [3.06, 3.26, 3.01, 2.81, 2.91, 3.22, 3.62, 3.72]
        }]
    });
});
		</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<p align=center><a href="MayoresDonadores.html"><img src="Recursos/link1.png"></a><a href="TasaDonacion.jsp"><img src="Recursos/link2.png"></a><a href="TransplanteRenal.html"><img src="Recursos/link3.png"></a></p>
	<div align="right" class="R_div1" onclick="parent.frames[4].location.href='Menu.jsp';">
            <img src="Recursos/corazon.png" width="50px" height="50px" align="center"><br>
            <label class="lbl">Regresar</label>
        </div>
        </body>
</html>
