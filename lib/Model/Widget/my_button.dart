import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).primaryColor,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).secondaryHeaderColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 15),
          ),
        ),
        onPressed: onPressed,
        // onPressed: onPressed(context),
        // _signIn(context);
        // print("Nombre de Usuario : ${this.userController.text}");
        // print("Contrasenia       : ${this.passwordController.text}");
        // print("Mantener Sesion   : ${this.checked}");
        // Future<MyUser?> user = database.userDao
        //     .findUser(this.userController.text, this.passwordController.text);
        // user.then((value) {
        //   if (value != null) {
        //     print("User: ${value.username} ${value.id!}");
        //     if (this.checked) {
        //       database.configurationDao.save(new Configuration(
        //         name: "SessionSaved",
        //         value: value.id.toString(),
        //       ));
        //     }
        //     ref.read(itemsProvider.notifier).state = database.foodDao.getAll();
        //     context.go(
        //       "/home",
        //       extra: value.id.toString(),
        //     );
        //   } else {
        //     showMySnackBar(
        //         "Los datos ingresados no machean con la base de datos",
        //         context);
        //   }
        // });
        child: Text(title),
      ),
    );
  }
}
