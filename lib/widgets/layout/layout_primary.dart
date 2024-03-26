import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/padding_responsive.dart';

class LayoutPrimary extends StatelessWidget {
  final Widget child;

  const LayoutPrimary({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Usa ResponsivePadding para obtener el padding horizontal
    double horizontalPadding = ResponsivePadding.getHorizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: child,
    );
  }
}
