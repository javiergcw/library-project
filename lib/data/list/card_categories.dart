import 'package:flutter/material.dart';
import 'package:project_library/core/res/res.dart';
import 'package:project_library/widgets/card/category_card.dart';

const List<CardCategory> cardCategory = [
  CardCategory(
    icon: Icons.grade,
    title: "Flutter",
    isActive: true,
    color: UIColors.bluePrimary,
  ),

  CardCategory(
    icon: Icons.grade,
    title: "Flutter",
    isActive: false,
    color: UIColors.purplePrimary,
  ),
  CardCategory(
    icon: Icons.notifications,
    title: "Notificaciones",
    isActive: false,
    color: UIColors.orangePrimary,
  ),
  CardCategory(
    icon: Icons.notifications,
    title: "Notificaciones",
    isActive: false,
    color: UIColors.pinkPrimary,
  ),
];
