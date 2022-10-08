//===GAME POINTS===
let points1 = 0;
let points2 = 0;
//=================

//===BALL===
//---start position---
let xBall = 300;
let yBall = 200;

//---Measures of the ball---
let diameterBall = 25;
let radiusBall= diameterBall/2;

//---speed of the ball---
let speedXBall = 4;
let speedYBall = 4;
//=========

//===Measures of the ALL rects===
let widthRect = 10;
let heightRect = 90;

//===RECT1===
//---start position of the rect1---
let xRect1 = 5;
let yRect1 = 150;

//---hit---
let hit = false;
//===========


//===RECT2===
//---start position of the rect1---
let xRect2 = 585;
let yRect2 = 150;

let speedYRect2;

//---hit---
let hit2 = false;
//===========

//---screen size---
function setup() {
  createCanvas(600, 400);
}

//---main--
function draw() {
  background(0);//change color to black
  showBall();
  movesBall();
  collidedEdge();
  showRect(xRect1,yRect1); //Show rect1
  showRect(xRect2, yRect2); //Show rect2
  movesRect1();
  //movesRect2();
  movesRect2_2();
  //hitRect();
  hitRectLibraries(xRect1,yRect1)
  hitRectLibraries(xRect2,yRect2);
  includesScore();
  score()
}

function showBall(){
  circle(xBall, yBall, diameterBall);
}

function showRect(x,y){
  rect(x,y,widthRect,heightRect);
}

function movesBall(){
  xBall += speedXBall;
  yBall += speedYBall;
}

function collidedEdge(){
  if(xBall  + radiusBall > width ||//Rigth side of the ball
     xBall - radiusBall < 0){//Left side of the ball
     speedXBall*=-1;
  }
  if(yBall + radiusBall > height ||//Bottom side of the ball
     yBall - radiusBall <0){//Top side of the ball
     speedYBall*=-1;
  }
}

function movesRect1(){
  //up arrow key
  if(keyIsDown(UP_ARROW)){
    yRect1 -= 10;
  }
  //down arrow key
  if(keyIsDown(DOWN_ARROW)){
    yRect1 += 10;
  }
}

function movesRect2(){
  speedYRect2 = yBall - yRect2 - (widthRect/2) - 30;
  yRect2 += speedYRect2;
}

function movesRect2_2(){
  //up arrow key
  if(keyIsDown(87)){//w
    yRect2 -= 10;
  }
  //down arrow key
  if(keyIsDown(83)){//s
    yRect2 += 10;
  }
}

function hitRect(){
  if((xBall - radiusBall< xRect1 + widthRect)&& (yBall - radiusBall < yRect1 + heightRect) && (yBall + radiusBall > yRect1)){
    speedXBall *= -1;
  }
}

function hitRectLibraries(x, y){
  hit = collideRectCircle(x, y, widthRect, heightRect, xBall, yBall, radiusBall);
  if(hit){
    speedXBall *= -1;
  }
}

function includesScore(){
  stroke(255);
  textAlign(CENTER);
  textSize(20);
  fill(color(255, 140, 0));
  rect(130,10,40,20);
  fill(255)//change color
  text(points1,150,26);
  fill(color(255, 140, 0));
  rect(430,10,40,20);
  fill(255)//change color
  text(points2,450,26);
}

function score(){
  if(xBall > 585){
    points1 += 1;
  }
  if(xBall < 15){
    points2 += 1;
  }
}