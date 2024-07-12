import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/configuration.dart';
import 'package:flutter_application_3/Domain/providers/providers.dart';
import 'package:flutter_application_3/Model/Component/my_body_login.dart';
import 'package:flutter_application_3/Model/Component/my_footer.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  void initState() {
    super.initState();
    Future<Configuration?> savedSession =
        database.configurationDao.read("SessionSaved");
    savedSession.then((value) {
      print("initState");
      if (value != null) {
        context.go(
          "/home",
          extra: value.value,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final bodyLogin = MyBodyLogin(
      visible: state.holdSession,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                child: bodyLogin,
              ),
              MyFooter(
                descriptionLink: state.descriptionLink,
                nameLink: state.nameLink,
                onPressedButtonSecondary: () => ref
                    .read(loginViewModelProvider.notifier)
                    .onPressedButtonSecondary(),
                onPressedButtonPrimary: () => ref
                    .read(loginViewModelProvider.notifier)
                    .onPressedButtonPrimary(
                      bodyLogin.myTextFieldEmail.controller.text,
                      bodyLogin.myTextFieldPassword.passwordController.text,
                      context,
                    ),
                title: state.titleButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
