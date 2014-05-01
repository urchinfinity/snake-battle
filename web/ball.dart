library ball;

import 'dart:html';
import 'initialData.dart';
import 'userManager.dart';
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
    while (helper.coverBox(left, top)) {
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
  
  bool isSamePos (User user) {
    return (user.snake.box[0].leftPos == leftPos && user.snake.box[0].topPos == topPos);
  }
  
  void increaseBall(int num) {}
  
  void decreaseBall(int num) {}
}

class BallGroup {
  List<Ball> ball = new List();
  
  BallGroup() {
    createBall();
  }
  
  void createBall() {
    for (int i = 0; i < INITBALLLEN; i++) {
      Ball singleBall = new Ball();
      ball.add(singleBall);
    }
  }
  
  void detectBallIsEaten() {
    for (int i = 0; i < ball.length; i++) {
      if (ball[i].isSamePos(user1)) {
        user1.snake.shiftColor(ball[i].color);
        //detactChallenge(ball[i].color, user2);
        ball[i].updateBall();
        
        //addSpeed = true;
        
        break;
      } else if (ball[i].isSamePos(user2)) {
        user2.snake.shiftColor(ball[i].color);
        //detactChallenge(ball[i].color, user2);
        ball[i].updateBall();
      }
    }
  }
}