import 'package:flutter/material.dart';
import 'package:web_scraping/ApiScraping/WebScraping.dart';
import 'package:web_scraping/Pages/LaRazonPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  LaRazon datosLaRazon = LaRazon();

  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  // ProviderLaRazon providerLaRazon = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.blue,
                  child: Text("Dato"),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.blue,
                  child: Text("Dato"),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.blue,
                  child: Text("Dato"),
                ),
              ],
            ),
            Container(
               height: size.height - 100,
               width: size.width,
              child: PageView(
                controller: _controller,
                children: [
                  LaRazonPage(),
                  LaRazonPage(),
                  LaRazonPage(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            datosLaRazon.getData();
          },
        ),
      ),
    );
  }
}