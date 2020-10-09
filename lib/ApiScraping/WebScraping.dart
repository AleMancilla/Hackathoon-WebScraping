// import 'package:flutter/material.dart';s
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class ModeloLaRazon{
  String imageURL;
  String title;
  String description;
  String date;

  ModeloLaRazon({this.imageURL, this.title, this.description, this.date});

  @override
  String toString() {
    String dato = """
      ${this.imageURL},
      ${this.title},
      ${this.description},
      ${this.date},
    """;
    return dato;
  }
}
class LaRazon{
  LaRazon();


  Future<List<ModeloLaRazon>>  getData()async{
    var url = 'https://www.la-razon.com/nacional/page/1/';
    var response = await http.get(url);


    dom.Document document = parser.parse(response.body);

    final mainclass = document.getElementsByClassName("col-12 col-lg-12 lr-latest lr-article-block article-sm");
    final mainclassPrimero = document.getElementsByClassName("col-12 col-lg-12 lr-latest lr-article-block article-md");
    // print(mainclass);


  



    List<ModeloLaRazon> listaDatos = new List();
    listaDatos = mainclass.map((e) {
      String title =  e.getElementsByClassName("title")[0].innerHtml;
      
      String description =  e.getElementsByClassName("excerpt d-none d-lg-block")[0].innerHtml;

      String date =  e.querySelectorAll("span.date> a")[0].innerHtml;
      
      
      String imageNoticia = (e.getElementsByClassName("background-holder")[0].innerHtml);
      String imageURL ;
      try {
        int indexInicio =imageNoticia.indexOf("http");
        int indexFin =imageNoticia.lastIndexOf(".jpg")+4;

        imageURL =  imageNoticia.substring(indexInicio,indexFin);
      
      } catch (e) {
        imageURL = "No cargo a tiempo";
        print(e);
      }

      ModeloLaRazon modelo = ModeloLaRazon(
        imageURL: imageURL,
        title: title,
        description: description,
        date: date
      );
      return modelo;
    }).toList();

    String listaTitle ;
    String listaDescripcion ;
    String listaImgages ;
    String listaFechas ;

    listaTitle = mainclassPrimero[0].getElementsByClassName("title")[0].innerHtml;
    listaDescripcion = mainclassPrimero[0].getElementsByClassName("excerpt d-none d-lg-block")[0].innerHtml;
    String imageNoticia = mainclassPrimero[0].getElementsByClassName("background-holder")[0].innerHtml;
    String imageURL ;
    try {
      int indexInicio =imageNoticia.indexOf("http");
      int indexFin =imageNoticia.lastIndexOf(".jpg")+4;

      imageURL =  imageNoticia.substring(indexInicio,indexFin);
    
    } catch (e) {
      imageURL = "No cargo a tiempo";
      print(e);
    }
    listaImgages = imageURL;
    listaFechas = mainclassPrimero[0].querySelectorAll("span.date> a")[0].innerHtml;
    
    ModeloLaRazon modelo = ModeloLaRazon(
        imageURL: listaImgages,
        title: listaTitle,
        description: listaDescripcion,
        date: listaFechas
      );
    
    listaDatos = [modelo,...listaDatos];

    print(listaDatos);
    return listaDatos;
  
  }
}