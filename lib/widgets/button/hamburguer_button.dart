import 'package:flutter/material.dart';
import 'package:project_library/models/menu_item.dart';

class HamburguerButton extends StatefulWidget {
  final List<MenuItem> menuItems;

  const HamburguerButton({Key? key, required this.menuItems}) : super(key: key);

  @override
  HamburguerButtonState createState() => HamburguerButtonState();
}

class HamburguerButtonState extends State<HamburguerButton> {
  bool isExpanded = false;
  int? hoveredIndex;

  void _toggleMenu() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    // Ajustes para calcular la altura necesaria
    const itemHeight = 55.0; // Altura estimada por ítem
    const titleHeight =
        20.0; // Espacio para el título "Conozca más" y el espacio alrededor
    const dividerHeight = 10.0; // Altura para el divisor
    final calculatedHeight =
        itemHeight * widget.menuItems.length + titleHeight + dividerHeight;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: isExpanded ? 300 : 56,
          // Usamos calculatedHeight para determinar la altura del contenedor
          height: isExpanded ? calculatedHeight : 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: color,
          ),
          child: isExpanded
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: _toggleMenu,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.close, color: Colors.white),
                            Text(
                              'Conozca más',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.white.withOpacity(0.5)),
                      ...List.generate(widget.menuItems.length, (index) {
                        final item = widget.menuItems[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: MouseRegion(
                            onEnter: (_) =>
                                setState(() => hoveredIndex = index),
                            onExit: (_) => setState(() => hoveredIndex = null),
                            child: Material(
                              color: hoveredIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(22),
                              child: InkWell(
                                onTap: () {
                                  print('Tapped on ${item.link}');
                                },
                                borderRadius: BorderRadius.circular(22),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        color: hoveredIndex == index
                                            ? color
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: _toggleMenu,
                  ),
                ),
        ),
      ],
    );
  }
}
