import 'package:flutter/material.dart';
import 'package:project_library/models/menu_item.dart';
import 'package:project_library/widgets/card/category_card.dart';
import 'package:project_library/widgets/card/linked_card.dart';
import 'package:project_library/widgets/card/section_card.dart';
import 'package:project_library/widgets/button/hamburguer_button.dart';
import 'package:project_library/widgets/title/section_title.dart';
import 'package:project_library/widgets/top_header_image.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    Color scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      body: Column(
        children: [
          TopHeaderImage(
            containerColor: Colors.black,
            semicircleColor: scaffoldBackgroundColor,
          ),
          HamburguerButton(
            menuItems: [
              MenuItem(
                title: 'Google',
                link: 'https://google.com',
              ),
              MenuItem(
                title: 'Flutter',
                link: 'https://flutter.dev',
              ),
              // Agrega más elementos aquí
            ],
          ),
          const Wrap(
            children: [
              CardSection(
                icon: Icons.home,
                title: "Inicio",
                isActive: false, // Cambiar a false para ver el estado inactivo
              ),
              CardSection(
                icon: Icons.home,
                title: "Inicio",
                isActive: true, // Cambiar a false para ver el estado inactivo
              ),
            ],
          ),
          const Wrap(
            children: [
              CardCategory(
                icon: Icons.notifications,
                title: "Notificaciones",
                isActive: true,
                color: Colors.blue,
              ),
              CardCategory(
                icon: Icons.notifications,
                title: "Notificaciones",
                isActive: false,
                color: Colors.blue,
              ),
            ],
          ),
          const SectionTitle(
            icon: Icons.star, // El ícono que quieres usar
            text: 'Título con Ícono', // El texto que deseas mostrar
            textStyle: TextStyle(
              fontSize: 20, // Tamaño del texto
              fontWeight: FontWeight.bold, // Grosor del texto
              color: Colors.blue, // Color del texto
            ),
          ),
          LinkedCard(
            title: 'Titulo Ejemplo',
            titleStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            firstOption: 'Opción 1',
            secondOption: 'Opción 2',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
