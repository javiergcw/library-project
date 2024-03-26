import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

class ResponsiveCurvature {
  static double getCurveHeightFactor(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return -0.2;
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return -0.4;
    } else {
      return -0.5;
    }
  }
}
