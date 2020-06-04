//Libreria Ketai para los sensores 
import ketai.sensors.*;
import android.hardware.SensorManager;
KetaiSensor sensor;
PVector accelerometer= new PVector();
PVector p_accelerometer=new PVector();

Triangle triangle1;
Triangle triangle2;
Triangle triangle3;
Triangle triangle4;
Triangle triangle5;
Square square;
Parallelogram parallelogram;
PImage nivel1;
void setup() {
  fullScreen();
  orientation(PORTRAIT);    
  fill(0);
  sensor = new KetaiSensor(this);
  sensor.start();
  //Triangulo Verde
  triangle1 = new Triangle(color(93, 241, 42), 0, height/2+400, 2, 0);

  //Triangulo Rojo
  triangle2 = new Triangle(color(255, 8, 0 ), 0, height/2+100, 2, 0);

  //Triangulo morado 
  triangle3= new Triangle(color(152, 50, 138), 100, 0, sqrt(2), 0);
  
  parallelogram= new Parallelogram(color(113, 125, 126), 600, height, 1, 0);
  
  square=new Square(color(110, 44, 0), 0, 300, 1, 45);

  //Triangulo amarillo
  triangle5 = new Triangle(color(238, 241, 42), width/4, 30, 1, 180);
  
  //Triangulo azul
  triangle4 = new Triangle(color(50, 103, 152), width/4+400, 30, 1, 180);
  
  nivel1= loadImage("nivel2.png");
}



void draw() {
  background(54, 54, 54);
  drawGrid(10);
  imageMode(CENTER);
  image(nivel1,width/2,height/2,396*displayDensity,396*displayDensity);
  triangle1.display();
  triangle2.display();
  triangle3.display();
  parallelogram.display();
  square.display();
  triangle4.display();
  triangle5.display();
  
  
  p_accelerometer.set(accelerometer);
}




void drawGrid(float scale) {
  push();
  scale=scale*displayDensity;
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}


void onAccelerometerEvent(float x, float y, float z) {

  accelerometer.x = x;                                 
  accelerometer.y = y;
  accelerometer.z = z;
}
