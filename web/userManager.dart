library userManager;

import 'dart:html';
//import 'dart:async';
import 'box.dart';
import 'challenge.dart';
import 'initialData.dart';
import 'animator.dart';

class User extends Actor{
  List<Box> box;
  List<Challenge> challenge;
  int targetBox;
  int targetChal;
  int verAdder;
  int horAdder;
  int left;
  int top;
  
  int duration;
  bool maxLen;
  bool addSpeed;
  int skillLen;
  
  User(this.left, this.top) {
    box = new List();
    challenge = new List();
    targetBox = 0;
    targetChal = 0;
    verAdder = SPACE;
    horAdder = 0;
    duration = DURATION;
    maxLen = false;
    addSpeed = false;
    skillLen = 0;
  }
  
  void createBox() {
    for (int i = 0; i < INITBOXLEN; i++) {
      Box singlebox = new Box(left, top - i * SPACE);
      box.add(singlebox);
    }
    initBorder();
  }
  
  void initBorder() {
    int len = box.length;
    for (int i = 1; i < len; i++) {
      box[i].checkBorder(box[i - 1]);
    }
  }
  
  void createChallenge() {
    for (int i = 0; i < INITCHALLEN; i++) {
      Challenge singleChal = new Challenge(getChalLeft() + i * BALLGAP, getChalTop(), i);
      challenge.add(singleChal);
    }
    selectTargetChal(challenge[targetChal].chalDiv);
  }
  
  int getChalLeft() {
    if (left == USER1LEFT) {
      return CHAL1LEFT;
    }
    return CHAL2LEFT;
  }
  
  int getChalTop() {
    return CHALTOP;
  }
  
//  void startTimer(User user2) {
////    action = new Timer.periodic(new Duration(milliseconds: duration), (Timer T) => actionController(T, user2));
//       action.start();
//    
//  }
  
  void next(int time) {
    resetBoxPos();
    detactBall(user2);
    detactTouchBody(user2);
    detactAddSpeed(user2);
//    detactEndGame();
  }
  
  void resetBoxPos() {
    shiftBox();
    box[0].setHead(this);     
    initBorder();
  }
  
  void shiftBox() {
    for (int i = box.length - 1; i > 0; i--) {
      box[i].shiftBox(box[i - 1]);
      box[i].resetBorder();
    }
  }
  
  void detactBall(User user2) {
    for (int i = 0; i < ball.length; i++) {
      if (ball[i].leftPos == box[0].leftPos && ball[i].topPos == box[0].topPos) {
        shiftColor(ball[i].color);
        detactChallenge(ball[i].color, user2);
        ball[i].updateBall();
        
        addSpeed = true;
        
        break;
      }
    }
  }
  
  void detactChallenge(String color, User user2) {
    if (challenge[targetChal].color == color) {
      updateChallenge(user2);
    }
  }
  
  void updateChallenge(User user2) {
    undoSelectTargetChal(challenge[targetChal].chalDiv);
    if (targetChal < chalLen - 1) {
      targetChal++;
    } else {
      helper.getChalLen();
      helper.getChalColor();
      setNewChallenge();
      user2.setNewChallenge();
      
      targetChal = 0;
      updateSkillLen();
    }
    selectTargetChal(challenge[targetChal].chalDiv);
  }
  
  void selectTargetChal(DivElement chalDiv) {
    chalDiv.style.borderWidth = helper.cssFormat(1);
  }
  
  void undoSelectTargetChal(DivElement chalDiv) {
    chalDiv.style.borderWidth = helper.cssFormat(0);
  }
  
  void setNewChallenge() {
    for (int i = 0; i < INITCHALLEN; i++) {
      challenge[i].updateData();
    }
  }
  
  void updateSkillLen() {
    box[skillLen].boxDiv.style.borderColor = SKILLCOLOR;
    skillLen++;
  }
  
  void shiftColor(String color) {
    for (int i = targetBox; i > 0; i--) {
      box[i].fillColor(box[i - 1].color);
    }
    box[0].fillColor(color);
    targetAdder();
  }
  
  void targetAdder() {
    if (targetBox < INITBOXLEN - 1) {
      targetBox++;
    } else {
      maxLen = true;
    }
  }
  
  void detactTouchBody(User user2) {
    detactTouchSelfBody();
    detactTouchUser2Body(user2);
  }
  
  void detactTouchSelfBody() {
    for(int i = 1; i < targetBox; i++) {
      if (box[i].leftPos == box[0].leftPos && box[i].topPos == box[0].topPos) {
        shiftColorToHead(i, box[i].color);
        
        addSpeed = true;
        
        break;
      }
    }
  }
  
  void detactTouchUser2Body(User user2) {
    for(int i = 0; i < user2.targetBox; i++) {
      if (user2.box[i].leftPos == box[0].leftPos && user2.box[i].topPos == box[0].topPos) {
        shiftColorToHead(targetBox, user2.box[i].color);
        detactChallenge(user2.box[i].color, user2);
        targetAdder();
        addSpeed = true;
        
        user2.shiftEmptyColor(i);
        break;
      }
    }
  }
  
  void shiftEmptyColor(int target) {
    for (int i = target; i < targetBox - 1; i++) {
      box[i].changeColor(box[i + 1].color);
    }
    if (maxLen) {
      box[targetBox].changeColor(INITCOLOR);
      maxLen = false;
    } else {
      box[targetBox - 1].changeColor(INITCOLOR);
      targetBox--;
    }
  }
  
  void shiftColorToHead(int target, String color) {
    for (int i = target; i > 0; i--) {
      box[i].changeColor(box[i - 1].color);
    }
    box[0].changeColor(color);
  }
  
  void detactAddSpeed(User user2) {
    if (addSpeed) {
      duration = (duration * SPEEDRATE).toInt();
      addSpeed = false;
//      action.cancel();
//      startTimer(user2);
    }
  }
}