//===cars====
let widthCar = 50;
let heightCar = 40;
let xCars = [600,600,600,600,600,600]
let yCars = [40,96,150,210,270,318];
let speedCars =[2, 3, 2.5, 4 , 2.2, 3.2]
//===========


function showCars(){
  for(let i = 0; i < xCars.length; i++){
    image(imgCars[i],xCars[i],yCars[i], widthCar, heightCar);
  }
}

function moveCar(){
  for(let i = 0; i < xCars.length;i++){
    xCars[i]-=speedCars[i];
  }
}

function startAgain(){
  for(let i = 0; i < xCars.length;i++){
    if(xCars[i]<-50){
      xCars[i] = 600;
    }
  }
}