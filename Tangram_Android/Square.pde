class Square extends Triangle {

  Square(color tempc, float tempXpos, float tempYpos, float temp_e, float temp_ang) {
    super(tempc, tempXpos, tempYpos, temp_e, temp_ang);
  }

  void figura() {
    quad(0-l4, 0, 0, 0-l4, 0+l4, 0, 0, 0+l4);
  }
}
