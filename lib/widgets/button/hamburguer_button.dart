import 'package:flutter/material.dart';
import 'package:project_library/models/menu_item.dart';

class HamburguerButton extends StatefulWidget {
  final List<MenuItem> menuItems;

  const HamburguerButton({Key? key, required this.menuItems}) : super(key: key);

  @override
  HamburguerButtonState createState() => HamburguerButtonState();
}

class HamburguerButtonState extends State<HamburguerButton> {
  OverlayEntry? _overlayEntry;
  bool isExpanded = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void _toggleMenu(Color? color) {
    if (isExpanded) {
      _overlayEntry?.remove();
    } else {
      _overlayEntry = _createOverlayEntry(color);
      Overlay.of(context).insert(_overlayEntry!);
      // Añade los ítems al AnimatedList después de un breve retraso para permitir que el Overlay se renderice
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          widget.menuItems.asMap().forEach(
            (index, item) {
              _listKey.currentState?.insertItem(
                index,
                duration: const Duration(
                  milliseconds: 200,
                ),
              );
            },
          );
        },
      );
    }
    isExpanded = !isExpanded;
  }

  OverlayEntry _createOverlayEntry(
    Color? color,
  ) {
    var size = MediaQuery.of(context).size;
    var width =
        size.width > 600 ? 300 : size.width * 0.8; // Ajuste de ancho responsive

    return OverlayEntry(
      builder: (context) => Positioned(
        right: 20,
        top: 60, // Ajusta esta posición según sea necesario
        width: width.toDouble(), // Ancho del menú desplegable
        child: Material(
          elevation: 4.0,
          child: AnimatedList(
            key: _listKey,
            initialItemCount: 0, // Comienza con 0 y añade ítems dinámicamente
            shrinkWrap: true,
            itemBuilder: (context, index, animation) {
              final item = widget.menuItems[index];
              return SlideTransition(
                position: animation.drive(
                    Tween(begin: const Offset(1, 0), end: const Offset(0, 0))),
                child: ListTile(
                  title: Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color,
                        ),
                  ),
                  onTap: () {
                    _toggleMenu(color);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorPrimary = Theme.of(context).primaryColor;

    return Container(
      // Contenedor del botón de hamburguesa
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => _toggleMenu(colorPrimary), // Cambio realizado aquí
        child: Center(
          child: Icon(
            Icons.menu,
            color: colorPrimary,
            size: 24,
          ),
        ),
      ),
    );
  }
}
