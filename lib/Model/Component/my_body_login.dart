import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/Model/Widget/my_text_field.dart';
import 'package:flutter_application_3/Model/Widget/my_text_field_password.dart';

class MyBodyLogin extends StatefulWidget {
  MyBodyLogin({
    super.key,
    required this.visible,
  });

  final bool visible;
  bool checked = false;
  MyTextField myTextFieldEmail = MyTextField(
    hintText: 'Email',
  );
  MyTextFieldPassword myTextFieldPassword = MyTextFieldPassword();

  @override
  State<MyBodyLogin> createState() => _MyBodyLoginState();
}

class _MyBodyLoginState extends State<MyBodyLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.myTextFieldEmail,
        const SizedBox(
          height: 20,
        ),
        widget.myTextFieldPassword,
        const SizedBox(
          height: 15,
        ),
        Visibility(
          visible: widget.visible,
          child: InkWell(
            onTap: () {
              widget.checked = !widget.checked;
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: widget.checked,
                  onChanged: (value) {
                    widget.checked = value!;
                    setState(() {});
                  },
                ),
                Text(
                  "Mantener Sesion",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
