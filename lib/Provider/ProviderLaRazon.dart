import 'package:flutter/cupertino.dart';
import 'package:web_scraping/ApiScraping/WebScraping.dart';

class ProviderLaRazon with ChangeNotifier{
  List<ModeloLaRazon> _listaDatos = new List();

  List<ModeloLaRazon> get listaDatos => this._listaDatos;

  set listaDatos (List<ModeloLaRazon> lista){
    this._listaDatos = lista;
    notifyListeners();
  }
}