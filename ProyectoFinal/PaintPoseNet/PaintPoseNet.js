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

let canvas; 
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

  canvas = createGraphics(640, 480);
  canvas.background(255, 255, 255);

  pointer = loadImage('data/pointer.png');
  rect(0, 0, 100, 100);
  
  boton1 = new Boton(570,60,40,40,245,64,64);
  boton2 = new Boton(570,120,40,40,245,239,49);
  boton3 = new Boton(570,180,40,40,50,100,200);
  boton4= new Boton(570,240,40,40,0,255,0);
  botonImg1 = new BotonImg(570, 300, 40, 40, 255, 255, 255, imgBorr);
  guardar= new Guarda(570, 360, 40, 40, 255, 255, 255, imgGuar, c);
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
  canvas.noStroke();
  canvas.fill(pincelR, pincelG, pincelB);        //<-------****
  canvas.ellipse(r_Wrist.x, r_Wrist.y, d);
  
  
  image(canvas, 0, 0);

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
}


  
  



function click( x, y, w, h, px, py) {

  if (px >= x && px <= x + w && py >= y && py <= y + h) {  
    return true;
  } else {
    return false;
  }
}
