//Tangram Programado en Processing para Android +4.0

//Libreria Ketai para los sensores del celular
import ketai.sensors.*;
import android.hardware.SensorManager;
KetaiSensor sensor;
PVector accelerometer= new PVector();
PVector p_accelerometer=new PVector();
float contador1=0;

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


  triangle1 = new Triangle(color(93, 241, 42), 0, height/2+400, 2, 0);   //Triangulo Verde
  triangle2 = new Triangle(color(255, 8, 0 ), 0, height/2+100, 2, 0);   //Triangulo Rojo
  triangle3= new Triangle(color(152, 50, 138), 100, 0, sqrt(2), 0);  //Triangulo morado 
  parallelogram= new Parallelogram(color(113, 125, 126), 600, height, 1, 0); //Paralelogramo
  square=new Square(color(110, 44, 0), 0, 300, 1, 45); //Cuadrado
  triangle5 = new Triangle(color(238, 241, 42), width/4, 30, 1, 180);  //Triangulo amarillo
  triangle4 = new Triangle(color(50, 103, 152), width/4+400, 30, 1, 180); //Triangulo azul

  nivel1= loadImage("nivel0.png");
}



void draw() {
  background(54, 54, 54);
  drawGrid(10);
  image(nivel1, 0, 50*displayDensity, 420*displayDensity, 420*displayDensity);
  triangle1.display();
  triangle2.display();
  triangle3.display();
  parallelogram.display();
  square.display();
  triangle4.display();
  triangle5.display();


  triangle1.seleccion();
  triangle2.seleccion();
  triangle3.seleccion();
  parallelogram.seleccion();
  square.seleccion();
  triangle4.seleccion();
  triangle5.seleccion();




  cuentapixeles();
  println(contador1);  
  p_accelerometer.set(accelerometer);
  
  
  
  float progress = (contador1-2000)/60000;
  fill(16, 255, 13);
  print(width - (width*progress));
  rect(0, 0, width-(width*progress), 10*displayDensity);
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





void cuentapixeles() {
  //recibir los pixeles del canvas
  loadPixels();
  // reiniciar contador de blancos
  contador1=0;
  // for que revise cada pixel del canvas
  for (int i=0; i<width/2*height; i++) {
    //extraer los rgb de cada pixel
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    i=i+5;
    // comparar cada valor con los de blanco, y si es blanco el contador aumenta.
    if (r==245 & g==206 & b==197) {  
      contador1++;
    }
  }
}





boolean win(float contador) {
  if (contador<50) return false;
  else return true;
}
