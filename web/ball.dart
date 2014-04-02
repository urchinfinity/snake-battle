library ball;

import 'dart:html';
import 'initialData.dart';
import 'helper.dart';

class Ball implements divAttribute {
  DivElement ballDiv;
  int leftPos;
  int topPos;
  String color;
  
  Ball() {
    getPosition();
    initDiv();
    initColor();
    setPosition();
    setColor();
    showDiv();
  }
  
  void getPosition() {
    int left = helper.getLeft();
    int top = helper.getTop();
    while (helper.coverBox(left, top) || helper.coverBall(left, top)) {
      left = helper.getLeft();
      top = helper.getTop();
    }
    leftPos = left;
    topPos = top;
  }
  
  void initDiv() {
     ballDiv = new DivElement();
     ballDiv.id = 'ball';
   }
  
  void initColor() {
    color = DIVCOLOR[random.nextInt(COLORNUM)];
  }
  
  void setPosition() {
    ballDiv.style.left = helper.cssFormat(leftPos);
    ballDiv.style.top = helper.cssFormat(topPos);
  }
  
  void setColor() {
    ballDiv.style.backgroundColor = color;
  }
  
  void showDiv() {
    helper.showDiv(ballDiv);
  }
  
  void updateBall() {
    getPosition();
    initColor();

    setPosition();
    setColor();
  }
  
  void increaseBall(int num) {}
  
  void decreaseBall(int num) {}
}