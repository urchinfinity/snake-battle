library userManager;

//import 'dart:html';
//import 'dart:async';
import 'snake.dart';
import 'challenge.dart';
import 'initialData.dart';

class User {
  Snake snake;
  ChalGroup chal;
  int uid;
  
  User (this.uid) {
    if (uid == USER1ID) {
      snake = new Snake(USER1LEFT, USER1TOP, uid);
      ChalGroup chal = new ChalGroup(CHAL1LEFT, CHALTOP);
    } else {
      snake = new Snake(USER2LEFT, USER2TOP, uid);
      ChalGroup chal = new ChalGroup(CHAL2LEFT, CHALTOP);
    }
  }
  
//  void startTimer(User user2) {
////    action = new Timer.periodic(new Duration(milliseconds: duration), (Timer T) => actionController(T, user2));
//       action.start();
//    
//  }
}