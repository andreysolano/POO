//Clase Boton con miniatura 
class Boton_mini extends Boton {


  Boton_mini(float tempX, float tempY, float tempW, float tempH, float tempc, int tempnum) {
    super(tempX, tempY, tempW, tempH, tempc, tempnum);
  }

  void display() {
    rect(x, y, w, h, c);
    image(niveles[num], x, y, w, h);
  }
}
