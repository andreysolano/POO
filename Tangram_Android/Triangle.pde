class Triangle {

  color c;
  float xpos;
  float ypos;
  float escala;
  float radius=25;
  float angulo;

  float l= 400;
  float l4=l/4;
  float l8=l/8;

  Triangle(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    c=tempc;
    xpos= tempXpos;
    ypos= tempYpos;
    escala = temp_e;
    radius=radius*escala;
    angulo=temp_ang;
  }

  void display() {

    if (encima_figura(mouseX, mouseY, xpos, ypos, radius)) {
      fill(255, 150, 0);
    } else fill(c);
    dibujar();

    if (seleccion(xpos, ypos)) {
      xpos=mouseX;
      ypos=mouseY;
    }

    if (tespacio(xpos, ypos)) {
      angulo +=45;
      delay(100);
    }
  }

  void dibujar() {
    float l8x=l8*escala;
    float l4x=l4*escala;

    push();
    noStroke();
    translate(xpos, ypos);
    rotate(radians(angulo));
    triangle(0, 0-l8x, 0+l4x, 0+l8x, 0-l4x, 0+l8x);
    stroke(0);
    ellipse(0, 0, radius, radius);
    pop();
  }

  // POINT/CIRCLE
  boolean encima_figura(float px, float py, float cx, float cy, float r) {
    //obtiene la distancia entre el mouse y el centro del circulo
    //usando pitagoras
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    //Si la distancia es menor que el radio, esta adentro
    if (distance <= r) {
      return true;
    }
    return false;
  }

  boolean seleccion(float cx, float cy) {
    if (mouseButton == LEFT && encima_figura(mouseX, mouseY, cx, cy, radius)) return true;
    else return false;
  }


  boolean tespacio(float cx, float cy) {
    if (keyPressed  && encima_figura(mouseX, mouseY, cx, cy, radius) ) {
      if (key == ' ') return true;
    }
    return false;
  }
}
