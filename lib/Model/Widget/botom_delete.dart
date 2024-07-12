import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BotomDeleteWidget extends ConsumerWidget {
  const BotomDeleteWidget({
    super.key,
    required this.foodId,
    required this.userId,
    required this.modeEdit,
    required this.onTap,
  });

  final String foodId;
  final String userId;
  final bool modeEdit;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Icon(
                modeEdit ? Icons.save : Icons.delete,
                color: Colors.black,
                size: 55,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              modeEdit ? "Guardar" : "Eliminar",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
