import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

double getTextSize(BuildContext context) {
  if (ResponsiveBreakpoints.isMobile(context)) {
    return 20.0;
  } else if(ResponsiveBreakpoints.isTablet(context)) {
    return 25.0;
  } else if (ResponsiveBreakpoints.isDesktop(context)) {
    return 30.0;
  } else {
    return 20.0; // Valor por defecto
  }
}
