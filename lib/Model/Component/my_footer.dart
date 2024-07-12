import 'package:flutter/material.dart';
import 'package:flutter_application_3/Model/Widget/my_button.dart';

class MyFooter extends StatelessWidget {
  MyFooter({
    super.key,
    required this.descriptionLink,
    required this.nameLink,
    required this.onPressedButtonPrimary,
    required this.onPressedButtonSecondary,
    required this.title,
  });

  final String descriptionLink;
  final String nameLink;
  final String title;
  final VoidCallback? onPressedButtonSecondary;
  final VoidCallback? onPressedButtonPrimary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(descriptionLink),
            TextButton(
              onPressed: onPressedButtonSecondary,
              child: Text(nameLink),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        MyButton(
          onPressed: onPressedButtonPrimary,
          title: title,
        ),
      ],
    );
  }
}
