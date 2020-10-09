import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_scraping/Pages/HomePage.dart';
import 'package:web_scraping/Provider/ProviderLaRazon.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) =>ProviderLaRazon(),),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage()
      ),
    );
  }
}