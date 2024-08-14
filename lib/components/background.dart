import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_application_2/game/assets.dart';
import 'package:flame_application_2/game/trash_game.dart';

class Background extends SpriteComponent with HasGameRef<TrashGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
