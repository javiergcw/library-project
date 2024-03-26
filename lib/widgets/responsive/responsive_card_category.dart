import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';
import 'package:project_library/widgets/card/section_card.dart';

class ResponsiveCardLayout extends StatelessWidget {
  const ResponsiveCardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<CardSection> cardSections = [
      CardSection(
        icon: Icons.home,
        title: "Inicio",
        isActive: true,
      ),
      CardSection(
        icon: Icons.search,
        title: "Buscar",
        isActive: false,
      ),
      CardSection(
        icon: Icons.settings,
        title: "Ajustes",
        isActive: false,
      ),
    ];

    if (ResponsiveBreakpoints.isMobile(context)) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: cardSections[0]),
              UISizedBox.gapW20,
              Expanded(child: cardSections[1]),
            ],
          ),
          const SizedBox(height: 16), // Espacio vertical después de la fila
          Center(child: cardSections[2]),
        ],
      );
    } else if (ResponsiveBreakpoints.isTablet(context) ||
        ResponsiveBreakpoints.isDesktop(context)) {
      // Genera una lista de widgets con SizedBox entre cada CardSection
      List<Widget> rowChildren = [];
      for (int i = 0; i < cardSections.length; i++) {
        rowChildren.add(Expanded(child: cardSections[i]));
        if (i < cardSections.length - 1) {
          // Añade un SizedBox si no es el último elemento
          rowChildren.add(
            UISizedBox.gapW20,
          );
        }
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      );
    } else {
      return Container();
    }
  }
}
