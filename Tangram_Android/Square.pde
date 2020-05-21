class Square extends Triangle {

  Square(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
     radius=radius*2*escala;
  }

  void figura(){
   quad(0-l4, 0, 0, 0-l4, 0+l4, 0, 0, 0+l4);
  }
}
