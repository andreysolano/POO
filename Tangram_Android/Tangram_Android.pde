//Libreria Ketai para los sensores 
import ketai.sensors.*;
import android.hardware.SensorManager;
KetaiSensor sensor;
PVector accelerometer= new PVector();
PVector p_accelerometer=new PVector();

Triangle triangle1;
Triangle triangle2;
Triangle triangle3;
Square square;
Parallelogram parallelogram;

void setup() {
  fullScreen();
  noStroke();
  orientation(LANDSCAPE);    
  fill(0);
  sensor = new KetaiSensor(this);
  sensor.start();
  //Triangulo amarillo
  triangle1 = new Triangle(color(238, 241, 42), width/4, height/4, 1,0);
  //Triangulo Verde
  triangle2 = new Triangle(color(93, 241, 42), width/2, height/2, 2,0);
  //Triangulo morado 
  triangle3= new Triangle(color(152, 50, 138), 100,height/2, sqrt(2),0);
  
  square=new Square(color(110, 44, 0),400,300,1,0);
  
  parallelogram= new Parallelogram(color(113, 125, 126),1200,500,1,0);
}



void draw() {
  background(54,54,54);
  drawGrid(10);
  triangle1.display();
  triangle2.display();
  triangle3.display();
  square.display();
  parallelogram.display();
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
