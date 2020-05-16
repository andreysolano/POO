class Triangle {

  color c;
  float xpos;
  float ypos;
  float escala;
  float radius=25;

  float l= 400;
  float l4=l/4;
  float l8=l/8;

  Triangle(color tempc, float tempXpos, float tempYpos, float temp_e) {
    c=tempc;
    xpos= tempXpos;
    ypos= tempYpos;
    escala = temp_e;
    radius=radius*escala;
  }

  void display() {

    if (encima_figura(mouseX, mouseY, xpos, ypos, radius)) {
      fill(255, 150, 0);
      if (mousePressed) {
        xpos=mouseX;
        ypos=mouseY;
      }
    } else {
      fill(c);
    }

    noStroke();
    float l8x=l8*escala;
    float l4x=l4*escala;
    triangle(xpos, ypos-l8x, xpos+l4x, ypos+l8x, xpos-l4x, ypos+l8x);
    stroke(0);
    ellipse(xpos, ypos, radius, radius);
    
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
}
