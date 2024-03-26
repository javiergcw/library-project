import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

class ResponsivePadding {
  static double getHorizontalPadding(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return 20.0;
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return 50.0;
    } else if (ResponsiveBreakpoints.isDesktop(context)) {
      return 150.0;
    } else {
      return 16.0;
    }
  }
}
