import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget alert1(BuildContext context, SharedPreferences ref){
    return Material(
       color: Colors.black.withOpacity(0.6),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                crearCard(
                  context, "Principal",
                  "Encuentra las últimas novedades", 
                  "Siguiente",
                  50, 50, 50, 60,
                  () {
                    if(ref != null) ref.setBool('tuto', false);
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder:(context) => alert2(context)
                    );
                  }, TextAlign.center, ref
                ),
                imagen(
                  "assets/img/asistente.png", 
                  100, 100
                ),
                imagen(
                  "assets/img/home.png", 
                  100, 50
                ),
              ],
           )
         )
       ),
    );
  }
  Widget alert2(BuildContext context){
    return Material(
       color: Colors.black.withOpacity(0.6),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                crearCard(
                  context, "Explorar",
                  "Encuentra cursos en línea", 
                  "Siguiente",
                  50, 50, 0, 0,
                  (){
                    Navigator.of(context).pop();
                    /*showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder:(context) => alert3(context)
                    );*/
                  }, TextAlign.center, null
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width* 0.25, top: 20),
                      child: imagen(
                        "assets/img/asistente.png", 
                        100, 100
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width* 0.25, top: 20),
                  child: imagen(
                    "assets/img/explorar.png", 
                    100, 50
                  ),
                )
              ],
           )
         )
       ),
    );
  }
  Widget imagen(String direccion, double width, double height){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(direccion)
        ),
      )
    );
  }
  Widget crearCard(BuildContext context, String titulo, String contenido, String textoBoton, 
    double left, double right, double bottom, double top, VoidCallback funcion, TextAlign alineacion, SharedPreferences ref){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left:left, right: right, bottom: bottom, top: top),
      child: Column(
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
              InkWell(
                highlightColor: Theme.of(context).primaryColor,
                onTap: ()=> Navigator.of(context).pop(), 
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      if(ref != null) ref.setBool('tutorial', false);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              contenido,
              maxLines: 8,
              textAlign: alineacion,
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom:10.0, top: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: FlatButton(
              onPressed: funcion,
              child: Text(
                textoBoton,
                style: TextStyle(color: Colors.white) 
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).primaryColor,
            ),
          )
        ]
      ),
    );
  }