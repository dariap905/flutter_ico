import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ico/estrella.dart';
import 'package:flutter_ico/tutorial.dart';
import 'package:flutter_ico/vistas.dart';

class Mariana {
  final Tutorial tutorial;
  Rect rectInicio, rectJugando;
  Paint paint;
  //despues para cuando quiera ponerle imagen
  //List<Sprite> sprite;
  double spriteIndex = 0;
  bool isTapped = false;

  List<Estrella> estrellas;
  int cantidadEstrellas = 1;

  Mariana(this.tutorial) {
      rectInicio = Rect.fromLTWH(tutorial.screenSize.width / 2 - tutorial.tileSize*2, tutorial.screenSize.height / 2 - tutorial.tileSize*3, tutorial.tileSize*4, tutorial.tileSize*6);
      rectJugando = Rect.fromLTWH(0, tutorial.screenSize.height - tutorial.tileSize*6, tutorial.tileSize*4, tutorial.tileSize*6);

      estrellas = List<Estrella>();
      crearEstrellas();
  }

  void render(Canvas c) {
    //rect.renderRect(c, rect);
    paint = Paint();
    paint.color = Colors.orangeAccent;

    if(tutorial.vista == Vistas.inicio){
      c.drawRect(rectInicio, paint);
    }

    if(tutorial.vista == Vistas.jugando){
      c.drawRect(rectJugando, paint);
    }

    estrellas.forEach((Estrella e) => e.render(c));

  }

  void update(double t) {

  }

  void onTapDown() {

  }

  void crearEstrellas() {
    double x = (tutorial.screenSize.width / 2 - tutorial.tileSize * 10);
    double y = (tutorial.screenSize.height / 2 - tutorial.tileSize * 4);
    //cell 1, 0
    estrellas.add(Estrella(tutorial, x, y));
    //cell 1, 1
    //cell 1, 2
    //cell 1, 3
    //cell 2, 0
    //cell 2, 1
    //cell 2, 2
    //cell 2, 3
    //cell 3, 0
    //cell 3, 1
    //cell 3, 2
    //cell 3, 3
  }

}