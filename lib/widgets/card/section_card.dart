import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;

  const CardSection({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color backgroundColor = isActive ? primaryColor : Colors.white;
    Color contentColor = isActive ? Colors.white : primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isActive
            ? []
            : [
                BoxShadow(
                  color: primaryColor,
                  spreadRadius: 0.4,
                  blurRadius: 8,
                  offset: const Offset(0, 8), // changes position of shadow
                ),
              ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: contentColor),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: contentColor),
          ),
        ],
      ),
    );
  }
}
