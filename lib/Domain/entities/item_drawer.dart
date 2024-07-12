import 'package:flutter/material.dart';

class ItemDrawer {
  final IconData icon;
  final String title;
  final String link;
  final Function function;

  ItemDrawer({
    required this.icon,
    required this.title,
    required this.link,
    required this.function,
  });
}
