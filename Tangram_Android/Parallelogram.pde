class Parallelogram extends Triangle {
int sha=0;
  Parallelogram(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
    radius=radius*2*escala;
  }

  void display() {
    super.display();
    float delta = PVector.angleBetween(accelerometer, p_accelerometer); 
    if (encima_figura(mouseX, mouseY, xpos, ypos, radius) && degrees(delta) > 45) {    
      escala=(escala*-1);
      
      println(sha+".shake");
      sha=sha+1;
      delay(100);
    }
  
  }
  
  void figura(){
    float delta = PVector.angleBetween(accelerometer, p_accelerometer); 
    if(encima_figura(mouseX, mouseY, xpos, ypos, radius) && degrees(delta)>70){
      escala=escala*-1;
          println(escala);
    }
   scale(escala,escala);
   quad(0-l8, 0-l8, 0+(3*l8), 0-l8, 0+l8, 0+l8, 0-(3*l8), 0+l8);
  }
}
