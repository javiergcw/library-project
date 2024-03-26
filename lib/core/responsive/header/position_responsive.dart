import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

class ResponsivePositioning {
  static double topMainTitle(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return 60; // Menor espacio para móviles
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return 40; // Espacio intermedio para tablets
    } else {
      return 50; // Espacio original para escritorio
    }
  }

  static double leftMainTitle(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return 20; // Ajuste para móviles
    } else {
      return 50; // Valor original para tablet y escritorio
    }
  }

  static double topRightWidgets(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return 10; // Ajuste para más cerca del top en móviles
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return 20; // Posición intermedia para tabletas
    } else {
      return 30; // Posición más baja para escritorio
    }
  }

  static double rightWidgets(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return 20; // Ajuste para móviles
    } else {
      return 50; // Valor original para tablet y escritorio
    }
  }
}
