import 'package:flutter/material.dart';
class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Principal', Icons.home, Colors.teal),
  Destination('Explorar', Icons.search, Colors.cyan),
  Destination('Recursos', Icons.book, Colors.orange),
  Destination('Mi perfil', Icons.person, Colors.blue)
];