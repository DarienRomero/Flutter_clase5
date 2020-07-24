import 'package:clase5/model/curso.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class BuscarCursos extends StatefulWidget {
  List<Curso> cursos;
  BuscarCursos({
    this.cursos,
  });
  @override
  _BuscarCursosState createState() => _BuscarCursosState();
}

class _BuscarCursosState extends State<BuscarCursos> {
  @override
  Widget build(BuildContext context) {
    return buscadorCursos();
  }
  Widget buscadorCursos(){
    return SearchBar<Curso>(
      minimumChars: 1,
      hintText: "Encuentra un curso su nombre",
      cancellationWidget: Text("Borrar"),
      onError: (error) {
        return Center(
          child: Center(
            child: Text("Ha ocurrido un error, vuelve a intentarlo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54
              )
            ),
          ),
        );
      },
      emptyWidget: 
        Center(
          child: Text("No se encontró cursos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54
            )
          ),
      ),
      listPadding: EdgeInsets.symmetric(vertical: 10),
      onSearch: getAllCourses,
      onItemFound: (Curso curso, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          child: ListTile(
            leading: Icon(Icons.book),
            title: Text(curso.nombre),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              
            },
          ),
        );
      },
    );
  }
  Future<List<Curso>> getAllCourses(String texto){
    List<Curso> encontrados = List<Curso>();
    widget.cursos.forEach((Curso curso){
      if(removeDiacritics(curso.nombre.toLowerCase()).startsWith(removeDiacritics(texto.toLowerCase()))){
        encontrados.add(curso);
      }
    });
    /*widget.cursos.forEach((Curso curso) {
      if(removeDiacritics(curso.nombre.toLowerCase()).startsWith(removeDiacritics(texto.toLowerCase()))){
        encontrados.add(curso);
      }
    });*/
    return Future.value(encontrados);
  }
}