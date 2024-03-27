import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/core/responsive/header/curvature_responsive.dart';
import 'package:project_library/core/responsive/header/position_responsive.dart';
import 'package:project_library/data/models/menu_item.dart';
import 'package:project_library/widgets/button/hamburguer_button.dart';
import 'package:project_library/widgets/button/language_toggle_button.dart';
import 'package:project_library/widgets/title/main_title.dart';

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
          Positioned(
            top: ResponsivePositioning.topMainTitle(context),
            left: ResponsivePositioning.leftMainTitle(context),
            child: const MainTitle(
              first: 'Area de contenido',
              secondary: 'Guias de curriculum',
            ),
          ),
          Positioned(
            right: ResponsivePositioning.rightWidgets(context),
            top: ResponsivePositioning.topRightWidgets(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const LanguageToggleButton(),
                UISizedBox.gapH10,
                HamburguerButton(
                  menuItems: [
                    MenuItem(
                      title: 'Linkedin',
                      link:
                          'https://www.linkedin.com/in/javier-garcia-carrillo-301360240/',
                      icon: Icons.person,
                    ),
                    MenuItem(
                      title: 'Contactanos',
                      link: 'https://www.linkedin.com/in/javier-garcia-carrillo-301360240/',
                      icon: Icons.phone,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment
                .bottomCenter, // Alinea el semicírculo en la parte superior interna del contenedor
            child: CustomPaint(
              size: Size(double.infinity,
                  height / 2), // Tamaño ajustado para el semicírculo
              painter: _SemicirclePainter(
                color: semicircleColor,
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SemicirclePainter extends CustomPainter {
  final Color color;
  final BuildContext context; // Necesario para acceder a MediaQuery

  _SemicirclePainter({required this.color, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Obtiene el factor de curvatura basado en el tamaño de pantalla
    double curveHeightFactor =
        ResponsiveCurvature.getCurveHeightFactor(context);

    // Dibujo del semicírculo con ajuste de curvatura
    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * curveHeightFactor,
        size.width,
        size.height,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
