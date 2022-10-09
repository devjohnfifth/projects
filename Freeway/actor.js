//===actor===
let points = 0;
let xActor = 85;
let yActor = 366;
let widthActor = 30;
let heightActor = 30;
let hit = false;
//===========

function showActor1(){
  image(imgActor1,xActor ,yActor, widthActor,heightActor);
}

function moveActor1(){
  if(keyIsDown(UP_ARROW)){
     yActor-=2;
  }
  if(keyIsDown(DOWN_ARROW)){
     yActor+=2;
  }
  if(keyIsDown(RIGHT_ARROW)){
     xActor+=2;
  }
  if(keyIsDown(LEFT_ARROW)){
     xActor-=2;
  }
}

function checkHit(){
  for(let i = 0; i < xCars.length; i++){
    hit = collideRectCircle(xCars[i],yCars[i],widthCar,heightCar,xActor,yActor,15);
    if(hit){
      hitStart();
      soundHit.play();
      points =0;
    }
  }
}

function hitStart(){
  yActor = 380;
}

function showPoints(){
  textSize(25);
  textAlign(CENTER)
  fill(color(255, 240, 60))
  text(points, width/5, 28);
}

function plusPoint(){
  if(yActor<15){
    points+=1;
    hitStart();
    soundPoint.play();
  }
}