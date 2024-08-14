import 'package:flame_application_2/game/assets.dart';
import 'package:flame_application_2/game/trash_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final TrashGame game;
  static const id = "mainMenu";

  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          game.overlays.remove("mainMenu");
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage(Assets.menu), fit: BoxFit.cover)),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
