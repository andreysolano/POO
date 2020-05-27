class Triangle {

  color c;
  float xpos;
  float ypos;
  float escala;
  float angulo;

  float l= 200*displayDensity;
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
    dibujar();

    if (seleccion()) {

      xpos=mouseX;
      ypos=mouseY;
    }

    if (multitouch()) {
      angulo +=45;
      delay(250);
    }
  }

  void dibujar() {
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

  boolean seleccion() {
    if (mouseDragged() && above()) return true;
    else return false;
  }


  boolean multitouch() {
    if (touches.length>=2 && above() ) {
      return true;
    }
    return false;
  }
  
  boolean mouseDragged() 
  {
    return true;
  }

  boolean above() {
    color col_mouse;
    col_mouse= get(mouseX, mouseY);

    if ((red(col_mouse)==red(c) && green(col_mouse)==green(c) && blue(col_mouse)==blue(c))) {
      return true;
    }
    return false;
  }
}
