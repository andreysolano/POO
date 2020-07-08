// Este programa usa la libreria ml5js 
// Usando PoseNote que es un protocolo de Learning Machine
// https://www.tensorflow.org/lite/models/pose_estimation/overview
// https://github.com/tensorflow/tfjs-models/tree/master/posenet

let video;
let poseNet;
let nose = new p5.Vector();
let imgBorr;

let eye1X = 0;
let eye1Y = 0; 

let r_Wrist = new p5.Vector();
let l_Wrist = new p5.Vector();

let canvas0;  //******
let canvas1;
let canvas2;
let canvas3;

let canvasUsed = 0;

let pointer; 

let pincelR = 0;
let pincelG = 0;
let pincelB = 0;

function preload(){
  imgBorr = loadImage('borrador.png');
  imgGuar = loadImage('guardar.png');
}

function setup() {

  let c=createCanvas(640, 480);
  video = createCapture(VIDEO);
  //video.hide();


  console.log(ml5);
  poseNet = ml5.poseNet(video, modelReady);
  poseNet.on('pose', gotPoses);

  canvas0 = createGraphics(640, 480); //**
  canvas1 = createGraphics(640, 480);
  canvas2 = createGraphics(640, 480);
  canvas3 = createGraphics(640, 480);
  
  canvas0.background(255); //**
  canvas1.background(100);
  canvas2.background(0); 
  canvas3.background(180);

  pointer = loadImage('data/pointer.png');
  rect(0, 0, 100, 100);
  
  boton1 = new Boton(570,60,40,40,245,64,64);
  boton2 = new Boton(570,120,40,40,245,239,49);
  boton3 = new Boton(570,180,40,40,50,100,200);
  boton4= new Boton(570,240,40,40,0,255,0);
  botonImg1 = new BotonImg(570, 300, 40, 40, 255, 255, 255, imgBorr);
  guardar= new Guarda(570, 360, 40, 40, 255, 255, 255, imgGuar, c);
  botonCanvas0 = new BotonCanvas(500,60,40,40,245,64,64,0);
  botonCanvas1 = new BotonCanvas(500,120,40,40,245,239,49,1);
  botonCanvas2 = new BotonCanvas(500,180,40,40,50,100,200,2);
  botonCanvas3 = new BotonCanvas(500,240,40,40,0,255,0,3);
  botonFiltro0 = new BotonFiltro(450,60,40,40,245,64,64);
  botonFiltro1 = new BotonFiltro(450,120,40,40,245,239,49);
  botonFiltro2 = new BotonFiltro(450,180,40,40,50,100,200);
}

function modelReady() {
  console.log('model ready');
}


function gotPoses(poses) {

  if (poses.length > 0) {
    let nX = poses[0].pose.keypoints[0].position.x;
    let nY = poses[0].pose.keypoints[0].position.y;
    let eX = poses[0].pose.keypoints[1].position.x;
    let eY = poses[0].pose.keypoints[1].position.y;
    let wX = poses[0].pose.keypoints[10].position.x;
    let wY = poses[0].pose.keypoints[10].position.y;
    let lwX = poses[0].pose.keypoints[9].position.x;
    let lwY = poses[0].pose.keypoints[9].position.y;


    nose.x = lerp(nose.x, nX, 0.5);
    nose.y = lerp(nose.y, nY, 0.5);
    eye1X = lerp(eye1X, eX, 0.5);
    eye1Y = lerp(eye1Y, eY, 0.5);


    r_Wrist.x = lerp(r_Wrist.x, wX, 0.2);
    r_Wrist.y = lerp(r_Wrist.y, wY, 0.2);

    l_Wrist.x = lerp(l_Wrist.x, lwX, 0.2);
    l_Wrist.y = lerp(l_Wrist.y, lwY, 0.2);
  }
}





function draw() {
  
  
  
  translate(video.width, 0);
  scale(-1, 1);

  //image(video, 0, 0, video.width, video.height);

  
  let d = dist(nose.x, nose.y, eye1X, eye1Y);
  

  ////**** condicionales para las capas ****////
  if(canvasUsed == 0){
    canvas0.noStroke();
    canvas0.fill(pincelR, pincelG, pincelB);        
    canvas0.ellipse(r_Wrist.x, r_Wrist.y, d);
    image(canvas0, 0, 0);
  }else{
    if(canvasUsed == 1){
      canvas1.noStroke();
      canvas1.fill(pincelR, pincelG, pincelB);        
      canvas1.ellipse(r_Wrist.x, r_Wrist.y, d);
      image(canvas1, 0, 0);
    }else{
      if(canvasUsed == 2){
        canvas2.noStroke();
        canvas2.fill(pincelR, pincelG, pincelB);        
        canvas2.ellipse(r_Wrist.x, r_Wrist.y, d);
        image(canvas2, 0, 0);
      }else{
        if(canvasUsed == 3){
          canvas3.noStroke();
          canvas3.fill(pincelR, pincelG, pincelB);        
          canvas3.ellipse(r_Wrist.x, r_Wrist.y, d);
          image(canvas3, 0, 0);
        }
      }
    }
  }

  image(pointer, l_Wrist.x, l_Wrist.y, d, d );  
  
  
  
  
  boton1.show();
  boton2.show();
  boton3.show();
  boton4.show();
  boton1.action();
  boton2.action();
  boton3.action();
  boton4.action();
  botonImg1.showImg();
  botonImg1.action();
  guardar.show();
  guardar.showImg();
  guardar.saver();
  botonCanvas0.showN();
  botonCanvas1.showN();
  botonCanvas2.showN();
  botonCanvas3.showN();
  botonCanvas0.setCanvas();
  botonCanvas1.setCanvas();
  botonCanvas2.setCanvas();
  botonCanvas3.setCanvas();
  botonFiltro0.showF();
  botonFiltro1.showF();
  botonFiltro2.showF();
  botonFiltro0.setFiltro();
  botonFiltro1.setFiltro();
  botonFiltro2.setFiltro();
}


  
  



function click( x, y, w, h, px, py) {

  if (px >= x && px <= x + w && py >= y && py <= y + h) {  
    return true;
  } else {
    return false;
  }
}
