library initialData;

import 'dart:html';
import 'dart:math';
import 'ball.dart';
import 'skill.dart';
import 'helper.dart';
import 'userManager.dart';
import 'animator.dart';


const ARROWLEFT = 37;
const ARROWRIGHT = 39;
const ARROWUP = 38;
const ARROWDOWN = 40;

const KEYLEFT = 65;
const KEYRIGHT = 68;
const KEYUP = 87;
const KEYDOWN = 83;

const USER1LEFT = 400;
const USER1TOP = 100;
const USER2LEFT = 100;
const USER2TOP = 100;

const CHAL1LEFT = 400;
const CHAL2LEFT = 20;
const CHALTOP = -15;
const BALLGAP = 15;

const BOARDWIDTH = 500;
const BOARDHEIGHT = 400;
const BOARDMARGIN = 80;

const BOXWIDTH = 10;
const BOXHEIGHT = 10;
const BORDERWIDTH = 2;
const THINWIDTH = 1;

const SHIFTLEFT = 0;
const SHIFTRIGHT = 1;
const SHIFTUP = 2;
const SHIFTDOWN = 3;

const SPACE = 10;
const DISTANCE = 30;
const ROW = 8;
const COLUMN = 11;
const DURATION = 120;
const SPEEDRATE = 0.995;
const COLORNUM = 6;
const INITBOXLEN = 10;
const INITBALLLEN = 5;
const INITCHALLEN = 5;
const INITWALLLEN = 50;

final String INITCOLOR = '#FFF';
final String SKILLCOLOR = '#AAA';
final List<String> DIVCOLOR = ['#46A3FF', '#FFD306', '#FF8000', '#CA8EC2', '#FF5151', '#02DF82'];


DivElement gameBoard = querySelector('#game_board');
int chalLen;
List<String> chalColor = new List(INITCHALLEN); 

Random random = new Random();

List<Ball> ball = new List();
List<Skill> skill = new List();

User user1 = new User(USER1LEFT, USER1TOP);
User user2 = new User(USER2LEFT, USER2TOP);

Helper helper = new Helper();
Animator animator = new Animator();