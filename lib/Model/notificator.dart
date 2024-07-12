import 'package:flutter/material.dart';

abstract class Notificator {
  void notify(String msj, BuildContext context);
}

class NotificatorSnackBar extends Notificator {
  @override
  void notify(String msj, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msj),
      duration: const Duration(seconds: 1),
    ));
  }
}
