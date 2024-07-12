import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Model/notificator.dart';
import 'package:go_router/go_router.dart';

class AutenticationFirestoreAdapter {
  final Notificator notificator;
  final _auth = FirebaseAuth.instance;

  AutenticationFirestoreAdapter({required this.notificator});

  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Usuario registrado: ${userCredential.user!.email}');
      context.go(
        "/home",
        extra: "1",
      );
    } catch (e) {
      print('Error al registrar usuario: $e');
    }
  }

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      print(email);
      print(password);
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signed in: ${userCredential.user!.email}');
      context.go(
        "/home",
        extra: "1",
      );
    } catch (_) {
      notificator.notify("Error en la autenticacion", context);
    }
  }
}
