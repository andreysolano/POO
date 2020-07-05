//--------------------------- ROBOT ARM ------------------------//
//Instrucciones: 
// 1. Ubicarse a por lo menos dos metros de la camara, enfocando al menos sobre las rodillas.
// 2. La mano derecha controlará el brazo del robot, El movimineto vertical y el horizontal. <Controles invertidos>
// 3. La mano derecha controlará el moviemiento de la cámara.

// El código utiliza PoseNet, mediante la libreria de de ml5.js  ---> https://ml5js.org/
// Además usa WEBGL para la renderización del brazo róbotico   ---> https://github.com/processing/p5.js/wiki/Getting-started-with-WebGL-in-p5 
// El diseño del brazo fue realizado por Coretech ---> https://www.dropbox.com/s/sr4gk1y5mlxrrid/demoRobot.zip?dl=1

let video;
let poseNet;

let r_Wrist = new p5.Vector();
let l_Wrist = new p5.Vector();

let base;
let shoulder;
let upArm;
let loArm;
let end;

let angle = 0;


function preload() {
  base = loadModel('data/r1.obj');
  shoulder = loadModel('data/r2.obj');
  upArm = loadModel('data/r3.obj');
  loArm = loadModel('data/r4.obj');
  end = loadModel('data/r5.obj');
}

function setup() {
  createCanvas(600, 600, WEBGL);
  video = createCapture(VIDEO);
  poseNet = ml5.poseNet(video, modelReady);
  poseNet.on('pose', gotPoses);
}

function modelReady() {
  console.log('model ready');
}

function gotPoses(poses) {
  
  if (poses.length > 0) {

    let wX = poses[0].pose.keypoints[10].position.x;
    let wY = poses[0].pose.keypoints[10].position.y;
    let lwX = poses[0].pose.keypoints[9].position.x;
    let lwY = poses[0].pose.keypoints[9].position.y;

    r_Wrist.x = lerp(r_Wrist.x, wX, 0.6);
    r_Wrist.y = lerp(r_Wrist.y, wY, 0.6);
    l_Wrist.x = lerp(l_Wrist.x, lwX, 0.6);
    l_Wrist.y = lerp(l_Wrist.y, lwY, 0.6);
  }
}




function draw() {

  background(42);
  directionalLight(103, 103, 103, 0, 0, 1);
  directionalLight(62, 56, 0, -1, 0, 0);
  ambientLight(113, 113, 113);
  noStroke();



  let x2 = map(r_Wrist.x, 0, width, 0, 10, true);
  let y2 = map(r_Wrist.y, 0, height, 7, 18, true);
  let x3 = map(l_Wrist.x, 0, width, 15, 25, true);
  
  push();
  translate(0,175);
  fill(12, 191,10);
  rotateX(HALF_PI);
  plane(1000,1000);
  pop();
  
  
  
  rotate(PI);
  scale(3);
  
  push();
  translate(0, -33, 0);
  specularMaterial(250, 0, 0);
  fill('#AAAAAA');
  model(end);
  pop();

  rotateY(x3);

  fill('#FFE308');
  translate(0, -30, 0);
  push();
  specularMaterial(250, 255, 0);
  fill('#FFF700');
  rotateY(x2);
  model(base);

  translate(0, 25, 0);
  rotateX(y2);

  specularMaterial(250, 255, 0);
  fill('#FFF700');
  model(shoulder);


  translate(0, 0, 50);
  rotateX(degrees(30));

  rotateX(y2);
  specularMaterial(250, 255, 0);
  fill('#FFF700');
  model(upArm);

  translate(0, 0, -50);
  rotateX(degrees(130));
  specularMaterial(250, 0, 0);
  fill('#AAAAAA');
  model(loArm);
  pop();
}
