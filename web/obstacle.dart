library obstacle;

import 'dart:html';
import 'initialData.dart';

class Brick {
  DivElement brickDiv;
  int leftPos;
  int topPos;
  
  Obstacle() {
    initDiv();
  }
  
  void initDiv() {
    brickDiv = new DivElement();
    brickDiv.id = 'brick';
  }
}

class Wall {
  List<Brick> brick;
  
  Wall() {
    brick = new List();
    initWall();
  }
  
  void initWall() {
    for (int i = 0; i < INITWALLLEN; i++) {
      Brick singleBrick = new Brick();
      brick.add(singleBrick);
    }
  }
  
  void mode1() {}//DIE
  void mode2() {}//poopoo
  void mode3() {}//LUCKY
  
}