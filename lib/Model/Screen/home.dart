import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/entities/food.dart';
import 'package:flutter_application_3/Domain/providers/providers.dart';
import 'package:flutter_application_3/Model/Widget/my_drawer.dart';
import 'package:flutter_application_3/Model/Widget/my_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  Home({required this.userId, super.key});
  final String userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // @override
  // void initState() {
  //   super.initState();
  //   ref.read(homeViewModelProvider.notifier).getAllById();
  // }

  @override
  Widget build(BuildContext context) {
    ref.read(homeViewModelProvider.notifier).getAllById();
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
      ),
      body: itemsFuture(
        items: state.foods,
        refresh: () async =>
            ref.read(homeViewModelProvider.notifier).getAllById(),
        onTap: ref.read(homeViewModelProvider.notifier).onClickItem,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Tocaste boton");
          final myFood = Food(
            id: null,
            title: "Cafe con Medialuna",
            subtitle: "Con la compra de un cafe llevate gratis una medialuna",
            description:
                "Con la compra de un cafe llevate gratis una medialuna",
            price: 1500,
            imageUrl:
                "https://cache-mcd-ecommerce.appmcdonalds.com/images/AR/DLV_4801_v4.png",
            userId: widget.userId,
            isActived: true,
          );
          ref.read(homeViewModelProvider.notifier).save(myFood);
          // ref.read(itemsProvider.notifier).state = notesRepository.getAll();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      drawer: MyDrawer(
        nameUser: widget.userId,
        selectedIndexDrawer: 1,
      ),
    );
  }
}
