import 'gameManager.dart';

void main() {
  createBox();
  createBall();
  createChallenge();
  createObstacle();
  startGame();
//  for (int i = 0; i < 2; i++) {
//      Prop singleProp = new Prop();
//      prop.add(singleProp);
//  }
  
  startArrowDownListener();
  startKeyDownListener();
}