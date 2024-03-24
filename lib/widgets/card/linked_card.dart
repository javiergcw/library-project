import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';

class LinkedCard extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final String firstOption;
  final String secondOption;
  final void Function()? onTap;

  const LinkedCard({
    required this.title,
    required this.titleStyle,
    required this.firstOption,
    required this.secondOption,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<LinkedCard> createState() => _LinkedCardState();
}

class _LinkedCardState extends State<LinkedCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 200), // Duración de la animación
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: widget.titleStyle.color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              UISizedBox.gapW8,
              Text(widget.title, style: widget.titleStyle),
              const Spacer(),
              _buildOptionContainer(
                  widget.firstOption, Colors.grey, Colors.grey),
              UISizedBox.gapW8,
              _buildOptionContainer(
                  widget.secondOption, Colors.grey, Colors.white),
              UISizedBox.gapW8,
              Icon(Icons.arrow_forward_ios, color: widget.titleStyle.color),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionContainer(
      String text, Color borderColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: textColor == Colors.white ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
      ),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
