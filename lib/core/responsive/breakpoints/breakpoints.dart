import 'package:flutter/material.dart';

abstract class ResponsiveBreakpoints {
  // Define los breakpoints para móvil, tableta y escritorio
  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1024;
  // Métodos estáticos para verificar el tamaño del dispositivo
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tablet;
  }

  static bool isTablet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= tablet && width < desktop;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
}
