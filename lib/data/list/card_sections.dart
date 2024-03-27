import 'package:flutter/material.dart';
import 'package:project_library/widgets/card/section_card.dart';

const List<CardSection> cardSections = [
  CardSection(
    icon: Icons.grade,
    title: "Flutter",
    isActive: true,
  ),
  CardSection(
    icon: Icons.bolt,
    title: "Next js",
    isActive: false,
  ),
  CardSection(
    icon: Icons.view_timeline,
    title: "Vue js",
    isActive: false,
  ),
];
