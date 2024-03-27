import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';
import 'package:project_library/widgets/card/section_card.dart';
// Importa tus otros archivos y paquetes necesarios aquí

class ResponsiveCardLayout extends StatelessWidget {
  final List<CardSection> cardSections; // Define cardSections como un parámetro requerido

  const ResponsiveCardLayout({
    Key? key,
    required this.cardSections, // Marca cardSections como requerido
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      // Aquí se asume que cardSections tiene al menos 3 elementos
      // Asegúrate de manejar los casos donde pueda tener menos
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: cardSections[0]),
              UISizedBox.gapW20, // Asume que UISizedBox es un widget personalizado para espaciado
              Expanded(child: cardSections[1]),
            ],
          ),
          const SizedBox(height: 16), // Espacio vertical después de la fila
          if (cardSections.length > 2) Center(child: cardSections[2]), // Verifica si hay más de 2 elementos
        ],
      );
    } else if (ResponsiveBreakpoints.isTablet(context) || ResponsiveBreakpoints.isDesktop(context)) {
      List<Widget> rowChildren = [];
      for (int i = 0; i < cardSections.length; i++) {
        rowChildren.add(Expanded(child: cardSections[i]));
        if (i < cardSections.length - 1) {
          rowChildren.add(UISizedBox.gapW20); // Espaciador entre elementos
        }
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      );
    } else {
      return Container(); // Caso por defecto, se puede manejar de otra manera si es necesario
    }
  }
}
