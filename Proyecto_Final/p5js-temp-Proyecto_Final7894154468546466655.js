// Este programa usa la libreria ml5js 
// Usando PoseNote que es un protocolo de Learning Machine
// https://www.tensorflow.org/lite/models/pose_estimation/overview
// https://github.com/tensorflow/tfjs-models/tree/master/posenet

let video;
let poseNet;
let noseX = 0;
let noseY = 0;
let eye1X = 0;
let eye1Y = 0; 


let r_Wrist = new p5.Vector();
let r_WristX = 0;
let r_WristY = 0;

let l_WristX = 0;
let l_WristY = 0;

let boton1 ;




function setup() {
  createCanvas(640, 480);
  video = createCapture(VIDEO);
  //video.hide();

  console.log(ml5);
  poseNet = ml5.poseNet(video, modelReady);
  poseNet.on('pose', gotPoses);

  boton1 = new Boton(0, 0, 40, 40, 1); 

}


function draw() {

  push();
  translate(video.width, 0);
  scale(-1, 1);
  //image(video, 0, 0, video.width, video.height);
  
  
  let d = dist(noseX, noseY, eye1X, eye1Y);
  noStroke();

  if (l_WristY >= 300) {
    fill(255, 0, 0);
    ellipse(r_Wrist.x, r_Wrist.y, d);
  } else {
    fill(255);
    ellipse(r_Wrist.x, r_Wrist.y, d);
  }
  pop();
  
  
  fill(35,120,56);
  boton1.show();
  

}


function modelReady() {
  console.log('model ready');
}


function gotPoses(poses) {
  //console.log(poses);
  if (poses.length > 0) {
    let nX = poses[0].pose.keypoints[0].position.x;
    let nY = poses[0].pose.keypoints[0].position.y;
    let eX = poses[0].pose.keypoints[1].position.x;
    let eY = poses[0].pose.keypoints[1].position.y;
    let wX = poses[0].pose.keypoints[10].position.x;
    let wY = poses[0].pose.keypoints[10].position.y;
    let lwX = poses[0].pose.keypoints[9].position.x;
    let lwY = poses[0].pose.keypoints[9].position.y;


    noseX = lerp(noseX, nX, 0.5);
    noseY = lerp(noseY, nY, 0.5);
    eye1X = lerp(eye1X, eX, 0.5);
    eye1Y = lerp(eye1Y, eY, 0.5);

    r_Wrist.x = lerp(r_Wrist.x, wX, 0.2);
    r_Wrist.y = lerp(r_Wrist.y, wY, 0.2);

    l_WristX = lerp(l_WristX, lwX, 0.2);
    l_WristY = lerp(l_WristY, lwY, 0.2);
  }
}
