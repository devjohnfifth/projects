function setup() {
  createCanvas(500, 400);
  soundBack.loop();
}

function draw() {
  background(imgRoad);
  showCars();
  showActor1();
  showPoints()
  moveCar();
  startAgain()
  moveActor1();
  checkHit();
  plusPoint();
} 

