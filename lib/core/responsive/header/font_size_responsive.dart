import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/breakpoints/breakpoints.dart';

double getResponsiveFontSize(
  BuildContext context, {
  double small = 20,
  double medium = 38,
  double large = 48,
}) {
  if (ResponsiveBreakpoints.isMobile(context)) {
    return small;
  } else if (ResponsiveBreakpoints.isTablet(context)) {
    return medium;
  } else {
    return large;
  }
}
