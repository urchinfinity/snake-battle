library challenge;

import 'dart:html';
import 'initialData.dart';
import 'helper.dart';

class Challenge implements divAttribute {
  DivElement chalDiv;
  int leftPos;
  int topPos;
  int order;
  String color;
  
  Challenge(this.leftPos, this.topPos, this.order){
    initDiv();
    initColor();
    setPosition();
    setColor();
    showDiv();  
  }
  
  void initDiv() {
    chalDiv = new DivElement();
    chalDiv.id = 'challenge';
  }
  
  void initColor() {
    color = chalColor[order];
  }
  
  void setPosition() {
    chalDiv.style.left = helper.cssFormat(leftPos);
    chalDiv.style.top = helper.cssFormat(topPos);
  }
  
  void setColor() {
    chalDiv.style.backgroundColor = color;
  }
  
  void showDiv() {
    helper.showDiv(chalDiv);
  }
  
  void updateData() {
    initColor();
    setColor();
  }
}