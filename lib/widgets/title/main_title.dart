import 'package:flutter/material.dart';
import 'package:project_library/core/responsive/header/font_size_responsive.dart';

class MainTitle extends StatelessWidget {
  final String first;
  final String secondary;

  const MainTitle({
    required this.first,
    required this.secondary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = getResponsiveFontSize(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          first,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: fontSize),
        ),
        Text(
          secondary,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
