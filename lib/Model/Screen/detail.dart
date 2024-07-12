import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/providers/providers.dart';
import 'package:flutter_application_3/Model/Widget/botom_delete.dart';
import 'package:flutter_application_3/Model/Widget/detail_product.dart';
import 'package:flutter_application_3/Model/Widget/icon_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Detail extends ConsumerStatefulWidget {
  final String foodId;

  const Detail({
    super.key,
    required this.foodId,
  });

  @override
  ConsumerState<Detail> createState() => _DetailState();
}

class _DetailState extends ConsumerState<Detail> {
  bool modeEdit = false;

  @override
  void initState() {
    super.initState();
    ref.read(detailViewModelProvider.notifier).search(widget.foodId);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(detailViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconMode(
            modeEdit: state.modeEdit,
            onPressed: () {
              ref
                  .read(detailViewModelProvider.notifier)
                  .cambiarMode(widget.foodId);
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: state.food,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final detailProduct = DetailProduct(
                modeEdit: state.modeEdit,
                item: snapshot.data!,
              );
              return SingleChildScrollView(
                child: Column(
                  children: [
                    detailProduct,
                    Container(
                      margin: const EdgeInsets.all(40),
                      child: BotomDeleteWidget(
                        foodId: widget.foodId,
                        userId: snapshot.data!.userId,
                        modeEdit: state.modeEdit,
                        onTap: () {
                          ref.read(detailViewModelProvider.notifier).onTap(
                                snapshot.data!.copyWith(
                                  id: widget.foodId,
                                  title: detailProduct.getTitle(),
                                  description: detailProduct.getDescription(),
                                  price: int.parse(detailProduct.getPrice()),
                                ),
                              );
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
