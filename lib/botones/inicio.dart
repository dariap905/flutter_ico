import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ico/tutorial.dart';
import 'package:flutter_ico/vistas.dart';

class BotonInicio {

  final Tutorial tutorial;
  Rect rect;
  Paint paint;

  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  BotonInicio(this.tutorial) {
    //sprite = Sprite('ui/close_icon.png');
    rect = Rect.fromLTWH(
        tutorial.screenSize.width / 2 - (tutorial.tileSize * 2) ,
        tutorial.screenSize.height / 2,
        tutorial.tileSize * 4,
        tutorial.tileSize * 1);
  }

  void render(Canvas c) {
    //ciSprite.renderRect(c, ciRect);
    paint = Paint();
    paint.color = Colors.greenAccent;
    c.drawRect(rect, paint);
    tutorial.drawTextAt('Start', Colors.redAccent, Offset(tutorial.tileSize * 6.5, tutorial.tileSize * 12), c);
  }

  void update(double t) {

  }

  void onTapDown() {
    tutorial.vista = Vistas.jugando;
  }


}