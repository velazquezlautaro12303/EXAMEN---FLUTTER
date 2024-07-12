import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconMode extends ConsumerWidget {
  const IconMode({
    super.key,
    required this.modeEdit,
    required this.onPressed,
  });

  final bool modeEdit;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        modeEdit ? Icons.remove_red_eye : Icons.mode,
        color: Colors.black,
        size: 35,
      ),
    );
  }
}
