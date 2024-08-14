import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flame_application_2/components/background.dart';
import 'package:flame_application_2/components/bottle.dart';
import 'package:flame_application_2/components/heart.dart';
import 'package:flame_application_2/components/panda.dart';
import 'package:flame_application_2/components/trash.dart';
import 'package:flutter/material.dart';

class TrashGame extends FlameGame with HasCollisionDetection {
  Timer interval = Timer(1.5, repeat: true);
  late TextComponent score;
  late Panda panda;
  int heart = 6;
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      panda = Panda(),
      Bottle(),
      Trash(),
      Heart(),
      score = buildScore(),
    ]);

    interval.onTick = () {
      addAll([Bottle(), Trash()]);
    };
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "Score: 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: "Game")));
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = "Score: ${panda.score}";

    if (heart == 0) {
      gameOver();
    }
  }

  void gameOver() {
    isHit = true;
    overlays.add("gameOver");
    pauseEngine();
  }
}
