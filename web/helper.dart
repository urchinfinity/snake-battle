library helper;

import 'dart:html';
import 'initialData.dart';
import 'userManager.dart';

class Helper {
  int getLeft() {
    return (random.nextInt(COLUMN) + 1) * DISTANCE + BOARDMARGIN;
  }
  
  int getTop() {
    return (random.nextInt(ROW) + 1) * DISTANCE + BOARDMARGIN;
  }
  
  bool coverBox(int left, int top) {
    if (coverUserBox(left, top, user1) || coverUserBox(left, top, user2)) {
      return true;
    }
    return false;
  }
  
  bool coverUserBox(int left, int top, User user) {
    for (int i = 0; i < user.box.length; i++) {
      if (left == user.box[i].leftPos && top == user.box[i].topPos) {
        return true;
      }
    }
    return false;
  }
  
  bool coverBall(int left, int top) {
    for (int i = 0; i < ball.length; i++) {
      if (left == ball[i].leftPos && top == ball[i].topPos) {
        return true;
      }
    }
    return false;
  }
  
//  bool coverProp(int left, int top) {
//    for (int i = 0; i < prop.length; i++) {
//      if (left == prop[i].leftPos && top == prop[i].topPos) {
//        return true;
//      }
//    }
//    return false;
//  }
  
  String cssFormat (num number) {
    return "${number}px";
  }
  
  void showDiv(DivElement div){
    gameBoard.nodes.add(div);
  }
  
  void getChalLen() {
    chalLen = INITCHALLEN - random.nextInt(3);
  }

  void getChalColor() {
    for (int i = 0; i < INITCHALLEN; i++) {
      if (i < chalLen) {
        chalColor[i] = DIVCOLOR[random.nextInt(COLORNUM)];
      } else {
        chalColor[i] = INITCOLOR;
      }
    }
  }
}

abstract class divAttribute {
  void initDiv();
  void initColor();
  void setPosition();
  void setColor();
  void showDiv();
}