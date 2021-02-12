import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ico/tutorial.dart';
import 'package:flutter_ico/vistas.dart';

class FondoDialogo {

  final Tutorial tutorial;
  Rect rect;
  Paint paint;

  int slide = 1;

  FondoDialogo(this.tutorial) {
    //sprite = Sprite('ui/close_icon.png');
    rect = Rect.fromLTWH(
        0,
        tutorial.screenSize.height - tutorial.tileSize*5,
        tutorial.screenSize.width,
        tutorial.tileSize * 5);
  }

  void render(Canvas c) {
    //ciSprite.renderRect(c, ciRect);
    paint = Paint();
    paint.color = Colors.pinkAccent;
    c.drawRect(rect, paint);

    if (slide == 1){
      tutorial.drawTextAt('Hola! Bienvenido al tutorial! ', Colors.white, Offset(tutorial.tileSize * 8, tutorial.tileSize * 20), c);
    }
  }

  void update(double t) {

  }

  void onTapDown() {
  }
}