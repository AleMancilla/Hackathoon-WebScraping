import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_scraping/ApiScraping/WebScraping.dart';
import 'package:web_scraping/Provider/ProviderLaRazon.dart';
import 'package:web_scraping/Widgets/TargetNotice.dart';

class LaRazonPage extends StatefulWidget {
  @override
  _LaRazonPageState createState() => _LaRazonPageState();
}

class _LaRazonPageState extends State<LaRazonPage> {
  LaRazon datosLaRazon = LaRazon();
  ProviderLaRazon providerLaRazon ;

  @override
  void initState() {
    providerLaRazon = Provider.of(context,listen: false);
    cargarDatos();
    super.initState();
  }

  cargarDatos()async{

    providerLaRazon.listaDatos = await datosLaRazon.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ...generarListaNoticias(context),
            Container()
          ],
        ),
      ),
    );
  }

  generarListaNoticias(BuildContext context){
    ProviderLaRazon providerLaRazon = Provider.of(context);
    // int index = providerLaRazon.listaDatos.length;
    // print(" el index es  -------------------- $index");
    List<TargetNotice> listaTargetas = providerLaRazon.listaDatos.map((ModeloLaRazon e) {
      TargetNotice targetNotice = new TargetNotice(
        urlImage: e.imageURL, 
        title: e.title, 
        descripcion: e.description, 
        date: e.date);

        return targetNotice;
    }).toList();

    return listaTargetas;
  }
}