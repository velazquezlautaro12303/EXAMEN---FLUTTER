import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Domain/providers/providers.dart';
import 'package:flutter_application_3/Model/Widget/my_drawer.dart';
import 'package:flutter_application_3/Model/Widget/my_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class Market extends ConsumerStatefulWidget {
  Market({
    super.key,
  });
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Market();
}

class _Market extends ConsumerState<Market>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    ref.read(marketViewModelProvider.notifier).refresh();
  }

  late AnimationController _controller;
  bool playAnimation = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(marketViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Market"),
      ),
      body: !playAnimation
          ? itemsFuture(
              items: state.foods,
              refresh: () async =>
                  ref.read(marketViewModelProvider.notifier).refresh(),
              onTap: (String, BuildContext) {
                setState(() {
                  playAnimation = !playAnimation;
                  final AudioPlayer player = AudioPlayer();
                  player.play(AssetSource("cash.mp3"));
                });
              },
            )
          : Center(
              child: LottieBuilder.network(
                "https://lottie.host/d18cf0a4-2bfe-4d99-8191-c0cdcffa0a78/91YfJavgA5.json",
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller.duration = composition.duration;
                  _controller.reset();
                  _controller.forward();
                  _controller.addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      setState(() {
                        playAnimation = false; // La animación ha terminado
                      });
                    }
                  });
                },
              ),
            ),
      drawer: MyDrawer(
        nameUser: widget.userId,
        selectedIndexDrawer: 0,
      ),
    );
  }
}
