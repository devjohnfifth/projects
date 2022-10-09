let imgRoad;
let imgCar1;
let imgCar2;
let imgCar3;
let imgActor1;
let imgCars;

let soundBack;
let soundPoint;
let soundHit;
function preload(){
  imgRoad = loadImage("img/estrada.png");
  imgCar1 = loadImage("img/carro-1.png");
  imgCar2 = loadImage("img/carro-2.png");
  imgCar3 = loadImage("img/carro-3.png");
  imgActor1 = loadImage("img/ator-1.png"); 
  imgCars = [imgCar1,imgCar2,imgCar3,imgCar1,imgCar2,imgCar3];
  
  soundBack = loadSound("sounds/trilha.mp3");
  soundHit = loadSound("sounds/colidiu.mp3");
  soundPoint = loadSound("sounds/pontos.wav")
}