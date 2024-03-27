import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String link;
  final IconData icon; // Nuevo campo para el ícono

  MenuItem({
    required this.title,
    required this.link,
    required this.icon, // Requiere que se pase un ícono al crear el objeto
  });
}
