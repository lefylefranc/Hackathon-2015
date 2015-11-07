
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.imagen"%>
<%@ page import="java.util.*,java.text.*,java.awt.*,java.net.*,java.io.*" %>
<%@ page import="net.glxn.qrgen.QRCode"%>
<%@ page import="net.glxn.qrgen.image.ImageType"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.io.FileOutputStream,java.io.IOException" %>
<%@ page import="com.lowagie.text.pdf.PdfPTable" %>
<%@ page import="com.lowagie.text.pdf.PdfPCell" %>
<%@ page import="com.lowagie.text.Document" %>
<%@ page import="com.lowagie.text.DocumentException" %>
<%@ page import="com.lowagie.text.Image" %>
<%@ page import="com.lowagie.text.Paragraph" %>
<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
<%@ page import="com.lowagie.text.Font" %>
<%@ page import="com.lowagie.text.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            .R_div1
            {
                position: absolute;
                cursor: pointer;
                top: 80%;
                left: 92%
            }
            .lbl
            {
                cursor: pointer;
                color: darkgray;
                font-weight: bold;
            
            }
            p
            {
                color: darkgray;
                font-family: Verdana;
                font-weight: bold;
                font-size: 16px;
            }
        </style>
        <title>JSP Page</title>
        <%
            
            String nombre= request.getParameter("nombre");
            String apPat= request.getParameter("apPaterno");
            String apMat= request.getParameter("apMaterno");
            String edad= request.getParameter("edad");
            String sexo= request.getParameter("sexo");
            String telCasa = request.getParameter("telCasa");
            String telCel = request.getParameter("telCel");
            String tipoSangre = request.getParameter("_grpSanguineo");
            String calle =  request.getParameter("calle");
            String colonia =  request.getParameter("colonia");
            String municipio = request.getParameter("municipio");
            String estado = request.getParameter("_estado");
            String telAccidente = request.getParameter("telAccidente");
            String opcDonar= request.getParameter("opcdonar");
            String foto = request.getParameter("datosFoto");
            foto=foto.substring(foto.indexOf(",")+1);
            imagen.getImagen(foto);
            String valoresOrganos="";
            String [] organos= request.getParameterValues("organos");
            
            if(organos!=null && organos.length>0)
            {
                for(int i=0;i<organos.length;i++)
                {
                    valoresOrganos+="\n"+organos[i];
                    System.out.println(valoresOrganos);
                }
            }else{System.out.println("No entra");}
            
            
            
    Document documento = new Document(PageSize.LETTER,50,50,50,50);
    PdfWriter wri = PdfWriter.getInstance(documento, new FileOutputStream("C:/Users/Aldo/Documents/PDFs/credencial"+nombre+".pdf"));
    Font tnr = new Font(Font.TIMES_ROMAN, 18, Font.BOLD,Color.BLUE);
    Font tnr2= new Font(Font.TIMES_ROMAN, 12, Font.BOLD,Color.GRAY);
    Font tnr3= new Font(Font.TIMES_ROMAN, 10, Font.NORMAL,Color.RED);
    Font tnr4= new Font(Font.TIMES_ROMAN, 10, Font.ITALIC);
    Font f1= new Font(Font.BOLD,14,Font.BOLD,Color.white);
    Font f2= new Font(Font.BOLD,10,Font.BOLD,Color.white);
    try
    {
      /* Se especifica el tipo MIME para salida en formato pdf */
       //response.setContentType("application/pdf");
      
      /* El objeto documento que se va a generar se vincula a un flujo de salida */
       //PdfWriter.getInstance(documento,response.getOutputStream());      

      documento.open();
      
/*****************/
/* Ruta relativa de la imagen */
//String relativeWebPath = "/images/tiburon.jpg";

/* Se obtiene la ruta absoluta a partir de la ruta relativa */


/* Se obtiene la imagen en base a la ruta absoluta */

/*Image im = Image.getInstance(absoluteDiskPath);

      out.println("<h2>"+absoluteDiskPath+"</h2>");
      im.scalePercent(30);
      im.setAbsolutePosition(20,660);
      documento.add(im);*/
String relativeWebPath1 = "Recursos\\PARTESUPERIOR.png";
String absoluteDiskPath1 = getServletContext().getRealPath(relativeWebPath1);
absoluteDiskPath1 = getServletContext().getRealPath(relativeWebPath1);
Image imgSup = Image.getInstance(absoluteDiskPath1); 
 imgSup.scalePercent(60);
      //imgSup.setAbsolutePosition(370,660);
String relativeWebPath2 = "Recursos\\PARTEINFERIOR.png";
String absoluteDiskPath2 = getServletContext().getRealPath(relativeWebPath2);
absoluteDiskPath2 = getServletContext().getRealPath(relativeWebPath2);
Image imgInf = Image.getInstance(absoluteDiskPath2); 
 imgInf.scalePercent(54);
      
      
      
String relativeWebPath = "Recursos\\imagen.png";
String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
Image imgfoto = Image.getInstance(absoluteDiskPath); 
      
      imgfoto.scalePercent(50);
      imgfoto.setAbsolutePosition(370,660);
      //documento.add(im2);

      documento.add(new Paragraph(" ---Parte frontal---\n\n",tnr2));
      PdfPTable tabla = new PdfPTable(3);
      PdfPCell superior= new PdfPCell(imgSup); superior.setColspan(3); superior.setBorder(0);
      tabla.addCell(superior);
      
      PdfPCell cfoto= new PdfPCell(imgfoto);  cfoto.setBorder(0);
      tabla.addCell(cfoto);
      PdfPCell cnombre= new PdfPCell(new Paragraph("\n      Yo: "+nombre+" "+apPat+" "+apMat)); cnombre.setColspan(2); cnombre.setBorder(0);
      cnombre.setVerticalAlignment(3);  tabla.addCell(cnombre);
      
      PdfPCell espacio= new PdfPCell(new Paragraph(""));  espacio.setBorder(0);
      tabla.addCell(espacio);
       PdfPCell ctexto= new PdfPCell(new Paragraph("Dono mis órganos para fines de trasplante al momento de mi muerte."+
                    "\nCon la esperanza de ayudar a salvar una vida.\n")); ctexto.setColspan(2); ctexto.setBorder(0);
      tabla.addCell(ctexto);
      
      PdfPCell inferior= new PdfPCell(imgInf);inferior.setBorder(0); inferior.setColspan(3);
      tabla.addCell(inferior);
      
      documento.add(tabla);
      documento.add(new Paragraph(" ---Parte trasera---\n\n",tnr2));
      
      PdfPTable tabla2 = new PdfPTable(3);
      PdfPCell superior2= new PdfPCell(new Paragraph("    COMUNIQUE SU DECISIÓN A FAMILIARES Y AMIGOS",f1)); 
      superior2.setColspan(3); superior2.setBorder(0); superior2.setBackgroundColor(Color.decode("#FE2E64"));
      tabla2.addCell(superior2);
      
      PdfPCell ctext2= new PdfPCell(new Paragraph("\nEn caso de un accidente llamar al teléfono:",f1)); 
      ctext2.setColspan(2); ctext2.setBorder(0); ctext2.setBackgroundColor(Color.decode("#FE2E64"));
      tabla2.addCell(ctext2); 
      PdfPCell cnumAcci= new PdfPCell(new Paragraph("\n"+telAccidente,f1)); 
      cnumAcci.setColspan(2); cnumAcci.setBorder(0); cnumAcci.setBackgroundColor(Color.decode("#FE2E64"));
      tabla2.addCell(cnumAcci); 
      
       PdfPCell ctqr= new PdfPCell(new Paragraph("\nEscanéa todos tus datos con este código:",f1)); 
      ctqr.setColspan(3); ctqr.setBorder(0); ctqr.setBackgroundColor(Color.decode("#FE2E64"));
      tabla2.addCell(ctqr); 
      
      String qrtext = "Nombre: "+nombre+apPat+apMat+"\n:Edad: "+edad+" Sexo:"+sexo+"\nTeléfonos: "+telCasa+" y "+telCel+
              "\nGrupo Sanguíneo: "+tipoSangre+"\nDomicilio: \n"+calle+","+colonia+","+municipio+","+estado+
              "Organos que desea donar:\n";
      if(opcDonar.equals("cualquier organo o tejido"))
      {
          qrtext+=opcDonar;
      }
      else{
              qrtext+=valoresOrganos;
              
      }
      
      
      
        ByteArrayOutputStream outStream = QRCode.from(qrtext).to(ImageType.PNG).stream();
        byte[] data = outStream.toByteArray();
        Image im0 = Image.getInstance(data);
        im0.scalePercent(60);
        im0.setAbsolutePosition(200,100);
        
         PdfPCell cimgQR=new PdfPCell(im0); 
      cimgQR.setColspan(3); cimgQR.setBorder(0); cimgQR.setBackgroundColor(Color.decode("#FE2E64"));
      tabla2.addCell(cimgQR); 
      
      documento.add(tabla2);
      /*PdfPTable tabla = new PdfPTable(5);
      tabla.addCell("NOMBRE:");
      PdfPCell nom= new PdfPCell(new Paragraph(nombre+" "+apPat+" "+apMat)); nom.setColspan(3);
      tabla.addCell(nom);
      tabla.addCell(im2);
          
      tabla.addCell("Edad:");
      tabla.addCell(edad);
      tabla.addCell("Sexo");
      tabla.addCell(sexo);
      tabla.addCell("");
      
      tabla.addCell("Teléfonos:");
      tabla.addCell(telCasa);
      tabla.addCell(telCel);
      tabla.addCell("");tabla.addCell("");
      
      tabla.addCell("Grupo Sanguíneo:");
      tabla.addCell(tipoSangre);
      tabla.addCell("");tabla.addCell("");tabla.addCell("");
      
      
      tabla.addCell("Domicilio:");
      PdfPCell dom= new PdfPCell(new Paragraph(calle+","+colonia+","+municipio+","+estado)); dom.setColspan(4);
      tabla.addCell(dom);
      documento.add(tabla);
      
      documento.add(new Paragraph("\n\n REVERSO\n\n",tnr));
      PdfPTable tabla2 = new PdfPTable(2);
      tabla2.addCell("En caso de accidente llamar al teléfono:");
      tabla2.addCell(telAccidente);
      tabla2.addCell("Con la esperanza de salvar vidas, dono:");
      tabla2.addCell(opcDonar);
      tabla2.addCell("Codigo QR:");
      PdfPCell codigo= new PdfPCell(new Paragraph(calle+","+colonia+","+municipio+","+estado)); dom.setColspan(4);
      
      String qrtext = "Nombre: "+nombre+"\nEdad: "+edad;
        ByteArrayOutputStream outStream = QRCode.from(qrtext).to(ImageType.PNG).stream();
        byte[] data = outStream.toByteArray();
        Image im0 = Image.getInstance(data);
        im0.scalePercent(150);
        im0.setAbsolutePosition(200,100);
        tabla2.addCell(im0);
       documento.add(tabla2);*/
      documento.close();

    }
    catch (DocumentException de)
    {
      out.println("m1"+de.getMessage());
    }
    catch (IOException ioe)
    {
      out.println("m2"+ioe.getMessage());
    }
    catch (Exception e)
    {
      out.println("m3"+e.getMessage()+e.getClass());
      e.printStackTrace();
    }

        %>
    </head>
    <body>
        <p>
            Credencial Generada Exitosamente.
        </p>
        <div align="right" class="R_div1" onclick="parent.frames[4].location.href='Menu.jsp';">
            <img src="Recursos/corazon.png" width="50px" height="50px" align="center"><br>
            <label class="lbl">Regresar</label>
        </div>
    </body>
</html>
