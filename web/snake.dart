library snake;

import 'box.dart';
import 'animator.dart';
import 'initialData.dart';

class Snake extends Actor {
  List<Box> box = new List();
  int targetBox = 0;
  int left;
  int top;
  int uid;
  int verAdder = SPACE;
  int horAdder = 0;
  int duration = DURATION;
  int times = 0;
  bool maxLen = false;
  
  Snake (this.left, this.top, this.uid) {
    createSnake();
    initBorder();
  }
  
  void createSnake() {
    for (int i = 0; i < INITBOXLEN; i++) {
      Box singlebox = new Box.snake(left, top - i * SPACE);
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
  
  void next(num time) {
    if (times == duration) {
      resetSnakePos();
      ballGroup.detectBallIsEaten();
      detactTouchSelfBody();
//      if (uid == USER1ID) {
//        detectTouchUser2Body(user1.snake);
//      } else {
//        detectTouchUser2Body(user2.snake);
//      }
      
      times = 0;
    } else {
      times++;
    }
  }
  
  void resetSnakePos() {
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
  
  void detactTouchSelfBody() {
    for(int i = 1; i < targetBox; i++) {
      if (box[i].leftPos == box[0].leftPos && box[i].topPos == box[0].topPos) {
        
        //do something
        
        break;
      }
    }
  }
  
  void detectTouchUser2Body(Snake snake2) {
    for(int i = 0; i < snake2.targetBox; i++) {
      if (snake2.box[i].leftPos == box[0].leftPos && snake2.box[i].topPos == box[0].topPos) {
        shiftColorToHead(snake2.box[i].color);
        targetAdder();
        
        if (uid == USER1ID) {
          user2.snake.shiftEmptyColor(i);
          user1.chal.changeChallenge(snake2.box[i].color, uid);
        } else {
          user1.snake.shiftEmptyColor(i);
          user2.chal.changeChallenge(snake2.box[i].color, uid);
        }
    
        //change speed
        break;
      }
    }
  }
  
  void shiftColorToHead(String color) {
    for (int i = targetBox; i > 0; i--) {
      box[i].changeColor(box[i - 1].color);
    }
    box[0].changeColor(color);
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
  
  void AddSpeed() {
    duration = (duration * SPEEDRATE).toInt();
  }
}
