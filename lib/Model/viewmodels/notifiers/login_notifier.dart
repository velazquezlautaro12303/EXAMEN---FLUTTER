import 'package:flutter/material.dart';
import 'package:flutter_application_3/Model/autenticationFirestoreAdapter.dart';
import 'package:flutter_application_3/Model/notificator.dart';
import 'package:flutter_application_3/Model/viewmodels/states/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends Notifier<LoginState> {
  final auth =
      AutenticationFirestoreAdapter(notificator: NotificatorSnackBar());

  LoginState signIn = LoginState(
    descriptionLink: "Dont't have an account? ",
    nameLink: 'Register',
    estado: Estado.signIn,
    holdSession: true,
    titleButton: 'Login',
  );

  LoginState register = LoginState(
    descriptionLink: "Already have an account? ",
    nameLink: "Sign In",
    estado: Estado.register,
    holdSession: false,
    titleButton: 'Create Account',
  );

  @override
  LoginState build() {
    return signIn;
  }

  void onPressedButtonPrimary(
    String email,
    String password,
    BuildContext context,
  ) {
    switch (state.estado) {
      case Estado.signIn:
        auth.signIn(
          email,
          password,
          context,
        );
        break;
      case Estado.register:
        auth.register(
          email,
          password,
          context,
        );
        break;
      default:
    }
  }

  void onPressedButtonSecondary() {
    switch (state.estado) {
      case Estado.signIn:
        state = register;
        break;
      case Estado.register:
        state = signIn;
        break;
      default:
    }
  }
}
