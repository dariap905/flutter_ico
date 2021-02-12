import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ico/botones/inicio.dart';
import 'package:flutter_ico/fondo-dialogo.dart';
import 'package:flutter_ico/vistas.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mariana.dart';

class Tutorial extends Game {
  Size screenSize;
  double tileSize;

  final SharedPreferences storage;

  Mariana mariana;
  FondoDialogo fd;
  BotonInicio bi;

  Vistas vista = Vistas.inicio;

  Tutorial(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    mariana = Mariana(this);
    fd = FondoDialogo(this);
    bi = BotonInicio(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = 32;
  }

  //LAST RENDERS ON TOP
  @override
  void render(Canvas c) {
    //background color
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Colors.white;
    c.drawRect(bgRect, bgPaint);

    if(vista == Vistas.inicio){
      mariana.render(c);
      bi.render(c);
    }

    if(vista == Vistas.jugando){
      fd.render(c);
      mariana.render(c);
    }

  }

  @override
  void update(double t) {
  }

  void onTapDown(TapDownDetails d){

    if(vista == Vistas.inicio){
      if (bi.rect.contains(d.globalPosition)) {
        bi.onTapDown();
      }
    }

  }

  void drawTextAt(String text, Color color, Offset position, Canvas c) {

    final textStyle = TextStyle(
      color: color,
      fontFamily: 'Raleway',
      fontSize: 20,
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);

    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    Offset drawPosition = Offset(position.dx - textPainter.width / 2, position.dy - (textPainter.height / 2));
    textPainter.paint(c, drawPosition);
  }
}