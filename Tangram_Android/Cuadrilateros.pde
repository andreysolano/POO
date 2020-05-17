class Square extends Triangle {

  Square(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
  }

  void display() {
    super.display();
  }

  void dibujar() {
    float l4x=l4*escala;
    push();
    noStroke();
    translate(xpos, ypos);
    rotate(radians(angulo));
    quad(0-l4x, 0, 0, 0-l4x, 0+l4x, 0, 0, 0+l4x);
    stroke(0);
    ellipse(0, 0, radius*2, radius*2);
    pop();
  }
}


class Parallelogram extends Triangle {

  Parallelogram(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
  }

  void display() {
    super.display();
  }

  void dibujar() {
    float l8x=l8*escala;
    push();
    noStroke();
    translate(xpos, ypos);
    rotate(radians(angulo));
    quad(0-l8x, 0-l8x, 0+(3*l8x), 0-l8x, 0+l8x, 0+l8x, 0-(3*l8x), 0+l8x);
    stroke(0);
    ellipse(0, 0, radius*2, radius*2);
    pop();
  }
}
