library challenge;

import 'dart:html';
//import 'animator.dart';
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

class ChalGroup {
  List<Challenge> challenge = new List();
  int targetChal = 0;
  int bonusLen = 0;
  int left;
  int top;
  
  ChalGroup (this.left, this.top) {
    createChallenge();
  }
  
  void createChallenge() {
    for (int i = 0; i < INITCHALLEN; i++) {
      Challenge singleChal = new Challenge(left + i * BALLGAP, top, i);
      challenge.add(singleChal);
    }
    selectTargetChal(challenge[targetChal].chalDiv);
  }
  
  void selectTargetChal(DivElement chalDiv) {
    chalDiv.style.borderWidth = helper.cssFormat(1);
  }
  
  void undoSelectTargetChal(DivElement chalDiv) {
    chalDiv.style.borderWidth = helper.cssFormat(0);
  }
  
  void changeChallenge(String color, int uid) {
    if (challenge[targetChal].color == color) {
      if (uid == USER1ID) {
        user1.chal.updateChallenge();
      } else {
        user2.chal.updateChallenge();
      }
    }
  }
  
  void updateChallenge() {
    undoSelectTargetChal(challenge[targetChal].chalDiv);
    if (targetChal < chalLen - 1) {
      targetChal++;
    } else {
      helper.getChalLen();
      helper.getChalColor();
      
      user1.chal.setNewChallenge();
      user2.chal.setNewChallenge();
      
      targetChal = 0;
      bonusLen++;
    }
    selectTargetChal(challenge[targetChal].chalDiv);
  }
  
  void setNewChallenge() {
    for (int i = 0; i < INITCHALLEN; i++) {
      challenge[i].updateData();
    }
  }  
}