library box;

import 'dart:html';
import 'initialData.dart';
import 'helper.dart';
import 'snake.dart';
//import 'userManager.dart';

class Box implements divAttribute {
  DivElement boxDiv;
  int leftPos;
  int topPos;
  String color;
  
  int order; //for challenge
  
  Box.snake(this.leftPos, this.topPos) {
    initSnakeDiv();
    initSnakeColor();
    setPosition();
    setColor();
    showDiv();
  }
  
  Box.chal(this.leftPos, this.topPos, this.order) {
    initChalDiv();
    initChalColor();
    setPosition();
    setColor();
    showDiv(); 
  }
  
  void initSnakeDiv() {
    boxDiv = new DivElement();
    boxDiv.id = 'snake';
  }
  
  void initChalDiv() {
    boxDiv = new DivElement();
    boxDiv.id = 'challenge';
  }
  
  void initSnakeColor() {
    color = INITCOLOR;
  }
  
  void initChalColor() {
    color = chalColor[order];
  }
  
  void setPosition() {
    boxDiv.style.left = helper.cssFormat(leftPos);
    boxDiv.style.top = helper.cssFormat(topPos);
  }
  
  void setColor() {
    boxDiv.style.backgroundColor = color;
  }
  
  void showDiv() {
    helper.showDiv(boxDiv);
  }
  
  void changeColor(String color) {
    color = color;
    setColor();
  }
  
  void setHead(Snake snake) {
    snake.left = (snake.left + snake.horAdder) % BOARDWIDTH;
    snake.top = (snake.top + snake.verAdder) % BOARDHEIGHT;
    leftPos = snake.left;
    topPos = snake.top;
    
    setPosition();
    resetBorder();
  }
  
  void shiftBox(Box preBox) {
    leftPos = preBox.leftPos;
    topPos = preBox.topPos;
    
    setPosition();
  }
  
  void checkBorder(Box preBox) {
    List<int> direc = checkDirec(preBox);

    adjustBorder(this, direc[0], THINWIDTH);
    adjustBorder(preBox, direc[1], THINWIDTH);
  }
  
  List<int> checkDirec(Box preBox) {
    List<int> direc = new List(2);
        
    if (leftPos > preBox.leftPos) {
      direc[0] = SHIFTLEFT;
      direc[1] = SHIFTRIGHT;
    } else if (leftPos < preBox.leftPos) {
      direc[0] = SHIFTRIGHT;
      direc[1] = SHIFTLEFT;
    } else if (topPos > preBox.topPos) {
      direc[0] = SHIFTUP;
      direc[1] = SHIFTDOWN;
    } else {
      direc[0] = SHIFTDOWN;
      direc[1] = SHIFTUP;
    }
    
    return direc;
  }
  
  void resetBorder() {
    boxDiv.style.borderWidth = helper.cssFormat(BORDERWIDTH);
  }
  
  void adjustBorder(Box box, int direc, int width){
    switch (direc) {
      case SHIFTLEFT:
        box.boxDiv.style.borderLeftWidth = helper.cssFormat(width);
        break;
        
      case SHIFTRIGHT:
        box.boxDiv.style.borderRightWidth = helper.cssFormat(width);
        break;
        
      case SHIFTUP:
        box.boxDiv.style.borderTopWidth = helper.cssFormat(width);
        break;
        
      case SHIFTDOWN:
        box.boxDiv.style.borderBottomWidth = helper.cssFormat(width);
        break;
    }
  }
  
  void fillColor(String targetColor) {
    color = targetColor;
    setColor();
  }
}