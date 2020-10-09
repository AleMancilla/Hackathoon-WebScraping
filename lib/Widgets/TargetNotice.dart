import 'package:flutter/material.dart';

class TargetNotice extends StatelessWidget {

  final String urlImage;
  final String title;
  final String descripcion;
  final String date;

  const TargetNotice({@required this.urlImage, @required this.title, @required this.descripcion, @required this.date}) ;

  

  @override
  Widget build(BuildContext context) {
    TextStyle estiloTitulo = TextStyle(fontWeight: FontWeight.bold,);
    TextStyle estiloDescripcion = TextStyle(fontWeight: FontWeight.w500,);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 150.0,
      decoration:BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),),
              child: Image.network(this.urlImage,fit: BoxFit.cover,height: double.infinity,)
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(this.title, style: estiloTitulo,),
                  Expanded(child: Text(this.descripcion, style: estiloDescripcion,)),
                  Row(
                    children: <Widget>[
                      Expanded(child: Container()),
                      Text(this.date)
                    ],
                  )
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}