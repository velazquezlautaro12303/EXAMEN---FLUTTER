import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';

class ItemFoodMarket extends StatelessWidget {
  const ItemFoodMarket({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Food item;
  final void Function(String id, BuildContext context)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("LV${item.id!}");
        onTap != null ? onTap!(item.id!, context) : null;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(item.subtitle)
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  )),
                  child: Image.network(
                    item.imageUrl,
                    height: 120,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$${item.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(
                  Icons.add_box_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
