library gameManager;

import 'dart:html';
import 'ball.dart';
//import 'prop.dart';
//import 'challenge.dart';
//import 'obstacle.dart';
import 'initialData.dart';

void createBox() {
  user1.createBox();
  user2.createBox();
}

void createBall() {
  for (int i = 0; i < INITBALLLEN; i++) {
    Ball singleBall = new Ball();
    ball.add(singleBall);
  }
}

void createChallenge() {
  helper.getChalLen();
  helper.getChalColor();
  
  user1.createChallenge();
  user2.createChallenge();
}

void createObstacle() {
//  initImagePos();
}

//void startTimer() {
//  action = new Timer.periodic(duration, (Timer T) {
////    for (int i = 0; i < prop.length; i++) {
////      if (prop[i].leftPos == box[0].leftPos && prop[i].topPos == box[0].topPos) {
////        appendBox(3);
////        prop[i].propDiv.remove();
////        break;
////      }
////    }  
//  });
//}

void startGame() {
  animator.start();
}

//void appendBox(int num) {
//  for (int i = 0; i < num; i++) {
//    Box singlebox = new Box(nextLeftPos(), nextTopPos());
//    box.add(singlebox);
//  }
//}
//
//int nextLeftPos() {
//  return 2 * box[box.length - 1].leftPos - box[box.length - 2].leftPos;
//}
//
//int nextTopPos() {
//  return 2 * box[box.length - 1].topPos - box[box.length - 2].topPos;
//}

//void detactEndGame() {
//  if (targetBox == INITBOXLEN) {
//    action.cancel();
//  }
//}

void startArrowDownListener() {
  var keyListener = document.onKeyDown.listen((KeyboardEvent evt){
    switch (evt.keyCode) {
      case ARROWLEFT:
        if (user1.horAdder != SPACE) {
          user1.verAdder = 0;
          user1.horAdder = -SPACE;
        }
        break;
        
      case ARROWRIGHT:
        if (user1.horAdder != -SPACE) {
          user1.verAdder = 0;
          user1.horAdder = SPACE;
        }
        break;
          
      case ARROWUP:
        if(user1.verAdder != SPACE) {
          user1.verAdder = -SPACE;
          user1.horAdder = 0;
        }
        break;
          
      case ARROWDOWN:
        if (user1.verAdder != -SPACE) {
          user1.verAdder = SPACE;
          user1.horAdder = 0;
        }
        break;
          
      default:
        break;
    }
  });
}

void startKeyDownListener() {
  var keyListener = document.onKeyDown.listen((KeyboardEvent evt){
    switch (evt.keyCode) {
      case KEYLEFT:
        if (user2.horAdder != SPACE) {
          user2.verAdder = 0;
          user2.horAdder = -SPACE;
        }
        break;
        
      case KEYRIGHT:
        if (user2.horAdder != -SPACE) {
          user2.verAdder = 0;
          user2.horAdder = SPACE;
        }
        break;
          
      case KEYUP:
        if(user2.verAdder != SPACE) {
          user2.verAdder = -SPACE;
          user2.horAdder = 0;
        }
        break;
          
      case KEYDOWN:
        if (user2.verAdder != -SPACE) {
          user2.verAdder = SPACE;
          user2.horAdder = 0;
        }
        break;
          
      default:
        break;
    }
  });
}