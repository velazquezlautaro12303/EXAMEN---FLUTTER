import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Model/Widget/item_food_market.dart';

class itemsFuture extends StatefulWidget {
  const itemsFuture({
    super.key,
    required this.items,
    required this.refresh,
    required this.onTap,
  });

  final Future<List<Food>> items;
  final Future<void> Function() refresh;
  final void Function(String idItem, BuildContext context)? onTap;

  @override
  State<itemsFuture> createState() => _itemsFutureState();
}

class _itemsFutureState extends State<itemsFuture> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.items,
      builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: RefreshIndicator(
                  onRefresh: widget.refresh,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ItemFoodMarket(
                      item: snapshot.data![index],
                      onTap: widget.onTap,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
