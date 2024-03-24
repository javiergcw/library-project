import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';

class CardCategory extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final Color color; // Color personalizado que se usará cuando esté activo

  const CardCategory({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.color, // Requerimos el color para más flexibilidad
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isActive ? color : Colors.white;
    Color contentColor = isActive ? Colors.white : color;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive
            ? []
            : [
                BoxShadow(
                  color: color.withOpacity(
                      0.5), // Usamos el color proporcionado con transparencia para la sombra
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: contentColor),
          UISizedBox.gapW8,
          Text(
            title,
            style: TextStyle(
              color: contentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
