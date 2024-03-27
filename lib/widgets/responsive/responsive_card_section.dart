import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/widgets/card/category_card.dart';

class HorizontalCardList extends StatelessWidget {
  final List<CardCategory> cardCategories;

  const HorizontalCardList({
    Key? key,
    required this.cardCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50, // Ajusta esto según el tamaño de tus tarjetas
        child: ListView.builder(
          itemCount: cardCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width /
                      5, // Ajusta el ancho como prefieras
                  child: cardCategories[index],
                ),
                UISizedBox.gapW10,
              ],
            );
          },
        ),
      ),
    );
  }
}
