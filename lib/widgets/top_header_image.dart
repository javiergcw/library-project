import 'package:flutter/material.dart';

class TopHeaderImage extends StatelessWidget {
  final Color containerColor;
  final Color semicircleColor;
  final double height;

  const TopHeaderImage({
    Key? key,
    required this.containerColor,
    required this.semicircleColor,
    this.height = 300.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: containerColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter, // Alinea el semicírculo en la parte superior interna del contenedor
            child: CustomPaint(
              size: Size(double.infinity, height / 2), // Tamaño ajustado para el semicírculo
              painter: _SemicirclePainter(color: semicircleColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _SemicirclePainter extends CustomPainter {
  final Color color;

  _SemicirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Dibujo del semicírculo con la curvatura hacia arriba
    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2, size.height * -0.5, // Punto de control ajustado para la curva hacia arriba
        size.width, size.height,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
