import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

double getIconSize(BuildContext context) {
  if (ResponsiveBreakpoints.isMobile(context)) {
    return 40.0;
  } else if (ResponsiveBreakpoints.isTablet(context)) {
    return 50.0;
  } else if (ResponsiveBreakpoints.isDesktop(context)) {
    return 60.0;
  } else {
    return 40.0; // Valor por defecto
  }
}
