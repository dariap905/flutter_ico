import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ico/tutorial.dart';
import 'package:flutter_ico/vistas.dart';

class Estrella {

  final Tutorial tutorial;
  Rect rect;
  Paint paint;
  Sprite sprite;

  Estrella(this.tutorial, double x, double y) {
    sprite = Sprite('star.png');
    rect = Rect.fromLTWH(x, y, tutorial.tileSize * 2, tutorial.tileSize * 2);
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {

  }
}