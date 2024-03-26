import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/core/responsive/section/icon_size_responsive.dart';
import 'package:project_library/core/responsive/section/text_size_responsive.dart';

class CardSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;

  const CardSection({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color backgroundColor = isActive ? primaryColor : Colors.white;
    Color contentColor = isActive ? Colors.white : primaryColor;

    double iconSize = getIconSize(context);
    double textSize = getTextSize(context);

    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive
            ? []
            : [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: contentColor,
              size: iconSize, // Ajustando el tamaño del ícono
            ),
            Text(
              title,
              style: TextStyle(
                color: contentColor,
                fontSize: textSize, // Ajustando el tamaño del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
