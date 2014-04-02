library box;

import 'dart:html';
import 'initialData.dart';
import 'helper.dart';
import 'userManager.dart';

class Box implements divAttribute {
  DivElement boxDiv;
  int leftPos;
  int topPos;
  String color;
  
  Box(this.leftPos, this.topPos) {
    initDiv();
    initColor();
    setPosition();
    setColor();
    showDiv();
  }
  
  void initDiv() {
    boxDiv = new DivElement();
    boxDiv.id = 'box';
  }
  
  void initColor() {
    color = INITCOLOR;
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
  
  void setHead(User user) {
    user.left = (user.left + user.horAdder) % BOARDWIDTH;
    user.top = (user.top + user.verAdder) % BOARDHEIGHT;
    leftPos = user.left;
    topPos = user.top;
    
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
  
  void fillColor(String color) {
    color = color;
    setColor();
  }
}