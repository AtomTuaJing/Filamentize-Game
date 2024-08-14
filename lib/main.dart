import 'package:flame/game.dart';
import 'package:flame_application_2/game/trash_game.dart';
import 'package:flame_application_2/screens/game_over_screen.dart';
import 'package:flame_application_2/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = TrashGame();

  runApp(GameWidget(
    game: game,
    initialActiveOverlays: [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(
            game: game,
          )
    },
  ));
}
