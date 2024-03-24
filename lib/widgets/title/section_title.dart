import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;

  const SectionTitle({
    Key? key,
    required this.icon,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: textStyle.color),
        UISizedBox.gapH8,
        Text(text, style: textStyle),
      ],
    );
  }
}
