class Parallelogram extends Triangle {
  int shake=0;
  Parallelogram(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
  }


  void figura() {
    float delta = PVector.angleBetween(accelerometer, p_accelerometer); 
    if (degrees(delta)>70) {
      println(shake+".shake");
      shake=shake+1;
      delay(100);
    }
    if (shake<=3) {
      quad(0-l8, 0-l8, 0+(3*l8), 0-l8, 0+l8, 0+l8, 0-(3*l8), 0+l8);
    }
    if (shake>3 && shake<=6) {
      quad(0-(3*l8), 0-l8, 0+l8, 0-l8, 0+(3*l8), 0+l8, 0-l8, 0+l8);
      if(shake>=6)shake=0;
    }
  }
}
