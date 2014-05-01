library gameManager;

import 'dart:html';
//import 'prop.dart';
//import 'challenge.dart';
//import 'obstacle.dart';
import 'initialData.dart';

void initChallenge() {
  helper.getChalLen();
  helper.getChalColor();
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
void initGame() {
  initChallenge();
  createObstacle();
//  for (int i = 0; i < 2; i++) {
//      Prop singleProp = new Prop();
//      prop.add(singleProp);
//  }
}
void startGame() {
  animator.start();
  animator.add(user1.snake);
  animator.add(user2.snake);
  startArrowDownListener();
  startKeyDownListener();
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
        if (user1.snake.horAdder != SPACE) {
          user1.snake.verAdder = 0;
          user1.snake.horAdder = -SPACE;
        }
        break;
        
      case ARROWRIGHT:
        if (user1.snake.horAdder != -SPACE) {
          user1.snake.verAdder = 0;
          user1.snake.horAdder = SPACE;
        }
        break;
          
      case ARROWUP:
        if(user1.snake.verAdder != SPACE) {
          user1.snake.verAdder = -SPACE;
          user1.snake.horAdder = 0;
        }
        break;
          
      case ARROWDOWN:
        if (user1.snake.verAdder != -SPACE) {
          user1.snake.verAdder = SPACE;
          user1.snake.horAdder = 0;
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
        if (user2.snake.horAdder != SPACE) {
          user2.snake.verAdder = 0;
          user2.snake.horAdder = -SPACE;
        }
        break;
        
      case KEYRIGHT:
        if (user2.snake.horAdder != -SPACE) {
          user2.snake.verAdder = 0;
          user2.snake.horAdder = SPACE;
        }
        break;
          
      case KEYUP:
        if(user2.snake.verAdder != SPACE) {
          user2.snake.verAdder = -SPACE;
          user2.snake.horAdder = 0;
        }
        break;
          
      case KEYDOWN:
        if (user2.snake.verAdder != -SPACE) {
          user2.snake.verAdder = SPACE;
          user2.snake.horAdder = 0;
        }
        break;
          
      default:
        break;
    }
  });
}