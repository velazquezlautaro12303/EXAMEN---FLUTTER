import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/item_drawer.dart';
import 'package:flutter_application_3/main.dart';

final List<ItemDrawer> itemsDrawer = [
  ItemDrawer(
    icon: Icons.store,
    title: "Market",
    link: "/market",
    function: () {},
  ),
  ItemDrawer(
    icon: Icons.house,
    title: "My Products",
    link: "/home",
    function: () {},
  ),
  ItemDrawer(
    icon: Icons.logout,
    title: "Salir",
    link: "/login",
    function: () => database.configurationDao.delete("SessionSaved"),
  ),
];
