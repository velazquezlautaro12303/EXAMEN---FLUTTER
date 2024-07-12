import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailProduct extends ConsumerWidget {
  DetailProduct({
    super.key,
    required this.modeEdit,
    required this.item,
  });

  final Food item;
  final bool modeEdit;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String getTitle() => titleController.text;
  String getPrice() => priceController.text;
  String getDescription() => descriptionController.text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    titleController.text = item.title;
    descriptionController.text = item.description;
    priceController.text = item.price.toString();
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.network("${item.imageUrl}"),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: modeEdit
                        ? [
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Title',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 110,
                              child: TextField(
                                maxLines: null,
                                expands: true,
                                controller: descriptionController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "Description",
                                ),
                              ),
                            ),
                          ]
                        : [
                            SizedBox(
                              height: 170,
                              child: Column(
                                children: [
                                  Text(
                                    "${item.title}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  Text("${item.subtitle}"),
                                ],
                              ),
                            ),
                          ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                width: 110,
                height: 55,
                child: modeEdit
                    ? TextField(
                        controller: priceController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ), // Indica que se pueden ingresar números con decimales
                        style: Theme.of(context).textTheme.headlineMedium,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 25,
                              left: 8,
                              bottom: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Price",
                            labelStyle: const TextStyle(
                              fontSize: 20,
                            ),
                            hintText: "\$0.00"),
                      )
                    : Text(
                        "\$${item.price}",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
