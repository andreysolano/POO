class Triangle {

  color c;
  float xpos;
  float ypos;
  float escala;
  float angulo;
  float l= 170*displayDensity;
  float l4=l/4;
  float l8=l/8;

  Triangle(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    c=tempc;
    xpos= tempXpos;
    ypos= tempYpos;
    escala = temp_e;
    angulo=temp_ang;
    l4=l4*escala;
    l8=l8*escala;
  }

  void display() {
    fill(c);
    push();
    noStroke();
    translate(xpos, ypos);
    rotate(radians(angulo));
    figura();
    pop();
  }

  void figura() {
    triangle(0, 0-l8, 0+l4, 0+l8, 0-l4, 0+l8);
  }

  void seleccion() {

    color col_mouse;
    col_mouse= get(mouseX, mouseY);

    if ((red(col_mouse)==red(c) && green(col_mouse)==green(c) && blue(col_mouse)==blue(c))) {
      mouseDragged();

      if (touches.length>=2) {
        angulo +=45;
        delay(250);
      }
    }
  }  
  void mouseDragged() {
    xpos=mouseX;
    ypos=mouseY;
  }
}
