import 'package:after_layout/after_layout.dart';
import 'package:clase5/destination_view.dart';
import 'package:clase5/destination.dart';
import 'package:clase5/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage>, AfterLayoutMixin<HomePage> {
  int _currentIndex = 0;
  @override
  void afterFirstLayout(BuildContext context) {
    showTutorial();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: crearVistas()
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: crearItems()
      ),
    );
  }
  List<BottomNavigationBarItem> crearItems(){
    List<BottomNavigationBarItem> items = List<BottomNavigationBarItem>();
    for(Destination destination in allDestinations){
      items.add(
        BottomNavigationBarItem(
          icon: Icon(destination.icon),
          backgroundColor: destination.color,
          title: Text(destination.title)
        )
      );
    }
    return items;
  }
  List<DestinationView> crearVistas(){
    List<DestinationView> vistas = List<DestinationView>();
    for(Destination destination in allDestinations){
      vistas.add(
        DestinationView(destination: destination)
      );
    }
    return vistas;
  }
  void showTutorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool estadoTutorial = prefs.getBool('tuto') ?? true;
    if(estadoTutorial){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => alert1(context, prefs)
      );
    }
  }
}