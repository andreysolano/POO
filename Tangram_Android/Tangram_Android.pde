Triangle triangle1;
Triangle triangle2;
Triangle triangle3;



void setup() {
  fullScreen();
  noStroke();
  fill(0);
  //Triangulo amarillo
  triangle1 = new Triangle(color(238, 241, 42), width/4, height/4, 1);
  //Triangulo Verde
  triangle2 = new Triangle(color(93, 241, 42), width/2, height/2, 2);
  //Triangulo morado 
  triangle3= new Triangle(color(152, 50, 138), 100,height/2, sqrt(2));
}



void draw() {
  background(54,54,54);
  drawGrid(30);
  triangle1.display();
  triangle2.display();
  triangle3.display();
}




void drawGrid(float scale) {
  push();
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
