import 'package:clase5/buscar_cursos.dart';
import 'package:clase5/destination.dart';
import 'package:clase5/model/curso.dart';
import 'package:flutter/material.dart';

class DestinationView extends StatefulWidget {
  
  final Destination destination;

  const DestinationView({
    this.destination 
  });
  
  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  String titulo = "";
  IconData icono;
  MaterialColor color;
  @override
  void initState() { 
    titulo = widget.destination.title;
    icono = widget.destination.icon;
    color = widget.destination.color;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$titulo'),
        backgroundColor: color,
        centerTitle: true,
      ),
      //backgroundColor: widget.destination.color[100],
      body: Container(
        margin: EdgeInsets.all(20),
        child: widget.destination.title == "Explorar" ? BuscarCursos(cursos: crearCursos()):Container(),
      )
    );
  }
  List<Curso> crearCursos(){
    List<Curso> cursos = List<Curso>();
    List<String> cursosStr = ["Flutter", "Intro a HTML", "Android", "Fundamentos de programación", "Mi primer skill con Alexa",
                        "Inglés Básico", "Angular 10"];
    int codigo = 0;
    for(String cursoStr in cursosStr){
      cursos.add(
        Curso(
          codigo: codigo.toString(),
          nombre: cursoStr
        )
      );
    }
    return cursos;
  }

}